import { GoogleGenerativeAI } from "@google/generative-ai";

const apiKey = process.env.GEMINI_API_KEY;
const genAI = new GoogleGenerativeAI(apiKey!);

// 分子式から分子名を取得する関数
export async function getMoleculeNameFromFormula(formula: string) {
    try {
        const model = genAI.getGenerativeModel({ model: "gemini-2.0-flash" });

        const prompt = `
            あなたは化学の専門家です。
            分子式「${formula}」から、その化合物の名前を特定してください。

            以下のJSON形式で回答してください：
            {
                "found": true/false,
                "compounds": [
                    {
                        "name": "化合物の一般的な名前（日本語）",
                        "englishName": "化合物の英語名",
                        "formula": "${formula}",
                        "description": "その化合物の簡単な説明（日本語、30文字程度）"
                    }
                ]
            }

            例：
            - H2O → 水 (Water)
            - NH3 → アンモニア (Ammonia)
            - CH4 → メタン (Methane)
            - CO2 → 二酸化炭素 (Carbon dioxide)

            化合物が見つからない場合は found: false を返してください。
            複数の候補がある場合は、最も一般的な化合物を最大3つまで返してください。
        `;

        const result = await model.generateContent(prompt);
        let text = result.response.text();

        // JSONマークダウンの除去
        const jsonMatch = text.match(/```json\n([\s\S]*?)\n```/);
        if (jsonMatch && jsonMatch[1]) {
            text = jsonMatch[1];
        }

        // JSON以外の部分を除去
        const cleanJsonMatch = text.match(/\{[\s\S]*\}/);
        if (cleanJsonMatch) {
            text = cleanJsonMatch[0];
        }

        try {
            const result = JSON.parse(text);
            return result;
        } catch (parseError) {
            console.error("[Gemini] Failed to parse JSON response:", text);
            return {
                found: false,
                compounds: []
            };
        }

    } catch (error) {
        console.error(`[Gemini] Error while getting molecule name for ${formula}:`, error);
        return {
            found: false,
            compounds: []
        };
    }
}