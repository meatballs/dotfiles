require('minuet').setup {
    notify = "verbose",
    after_cursor_filter_length = 20,
    provider = 'ollama_fim_compatible',
    provider_options = {
        openai_fim_compatible = {
            api_key = 'OLLAMA_FAKE_API_KEY',
            name = 'Ollama',
            end_point = 'http://deepthought:11434/v1/completions',
            model = 'qwen2.5-coder:7b',
            stream = true,
            optional = {
                stop = nil,
                max_tokens = nil,
            },
        },
        openai_compatible = {
            api_key = 'OPENROUTER_API_KEY',
            name = "Openrouter",
            end_point = "https://openrouter.ai/api/v1/chat/completions",
            model = "anthropic/claude-3.5-sonnet",
            stream = true,
            optional = {
                max_tokens = 256,
                top_p = 0.9,
            }
        }
    },
    cmp = { enable_auto_complete = false },
    blink = { enable_auto_complete = true },
}
