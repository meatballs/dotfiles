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


---@type LazySpec
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

---@type LazySpec
local full_plugins = {
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = 'rafamadriz/friendly-snippets',

        -- use a release tag to download pre-built binaries
        version = '*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts_extend = { "sources.default" }
    },

    -- Diagnostics display
    {
        "dgagn/diagflow.nvim",
        opts = {
            scope = "line",
            -- show_sign = true,
            -- show_borders = true,
            format = function(diagnostic)
                return diagnostic.message .. " (" .. diagnostic.code .. ")"
            end,
        }
    },

    { "milanglacier/minuet-ai.nvim" },

    -- Autopairs
    { "windwp/nvim-autopairs" },

    -- Comments
    { "numToStr/Comment.nvim" },

    -- CSV Tools
    { "chrisbra/csv.vim" },

    -- UI improvements
    { "stevearc/dressing.nvim" },

    -- Neovim in the browser
    {
        "glacambre/firenvim",
        build = function() vim.fn["firenvim#install"](0) end
    },

    -- Git decorations
    { "lewis6991/gitsigns.nvim" },

    -- Find and Replace
    { "MagicDuck/grug-far.nvim" },

    -- Indentation guide lines
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- Just files
    { 'NoahTheDuke/vim-just' },

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
    { "mfussenegger/nvim-dap-python" },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

    -- Jupyter Integration
    -- {
    --     dir = "~/projects/personal/magma-nvim",
    --     build = ":UpdateRemotePlugins"
    -- },

    -- Split Navigation
    { "numToStr/Navigator.nvim" },

    --Common lsp config settings
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },

    -- Obsidian
    { "epwalsh/obsidian.nvim" },

    -- Popup notifications
    { "rcarriga/nvim-notify" },

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

    -- Context
    { "nvim-treesitter/nvim-treesitter-context" },

    -- Code linting helper
    { "folke/trouble.nvim" },

    -- LaTeX integration
    { "lervag/vimtex" },

    -- Key Bindings with prompt
    {
        "folke/which-key.nvim",
        dependencies = {
            { "echasnovski/mini.nvim", version = false },
        }
    },

    -- Syntax highlighting of .xsh and .xonshrc files
    { "linkinpark342/xonsh-vim" },

    -- Yazi file manager integration
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        dependencies = {
          {
            -- https://github.com/folke/snacks.nvim
            "folke/snacks.nvim",
            lazy = false,
            priority = 1000,
            opts = {},
          },
        },
        ---@type YaziConfig | {}
        opts = {
          open_for_directories = true,
          log_level = vim.log.levels.DEBUG,
        },
    },
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
