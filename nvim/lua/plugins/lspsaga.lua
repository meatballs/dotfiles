local map = require("keybindings")

require("lspsaga").init_lsp_saga {
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    border_style = "round",
    max_preview_lines = 25,
}

keybindings = {
    {"n", "gh", ":Lspsaga lsp_finder<cr>"},
    {"n", "K", ":Lspsaga hover_doc<cr>"},
    {"n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>"},
    {"n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>"},
    {"n", "<leader>ca", ":Lspsaga code_action<cr>"},
    {"v", "<leader>ca", ":<C-u>Lspsaga range_code_action<cr>"},
    {"n", "<leader>gs", ":Lspsaga signature_help<cr>"},
    {"n", "<leader>gr", ":Lspsaga rename<cr>"},
    {"n", "<leader>gd", ":Lspsaga preview_definition<cr>"},
    {"n", "<leader>cd", ":Lspsaga show_line_diagnostics<cr>"},
    {"n", "[e", ":Lspsaga diagnostic_jump_next<cr>"},
    {"n", "]e", ":Lspsaga diagnostic_jump_prev<cr>"},
}

for k, v in pairs(keybindings) do
    map(v)
end
