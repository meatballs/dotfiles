return {
    on_init = function(client)
        -- Fix for https://github.com/redhat-developer/yaml-language-server/issues/486
        client.server_capabilities.documentFormattingProvider = true
    end,
    settings = {
        yaml = {
            format = { enable = true },
        }
    }
}
