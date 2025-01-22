local M = {}
local map = require("keybindings")

local global_settings = {
    mapleader = " ",
    maplocalleader = ",",
    python3_host_prog = "/home/owen/.virtualenvs/neovim/bin/python",
    spelllang = "en-gb",
    splitbelow = true,
    splitright = true,
    termguicolors = true,
}

local options = {
    colorcolumn = { 88 },
    completeopt = { "menuone", "noinsert" },
    cursorline = true,
    guifont = "SauceCodePro Nerd Font Mono:h11",
    hidden = true,
    number = true,
    shell = "/home/linuxbrew/.linuxbrew/bin/xonsh",
    laststatus = 3,
    -- foldmethod = "expr",
    -- foldexpr = "nvim_treesitter#foldexpr()",
}

local keybindings = {
    { "i", "jk", "<esc>" },
}

local plugin_modules = {
    "autopairs",
    "blink",
    "comment",
    "csv",
    "firenvim",
    "gitsigns",
    "indent_blankline",
    "lspconfig",
    "lualine",
    "mini_files",
    "minuet",
    "nnn",
    "nvim_dap",
    "overseer",
    "telescope",
    "obsidian",
    "octo",
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

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.conceallevel = 1
    end,
})

vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = "anvil.works*.txt",
    command = "set filetype=python"
})


return M
