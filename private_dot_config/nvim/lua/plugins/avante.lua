require("avante").setup({
    provider = "ollama",
    vendors = {
        ollama = {
            __inherited_from = "openai",
            api_key_name = "",
            endpoint = "http://127.0.0.1:11434/v1",
            model = "qwen2.5-coder:7b",
        },
    },
})
