local M = {}
local execute = vim.api.nvim_command
local fn = vim.fn
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local base_plugins = {
    -- Lua based status line
    { "hoob3rt/lualine.nvim" },

    -- Nord colour theme
    { "shaunsingh/nord.nvim", lazy = false, priority = 1000 },

    -- icon set
    { "kyazdani42/nvim-web-devicons" },

    --kitty navigation
    { "knubie/vim-kitty-navigator" },
}

local full_plugins = {
    { dir = "~/projects/personal/notebook.nvim" },

    -- Autopairs
    { "windwp/nvim-autopairs" },

    -- Comments
    { "numToStr/Comment.nvim" },

    -- Copilot
    { "github/copilot.vim" },

    -- CSV Tools
    { "chrisbra/csv.vim" },

    -- Completion
    {
        "ms-jpq/coq_nvim",
        branch = "coq"
    },
    {
        "ms-jpq/coq.artifacts",
        branch = "artifacts"
    },
    { "ms-jpq/coq.thirdparty" },

    -- UI improvements
    { "stevearc/dressing.nvim" },

    -- Neovim in the browser
    {
        "glacambre/firenvim",
        build = function() vim.fn["firenvim#install"](0) end
    },

    -- Git blame virtual text
    { "f-person/git-blame.nvim" },

    -- Git decorations
    { "lewis6991/gitsigns.nvim" },

    -- Hop based navigation
    {
        "phaazon/hop.nvim",
        branch = "v2",
    },

    -- Indentation guide lines
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- Just files
    {'NoahTheDuke/vim-just'},

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    -- Debug Adapter Protocol
    { "mfussenegger/nvim-dap" },
    { "mfussenegger/nvim-dap-python" },
    { "rcarriga/nvim-dap-ui" },

    -- Jupyter Integration
    {
        dir = "~/projects/personal/magma-nvim",
        build = ":UpdateRemotePlugins"
    },

    -- Split Navigation
    { "numToStr/Navigator.nvim" },

    --Common lsp config settings
    { "neovim/nvim-lspconfig" },

    -- Obsidian
    { "epwalsh/obsidian.nvim" },

    -- Popup notifications
    { "rcarriga/nvim-notify" },

    -- File Explorer Tree
    { "kyazdani42/nvim-tree.lua" },

    -- Github integration
    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "kyazdani42/nvim-web-devicons",
        },
    },

    -- Task runner
    { "stevearc/overseer.nvim" },

    -- Project management
    { "ahmedkhalf/project.nvim" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    { "nvim-treesitter/playground",
        build = ":TSUpdate"
    },

    -- Help file for strftime formats
    { "sjl/strftimedammit.vim" },

    -- Telescope
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-project.nvim" },

    -- Persistent, toggled terminals
    { "akinsho/toggleterm.nvim" },

    -- Context
    { "nvim-treesitter/nvim-treesitter-context" },

    -- Code linting helper
    { "folke/trouble.nvim" },

    -- LaTeX integration
    { "lervag/vimtex" },

    -- Key Bindings with prompt
    { "folke/which-key.nvim" },

    -- Vyper syntax highlighting
    { "vyperlang/vim-vyper" },

    -- Syntax highlighting of .xsh and .xonshrc files
    { "linkinpark342/xonsh-vim" },
}

function M.load(config)
    local plugins = {}
    for _, value in ipairs(base_plugins) do
        table.insert(plugins, value)
    end
    if config == "full" then
        for _, value in ipairs(full_plugins) do
            table.insert(plugins, value)
        end
    end
    require("lazy").setup(plugins)
end

return M
