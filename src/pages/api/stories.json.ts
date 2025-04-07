import type { APIRoute } from "astro";

export const get: APIRoute = async () => {
    const stories = await import("../../../public/stories.json");
    return new Response(JSON.stringify(stories.default), {
        status: 200,
        headers: {
            "Content-Type": "application/json",
        },
    });
};
