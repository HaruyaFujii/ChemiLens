import { chat, TEXT_MODEL } from "./zhipu.js";

export async function searchCompoundsByElement(element: string) {
    try {
        // プロンプト：小学生向けに「その元素を含む身近な物体」を返してもらう
        const prompt = `
            あなたは科学を子供にわかりやすく説明する先生です。
            元素「${element}」を含む、私たちの身近な物体や食品の例を3つ挙げてください。
            それぞれ簡単にどう関わっているのか説明も簡潔につけてください。
            出力はJSON形式で返してください。例:
            [
              { "name": "水", "description": "水は酸素と水素からできていて、飲み物や川にあります" },
              { "name": "りんご", "description": "りんごの甘さは糖分で、炭素・水素・酸素が含まれています" }
            ]
        `;

        let text = await chat(TEXT_MODEL, [{ role: "user", content: prompt }]);

        // LLM のレスポンスからJSON部分を抽出する
        // ```json ... ``` のようなマークダウン形式に対応
        const jsonMatch = text.match(/```json\n([\s\S]*?)\n```/);
        if (jsonMatch && jsonMatch[1]) {
            text = jsonMatch[1];
        }

        // JSON配列以外の部分を除去
        const arrayMatch = text.match(/\[[\s\S]*\]/);
        if (arrayMatch) {
            text = arrayMatch[0];
        }

        // LLM のレスポンスをJSONとしてパース
        try {
            const examples = JSON.parse(text);
            return examples;
        } catch (e) {
            console.error("[LLM] Failed to parse JSON response after extraction:", text);
            throw new Error("Failed to parse response from LLM API as JSON.");
        }

    } catch (error) {
        console.error(`[LLM] Error while searching compounds for ${element}:`, error);
        // エラーを再スローして呼び出し元で処理できるようにする
        throw error;
    }
}
