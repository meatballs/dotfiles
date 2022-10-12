local M = {}
local map = require("keybindings")

local global_settings = {
    mapleader = " ",
    maplocalleader = ",",
    python3_host_prog = "~/.pyenv/versions/nvim/bin/python3",
    spelllang = "en-gb",
    splitbelow = true,
    splitright = true,
    termguicolors = true,
}

local options = {
    colorcolumn = { 88 },
    completeopt = { "menuone", "noinsert" },
    cursorline = true,
    guifont = "SauceCodePro Nerd Font Mono:h10",
    hidden = true,
    number = true,
    shell = "/home/owen/.local/bin/xonsh",
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
}

local keybindings = {
    { "i", "jk", "<esc>" },
}

local plugin_modules = {
    "alpha",
    "coq_nvim",
    "coq_3p",
    "firenvim",
    "gitsigns",
    "hop",
    "indent_blankline",
    "kommentary",
    "lspconfig",
    "lspsaga",
    "lualine",
    "nvim_dap",
    "project",
    "telescope",
    "nvim_tree",
    "toggleterm",
    "treesitter",
    "trouble",
    "vimtex",
    "which-key",
}

local luajit_dependent_modules = {
    "notify",
}

local function basic()
    for k, v in pairs(global_settings) do
        vim.g[k] = v
    end

    for k, v in pairs(options) do
        vim.opt[k] = v
    end

    for _, v in pairs(keybindings) do
        map(v)
    end

    require("plugins.nord")
end

local function full()
    local cmds = {
        "autocmd FocusLost * :wa",
        "autocmd BufWinEnter * silent! :%foldopen!",
        "autocmd Filetype python setlocal makeprg=flake8",
    }
    for _, v in pairs(cmds) do
        vim.cmd(v)
    end

    for _, v in pairs(plugin_modules) do
        require("plugins." .. v)
    end

    if type(jit) == "table" then
        for _, v in pairs(luajit_dependent_modules) do
            require("plugins." .. v)
        end
    end
end

function M.setup(config)
    basic()
    if config == "full" then full() end
end

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex", "*.rst" }, command = "setlocal spell" }
)

return M
