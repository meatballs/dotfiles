require("avante_lib").load()

local openrouter_settings = {
    __inherited_from = "openai",
    endpoint = "https://openrouter.ai/api/v1",
    api_key_name = { "keyring", "get", "openrouter", "avante" },
}

local function get_config()
    return {
        vendors = {
            openrouter = openrouter_settings,
        },
        provider = "openrouter",
        auto_suggestions_provider = "openrouter",
    }
end

require("avante").setup(get_config())
