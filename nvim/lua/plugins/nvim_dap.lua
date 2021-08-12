require('dap-python').setup('~/.pyenv/versions/debugpy/bin/python')
require("dapui").setup()
local map = require("keybindings")

keybindings = {
    {"n", "<leader>dc", ":lua require'dap'.continue()<CR>"},
    {"n", "<leader>dso", ":lua require'dap'.step_over()<CR>"},
    {"n", "<leader>dsi", ":lua require'dap'.step_into()<CR>"},
    {"n", "<leader>dsx", ":lua require'dap'.step_out()<CR>"},
    {"n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>"},
}
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

-- Example mappings from help text
-- nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
-- nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
-- nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

for k, v in pairs(keybindings) do
    map(v)
end
