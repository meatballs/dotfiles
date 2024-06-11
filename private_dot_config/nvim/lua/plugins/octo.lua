require("octo").setup({
    default_remote = { "upstream", "origin", "github", "gitlab", "anvil" },
    suppress_missing_scope = {
        projects_v2 = true,
    }
})
