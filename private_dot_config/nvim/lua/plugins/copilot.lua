require("copilot").setup({
    suggestion = { enabled = false},
    panel = { enabled = false},
    filetypes = {
        ["*"] = true,
    }
})
require("copilot_cmp").setup()
