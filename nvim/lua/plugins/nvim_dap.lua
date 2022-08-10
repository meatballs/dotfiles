require('dap-python').setup('~/.pyenv/versions/debugpy/bin/python')
require("dapui").setup()
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
