// エントリーポイント

import express from "express";
import multer from "multer";
import { analyzeImage } from "./gemini/gemini.js";
import type { Result } from "./types/types.js";
import { getMoleculeInfo } from "./pubchem/pubchem.js";
import { convertSdfToGlb } from "./converter/converter.js";
import { searchCompoundsByElement } from "./gemini/search.js";
import { getMoleculeNameFromFormula } from "./gemini/molecule-search.js";
import { cidsToSdfs } from "./pubchem/cidtosdf.js";

const app = express();

// JSONリクエストボディをパースするためのミドルウェア
app.use(express.json());

const upload = multer({ storage: multer.memoryStorage() });

// CORS設定
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
  
  if (req.method === 'OPTIONS') {
    res.sendStatus(200);
  } else {
    next();
  }
});

app.post("/api/analyze", upload.single("image"), async (req, res) => {
    try {
        if (!req.file) {
            return res.status(400).json({ error: "No file provided" });
        }

        const analysisResult: Result | null = await analyzeImage(
            req.file.buffer,
            req.file.mimetype
        );

        if (!analysisResult || !analysisResult.molecules || analysisResult.molecules.length === 0) {
            return res.status(404).json({ error: "Could not analyze image or find molecules." });
        }

        const moleculesWithData = await Promise.all(
            analysisResult.molecules.map(async (molecule) => {
                const moleculeInfo = await getMoleculeInfo(molecule.name);
                return {
                    ...molecule,
                    cid: moleculeInfo?.cid ?? null,
                    sdf: moleculeInfo?.sdf ?? null,
                    formula: molecule.formula || '', // Geminiから取得した分子式を追加
                };
            })
        );

        res.json({
            object: analysisResult.objectName,
            molecules: moleculesWithData,
        });

    } catch (e) {
        console.error(e);
        res.status(500).json({ error: "Analysis failed" });
    }
});

// SDFデータ(text/plain)を受け取り、GLBファイルを返すエンドポイント
app.post("/api/convert", express.text({ type: 'text/plain', limit: '1mb' }), async (req, res) => {
    const sdfData = req.body;
    if (typeof sdfData !== 'string' || !sdfData) {
        return res.status(400).json({ error: "SDF data (string) is required" });
    }

    try {
        const glbBuffer = await convertSdfToGlb(sdfData);

        // GLBファイルをバイナリとして直接返す
        res.set({
            'Content-Type': 'model/gltf-binary',
            'Content-Disposition': 'attachment; filename="molecule.glb"',
            'Content-Length': glbBuffer.length.toString()
        });

        res.send(glbBuffer);

    } catch (error) {
        console.error('Request to /convert failed:', error);
        if (!res.headersSent) {
            res.status(500).json({ error: 'Failed to convert SDF to GLB' });
        }
    }
});

// 日本語・ひらがなの元素名と元素記号の対応表
const elementSymbolMap: { [key: string]: string } = {
    'すいそ': 'H', '水素': 'H',
    'ほうそ': 'B', 'ホウ素': 'B',
    'たんそ': 'C', '炭素': 'C',
    'ちっそ': 'N', '窒素': 'N',
    'さんそ': 'O', '酸素': 'O',
    'ふっそ': 'F', 'フッ素': 'F',
    'ナトリウム': 'Na',
    'マグネシウム': 'Mg',
    'アルミニウム': 'Al',
    'けいそ': 'Si', 'ケイ素': 'Si',
    'りん': 'P', 'リン': 'P',
    'いおう': 'S', '硫黄': 'S',
    'えんそ': 'Cl', '塩素': 'Cl',
    'カリウム': 'K',
    'カルシウム': 'Ca',
    'ヨウ素': 'I', 'ようそ': 'I', 'ヨウソ': 'I',
};

// バリデーション用に、有効な入力（日本語名、ひらがな、元素記号の大文字・小文字）のセットを作成
const validInputs = new Set<string>(Object.keys(elementSymbolMap));
Object.values(elementSymbolMap).forEach(symbol => {
    validInputs.add(symbol);
    validInputs.add(symbol.toLowerCase());
});

// 元素記号による化合物検索エンドポイント
app.get("/api/search", async (req, res) => {
    const userInput = (req.query.element as string) || '';

    // デバッグ用に受け取った値をログに出力
    console.log(`[Search Endpoint] Received userInput: '${userInput}'`);

    if (!userInput) {
        return res.status(400).json({ error: "Query parameter 'element' is required." });
    }

    // 入力値のバリデーション
    if (!validInputs.has(userInput.toLowerCase())) {
        return res.status(400).json({ error: `Invalid element query: '${userInput}'. Please provide a valid element name or symbol.` });
    }

    // ユーザーの入力を元素記号に変換（小文字化してマップを引く）
    const elementSymbol = elementSymbolMap[userInput.toLowerCase()] || userInput.toUpperCase();

    try {
        const compounds = await searchCompoundsByElement(elementSymbol);
        // 成功した場合は配列を直接返す
        res.json(compounds);
    } catch (e) {
        // searchCompoundsByElement内でエラーが発生した場合
        console.error(`Search failed for element '${elementSymbol}':`, e);
        res.status(500).json({ error: "An internal server error occurred during the search." });
    }
});

// 複数のCIDを含むオブジェクト配列を受け取り、それぞれにSDFデータを付与して返すエンドポイント
app.post("/api/cidtosdf", async (req, res) => {
    const requestData = req.body;

    // リクエストボディが配列であるかを検証
    if (!Array.isArray(requestData)) {
        return res.status(400).json({ error: "Request body must be an array of objects." });
    }

    // 配列からCIDのみを抽出（nullやundefinedのcidsは除外）
    const cids = requestData
        .map(item => item.cids)
        .filter((cid): cid is number => cid != null && typeof cid === 'number');

    if (cids.length === 0) {
        // CIDが含まれていない場合は、元のデータをそのまま返すか、エラーを返すか選択できます。
        // ここでは元のデータをそのまま返します。
        return res.json(requestData);
    }

    try {
        // SDFデータを一括取得
        const sdfResults = await cidsToSdfs(cids);

        // 取得したSDFをCIDをキーにしたMapに変換し、高速に検索できるようにする
        const sdfMap = new Map(sdfResults.map(item => [item.cid, item.sdf]));

        // 元のデータにSDFをマージ
        const responseData = requestData.map(item => {
            const sdf = sdfMap.get(item.cids);
            return {
                ...item,
                sdf: sdf || null, // SDFが見つからなかった場合はnullを設定
            };
        });

        res.json(responseData);

    } catch (error) {
        console.error(`Error in /cidtosdf endpoint:`, error);
        res.status(500).json({ error: "An internal server error occurred while fetching SDF data." });
    }
});

// 分子検証エンドポイント
app.post('/api/molecule/validate-structure', async (req, res) => {
    const { atoms, bonds } = req.body;

    try {
        // 簡単な原子価チェック
        const valenceRules: { [key: string]: number } = {
            'H': 1, 'C': 4, 'N': 3, 'O': 2, 'F': 1,
            'Na': 1, 'Si': 4, 'P': 3, 'S': 2,
            'Cl': 1, 'K': 1, 'Ca': 2, 'Fe': 2
        };

        const bondCounts: { [atomId: string]: number } = {};

        // 各原子の結合数を計算
        bonds.forEach((bond: any) => {
            const multiplier = bond.type === 'double' ? 2 : bond.type === 'triple' ? 3 : 1;
            bondCounts[bond.atom1Id] = (bondCounts[bond.atom1Id] || 0) + multiplier;
            bondCounts[bond.atom2Id] = (bondCounts[bond.atom2Id] || 0) + multiplier;
        });

        const issues: string[] = [];
        let isValid = true;

        atoms.forEach((atom: any) => {
            const expectedValence = valenceRules[atom.element];
            const actualValence = bondCounts[atom.id] || 0;

            if (expectedValence !== undefined && actualValence !== expectedValence) {
                // 特殊なケースを考慮
                const isSpecialCase =
                    (atom.element === 'N' && (actualValence === 3 || actualValence === 5)) ||
                    (atom.element === 'S' && [2, 4, 6].includes(actualValence)) ||
                    (atom.element === 'P' && (actualValence === 3 || actualValence === 5));

                if (!isSpecialCase) {
                    isValid = false;
                    issues.push(`${atom.element}原子の結合数が正しくありません（期待: ${expectedValence}本、実際: ${actualValence}本）`);
                }
            }

            if (actualValence === 0 && !['He', 'Ne', 'Ar'].includes(atom.element)) {
                issues.push(`${atom.element}原子が他の原子と結合していません`);
            }
        });

        res.json({
            isValid: isValid && issues.length === 0,
            issues,
            suggestion: issues.length > 0 ? '原子の結合数を確認してください' : '構造は正しそうです！'
        });

    } catch (error) {
        console.error('Validation error:', error);
        res.status(500).json({ error: 'エラーが発生しました' });
    }
});

// 分子式検索エンドポイント（Geminiのみ）
app.post('/api/molecule/search-formula', async (req, res) => {
    const { formula } = req.body;

    try {
        console.log(`[Gemini] Searching for formula: ${formula}`);

        const geminiResult = await getMoleculeNameFromFormula(formula);

        if (geminiResult.found && geminiResult.compounds.length > 0) {
            const compounds = geminiResult.compounds.map((compound: any) => ({
                name: compound.name,
                formula: compound.formula
            }));

            res.json({
                found: true,
                message: `${compounds.length}個の化合物が見つかりました`,
                compounds
            });
        } else {
            res.json({
                found: false,
                message: 'この分子式の物質は見つかりませんでした',
                compounds: []
            });
        }

    } catch (error) {
        console.error('[Gemini error]', error);
        res.status(500).json({
            found: false,
            message: 'エラーが発生しました',
            compounds: []
        });
    }
});

// 分子式から3D表示用データを取得するエンドポイント
app.post('/api/molecule/get-3d-data', async (req, res) => {
    const { formula } = req.body;

    if (!formula || typeof formula !== 'string') {
        return res.status(400).json({ error: 'Formula is required' });
    }

    try {
        console.log(`[3D Data] Getting 3D data for formula: ${formula}`);

        // 1. Geminiで分子式から化合物名（英語名）を取得
        const geminiResult = await getMoleculeNameFromFormula(formula);

        if (!geminiResult.found || geminiResult.compounds.length === 0) {
            return res.json({
                success: false,
                message: 'この分子式の化合物が見つかりませんでした',
                data: null
            });
        }

        // 最初の化合物を使用
        const compound = geminiResult.compounds[0];
        const englishName = compound.englishName;

        console.log(`[3D Data] Found compound: ${compound.name} (${englishName})`);

        // 2. PubChemで英語名からSDFデータを取得
        const moleculeInfo = await getMoleculeInfo(englishName);

        if (!moleculeInfo || !moleculeInfo.sdf) {
            console.log(`[3D Data] No SDF data found for ${englishName}`);
            return res.json({
                success: false,
                message: `${compound.name}のSDFデータが見つかりませんでした`,
                data: null
            });
        }

        console.log(`[3D Data] Got SDF data for ${englishName} (${moleculeInfo.sdf.length} chars)`);

        // 3. SDFからGLBに変換
        const glbBuffer = await convertSdfToGlb(moleculeInfo.sdf);

        console.log(`[3D Data] GLB conversion completed (${glbBuffer.length} bytes)`);

        // 4. GLBデータをBase64エンコードして返す
        const glbBase64 = glbBuffer.toString('base64');

        res.json({
            success: true,
            message: `${compound.name}の3Dデータを取得しました`,
            data: {
                moleculeName: compound.name,
                englishName: englishName,
                formula: formula,
                description: compound.description || '',
                cid: moleculeInfo.cid,
                sdf: moleculeInfo.sdf,
                glbBase64: glbBase64
            }
        });

    } catch (error) {
        console.error('[3D Data Error]', error);
        res.status(500).json({
            success: false,
            message: '3Dデータの取得中にエラーが発生しました',
            data: null
        });
    }
});

export default app;