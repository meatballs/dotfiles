local M = {}
local map = require("keybindings")

function basic()
    vim.g.termguicolors = true
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    vim.g.python3_host_prog = "~/pyenv/versions/nvim/bin/python3"
    vim.opt.number = true
    vim.opt.colorcolumn = {88}
    vim.opt.cursorline = true
    require("plugins.nord")
    keybindings = {
        {"i", "jk", "<esc>"},
        {"i", "<esc>", "<nop>"},
        {"n", "<leader>n", ":set relativenumber!<CR>"}
    }
    for k, v in pairs(keybindings) do
        map(v)
    end
end


function full()
    vim.cmd(":au FocusLost * :wa")
    vim.cmd("autocmd BufWinEnter * silent! :%foldopen!")
    vim.opt.completeopt = {"menuone", "noinsert"}
    require("plugins.firenvim")
    require("plugins.indent_blankline")
    require("plugins.lspconfig")
    require("plugins.lspsaga")
    require("plugins.lualine")
    require("plugins.pudb")
    require("plugins.telescope")
    require("plugins.nvim_tree")
    require("plugins.treesitter")
    require("plugins.vimtex")
end

function M.setup(config)
    basic()
    if config == "full" then full() end
end

return M
