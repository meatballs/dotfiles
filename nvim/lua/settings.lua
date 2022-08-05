local M = {}
local map = require("keybindings")

global_settings = {
    mapleader = " ",
    maplocalleader = ",",
    python3_host_prog = "~/.pyenv/versions/nvim/bin/python3",
    splitbelow = true,
    splitright = true,
    termguicolors = true,
}

options = {
    colorcolumn = {88},
    completeopt = {"menuone", "noinsert"},
    cursorline = true,
    guifont= "SauceCodePro Nerd Font Mono:h10",
    hidden = true,
    number = true,
    shell = "/home/owen/.local/bin/xonsh",
}

keybindings = {
    {"i", "jk", "<esc>"},
    {"n", "<leader>n", ":set relativenumber!<CR>"},
    {"n", "<leader>l", ":make --max-line-length 88<CR><CR>:copen<CR>"},
}

plugin_modules = {
    "coq_nvim",
    "coq_3p",
    "firenvim",
    "gitsigns",
    "indent_blankline",
    "lspconfig",
    "lspsaga",
    "lualine",
    "nvim_dap",
    "pudb",
    "telescope",
    "nvim_tree",
    "splice",
    "toggleterm",
    "treesitter",
    "trouble",
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
        "autocmd Filetype python setlocal makeprg=flake8",
        "autocmd BufEnter anvil.works_* set filetype=python",
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
