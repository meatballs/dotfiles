require("hop").setup()

keybindings = {
    {"n", "f", "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"},
    {"n", "F", "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"}
}

for k, v in pairs(keybindings) do
    map(v)
end
