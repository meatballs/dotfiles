local M = {}
local map = require("keybindings")

global_settings = {
    mapleader = " ",
    maplocalleader = " ",
    python3_host_prog = "~/pyenv/versions/nvim/bin/python3",
    splitbelow = true,
    splitright = true,
    termguicolors = true,
}

options = {
    number = true,
    colorcolumn = {88},
    cursorline = true,
}

keybindings = {
    {"i", "jk", "<esc>"},
    {"i", "<esc>", "<nop>"},
    {"n", "<leader>n", ":set relativenumber!<CR>"}
}

function basic()
    for k, v in pairs(global_settings) do
        vim.g[k] = v
    end

    for k, v in pairs(options) do
        vim.opt[k] = v
    end

    for k, v in pairs(keybindings) do
        map(v)
    end

    require("plugins.nord")
end


function full()
    vim.cmd("autocmd FocusLost * :wa")
    vim.cmd("autocmd BufWinEnter * silent! :%foldopen!")

    -- for firenvim, we have to set guifont, but that is no longer supported
    -- in neovim, so using vim.g has no effect. Instead, we can use vim.cmd
    -- and that seems to work fine.
    vim.cmd("set guifont=SauceCodePro\\ Nerd\\ Font\\ Mono:h10")

    vim.opt.completeopt = {"menuone", "noinsert"}
    require("plugins.cheatsheet")
    require("plugins.firenvim")
    require("plugins.indent_blankline")
    require("plugins.lspconfig")
    require("plugins.lspsaga")
    require("plugins.lualine")
    require("plugins.nvim_dap")
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
