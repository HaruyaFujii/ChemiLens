# EGH用プロジェクト 「ChemiLens」

![image](https://github.com/HaruyaFujii/ChemiLens/blob/305c04cff9235ec5f62bbb19c16d300a0b29362e/Frame%2013.png)

## About
小中学生に向けた化学をより日常的に感じることができるようにするWebアプリとなっています。
1. 身近なものを撮影
2. 3Dモデルで視覚化
3. ゲーム感覚で学習
を可能とします。

### Presentations
- [Material](https://docs.google.com/presentation/d/1rxkJ3UuX6wdnfGBtRdy55EdhyvWvW2-YSn02pmTRJsc/edit?usp=sharing)

## Architecture
> [!NOTE]
> 2026年9月、画像解析・化合物検索に使うLLMを Gemini API から GLM の無料モデル（画像解析: `glm-4.6v-flash`）へ移行しました。下図は移行前の構成です。
> デプロイ時は次のどちらかの環境変数を設定してください。
> - `ZAI_API_KEY`: [Z.ai](https://z.ai/model-api)（国際版）のAPIキー（テキスト: `glm-4.5-flash`）
> - `ZHIPU_API_KEY`: [智谱AI開放平台](https://bigmodel.cn)（中国版）のAPIキー（テキスト: `glm-4-flash-250414`）

![image](https://github.com/HaruyaFujii/ChemiLens/blob/c203e3588a3f861321da1ba1dc98a7e4febce37f/ChemiLens_tech.png)
