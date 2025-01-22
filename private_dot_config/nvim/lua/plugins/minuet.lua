require('minuet').setup {
    provider = 'openai_compatible',
    provider_options = {
        openai_fim_compatible = {
            api_key = 'TERM',
            name = 'Ollama',
            end_point = 'http://localhost:11434/v1/completions',
            model = 'qwen2.5-coder:7b',
            optional = {
                max_tokens = 256,
                top_p = 0.9,
            },
        },
        openai_compatible = {
            api_key = 'TERM',
            name = 'Ollama',
            end_point = 'http://localhost:11434/v1/chat/completions',
            model = 'qwen2.5-coder:7b',
            stream = true,
            optional = {
                max_tokens = 256,
                top_p = 0.9,
            },
        },
    }
}
