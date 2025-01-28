require('minuet').setup {
    notify = "verbose",
    request_timeout = 60,
    after_cursor_filter_length = 20,
    provider = 'openai_compatible',
    provider_options = {
        openai_compatible = {
            api_key = 'OLLAMA_FAKE_API_KEY',
            name = 'Ollama',
            end_point = 'http://deepthought:11434/v1/chat/completions',
            model = 'qwen2.5-coder:7b',
            stream = true,
            optional = {
                max_tokens = nil,
                stop = nil,
            },
        },
    },
    cmp = { enable_auto_complete = false },
    blink = { enable_auto_complete = false },
}
