require('minuet').setup {
    notify = "verbose",
    request_timeout = 10,
    after_cursor_filter_length = 20,
    auto_trigger_ignore_ft = {'Avante', 'AvanteInput'},
    provider = 'openai_fim_compatible',
    provider_options = {
        openai_compatible = {
            api_key = 'OLLAMA_FAKE_API_KEY',
            name = 'Ollama',
            end_point = 'http://deepthought:11434/v1/chat/completions',
            model = 'deepseek-coder:6.7b',
            stream = true,
            optional = {
                max_tokens = nil,
                stop = nil,
            },
        },
        openai_fim_compatible = {
            model = "qwen2.5-coder:7b",
            name = "Ollama",
            end_point = "http://deepthought:11434/v1/completions",
            stream = true,
            api_key = "OLLAMA_FAKE_API_KEY",
            optional = {
                stop = nil,
                max_tokens = nil,
            }
        },
    },
    cmp = { enable_auto_complete = false },
    blink = { enable_auto_complete = false },
}
