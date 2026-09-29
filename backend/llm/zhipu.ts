// 智谱AI (Zhipu) / Z.ai の OpenAI 互換 Chat Completions API を呼び出すクライアント
// Gemini API が利用できなくなったため、無料モデルの GLM に移行した
//
// 環境変数に設定されたキーで接続先を切り替える
// - ZAI_API_KEY   : Z.ai（国際版, https://z.ai）
// - ZHIPU_API_KEY : 智谱AI開放平台（中国版, https://bigmodel.cn）

type Provider = {
    endpoint: string;
    apiKey: string;
    visionModel: string;
    textModel: string;
};

// いずれも無料モデル
function getProvider(): Provider {
    if (process.env.ZAI_API_KEY) {
        return {
            endpoint: "https://api.z.ai/api/paas/v4/chat/completions",
            apiKey: process.env.ZAI_API_KEY,
            visionModel: "glm-4.6v-flash",
            textModel: "glm-4.5-flash",
        };
    }
    if (process.env.ZHIPU_API_KEY) {
        return {
            endpoint: "https://open.bigmodel.cn/api/paas/v4/chat/completions",
            apiKey: process.env.ZHIPU_API_KEY,
            visionModel: "glm-4.6v-flash",
            textModel: "glm-4-flash-250414",
        };
    }
    throw new Error("ZAI_API_KEY or ZHIPU_API_KEY is not set");
}

export type ModelKind = "vision" | "text";

type ContentPart =
    | { type: "text"; text: string }
    | { type: "image_url"; image_url: { url: string } };

type Message = {
    role: "system" | "user" | "assistant";
    content: string | ContentPart[];
};

export async function chat(kind: ModelKind, messages: Message[]): Promise<string> {
    const provider = getProvider();
    const model = kind === "vision" ? provider.visionModel : provider.textModel;

    const body: Record<string, unknown> = { model, messages, temperature: 0.3 };
    if (model !== "glm-4-flash-250414") {
        // 思考モードを切って応答を速くする（glm-4-flash-250414 は思考モード非対応）
        body.thinking = { type: "disabled" };
    }

    const res = await fetch(provider.endpoint, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${provider.apiKey}`,
        },
        body: JSON.stringify(body),
    });

    if (!res.ok) {
        throw new Error(`GLM API error ${res.status}: ${await res.text()}`);
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
