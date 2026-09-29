import type { Result } from "../types/types.js";
import { chat } from "./zhipu.js";

/**
 * 画像を分析し、写っている物体とそれに含まれる分子を特定する
 * @param imageBuffer 画像のバッファデータ
 * @param mimeType 画像のMIMEタイプ (e.g., "image/jpeg")
 * @returns 分析結果のオブジェクト、またはnull
 */

export async function analyzeImage(imageBuffer: Buffer, mimeType: string): Promise<Result | null> {
    const prompt = `
        Analyze the provided image.
        1. Identify the main object in the image.
        2. List 5 major chemical compounds contained in that object.

        Return a single JSON object with the following structure:
        {
          "objectName": "<name of the identified object>",
          "molecules": [
            {
              "name": "<The standard chemical name (e.g., 'Caffeine', 'Water').>",
              "formula": "<The chemical formula for the molecule. This is a required field. For example, for Water it is 'H2O', for Caffeine it is 'C8H10N4O2'.>",
              "description": "<First, the Japanese name of the molecule, followed by a newline character, then a description of the substance in Japanese, approximately 20 words long.>",
          ]
        }
        Only return the JSON object, with no other text or markdown formatting.
        In "description" section, you must write them in japanese.
    `;

    const imageUrl = `data:${mimeType};base64,${imageBuffer.toString("base64")}`;

    try {
        const text = await chat("vision", [
            {
                role: "user",
                content: [
                    { type: "image_url", image_url: { url: imageUrl } },
                    { type: "text", text: prompt },
                ],
            },
        ]);

        // クリーンなJSONを抽出
        const jsonMatch = text.match(/\{.*\}/s);
        if (!jsonMatch) {
            console.error("No JSON object found in LLM response:", text);
            return null;
        }

        const parsed = JSON.parse(jsonMatch[0]);
        return parsed as Result;

    } catch (e) {
        console.error("Failed to analyze image with LLM", e);
        return null;
    }
}