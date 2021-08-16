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
    completeopt = {"menuone", "noinsert"},
    guifont= "SauceCodePro Nerd Font Mono:h10",
    number = true,
    colorcolumn = {88},
    cursorline = true,
}

keybindings = {
    {"i", "jk", "<esc>"},
    {"i", "<esc>", "<nop>"},
    {"n", "<leader>n", ":set relativenumber!<CR>"}
}

plugin_modules = {
    "cheatsheet",
    "firenvim",
    "indent_blankline",
    "lspconfig",
    "lspsaga",
    "lualine",
    "nvim_dap",
    "pudb",
    "telescope",
    "nvim_tree",
    "treesitter",
    "vimtex",
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
    cmds = {
        "autocmd FocusLost * :wa",
        "autocmd BufWinEnter * silent! :%foldopen!",
    }
    for k, v in pairs(cmds) do
        vim.cmd(v)
    end

    for k, v in pairs(plugin_modules) do
        require("plugins." .. v)
    end
end

function M.setup(config)
    basic()
    if config == "full" then full() end
end

return M
