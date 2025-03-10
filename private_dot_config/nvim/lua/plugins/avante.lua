require("avante").setup({
    provider = "ollama",
    vendors = {
        ollama = {
            __inherited_from = "openai",
            api_key_name = "",
            endpoint = "http://127.0.0.1:11434/v1",
            model = "deepseek-coder:6.7b",
        },
    },
})
