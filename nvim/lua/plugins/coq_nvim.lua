local map = require("keybindings")

vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = {
        jump_to_mark = '<c-u>',
        recommended = false,
    },
}
local coq = require('coq')




vim.cmd [[
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
]]
