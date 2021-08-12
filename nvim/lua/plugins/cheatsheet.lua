require("cheatsheet").setup({
    bundled_cheatsheets = {
        enabled = {"default", "regex"},
    },

    bundled_plugin_cheatsheets = true,
    -- bundled_plugin_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- }
    include_only_installed_plugins = true,
})

