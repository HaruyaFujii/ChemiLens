// 智谱AI (Zhipu) の OpenAI 互換 Chat Completions API を呼び出すクライアント
// Gemini API が利用できなくなったため、無料モデルの GLM に移行した

const ENDPOINT = "https://open.bigmodel.cn/api/paas/v4/chat/completions";

// 無料モデル
export const VISION_MODEL = "glm-4.6v-flash";
export const TEXT_MODEL = "glm-4-flash-250414";

type ContentPart =
    | { type: "text"; text: string }
    | { type: "image_url"; image_url: { url: string } };

type Message = {
    role: "system" | "user" | "assistant";
    content: string | ContentPart[];
};

export async function chat(model: string, messages: Message[]): Promise<string> {
    const apiKey = process.env.ZHIPU_API_KEY;
    if (!apiKey) {
        throw new Error("ZHIPU_API_KEY is not set");
    }

    const body: Record<string, unknown> = { model, messages, temperature: 0.3 };
    if (model === VISION_MODEL) {
        // 思考モードを切って応答を速くする
        body.thinking = { type: "disabled" };
    }

    const res = await fetch(ENDPOINT, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${apiKey}`,
        },
        body: JSON.stringify(body),
    });

    if (!res.ok) {
        throw new Error(`Zhipu API error ${res.status}: ${await res.text()}`);
    }

    const data = (await res.json()) as {
        choices?: { message?: { content?: string } }[];
    };
    const text = data.choices?.[0]?.message?.content ?? "";

    // GLM の出力に含まれ得る思考タグ・ボックスタグを除去
    return text
        .replace(/<think>[\s\S]*?<\/think>/g, "")
        .replace(/<\|begin_of_box\|>|<\|end_of_box\|>/g, "")
        .trim();
}
