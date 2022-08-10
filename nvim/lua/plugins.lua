local M = {}
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"


if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

local packer_config = {
    display = {
        open_fn = require('packer.util').float,
    },
}

local base_plugins = {
    -- Packer can manage itself
    {"wbthomason/packer.nvim"},

    -- Lua based status line
    {"hoob3rt/lualine.nvim"},

    -- Nord colour theme
    {"shaunsingh/nord.nvim"},

    -- icon set
    {"kyazdani42/nvim-web-devicons"},

    --kitty navigation
    {"knubie/vim-kitty-navigator"},
}

local full_plugins = {
    -- CSV Tools
    {"chrisbra/csv.vim"},

    -- Completion
    {
        "ms-jpq/coq_nvim",
        branch = "coq"
    },
    {
        "ms-jpq/coq.artifacts",
        branch = "artifacts"
    },
    {"ms-jpq/coq.thirdparty"},

    -- editorconfig support
    {"editorconfig/editorconfig-vim"},

    -- Neovim in the browser
    {
        "glacambre/firenvim",
        run = function() vim.fn["firenvim#install"](0) end
    },

    -- Git decorations
    {"lewis6991/gitsigns.nvim"},
    --
    -- Hop based navigation
    {
        "phaazon/hop.nvim",
        branch = "v2",
    },

    -- Indentation guide lines
    {"lukas-reineke/indent-blankline.nvim"},

    -- Code commenting
    {"b3nj5m1n/kommentary"},

    -- Improved lsp ui
    {"tami5/lspsaga.nvim"},

    -- Debug Adapter Protocol
    {"mfussenegger/nvim-dap"},
    {"mfussenegger/nvim-dap-python"},
    {"rcarriga/nvim-dap-ui"},

    --Common lsp config settings
    {"neovim/nvim-lspconfig"},

    {"rcarriga/nvim-notify"},

    -- File Explorer Tree
    {"kyazdani42/nvim-tree.lua"},

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    },

    {"ahmedkhalf/project.nvim"},

    -- Help file for strftime formats
    {"sjl/strftimedammit.vim"},

    -- Telescope
    {"nvim-lua/popup.nvim"},
    {"nvim-lua/plenary.nvim"},
    {"nvim-telescope/telescope.nvim"},
    {"nvim-telescope/telescope-dap.nvim"},

    -- Persistent, toggled terminals
    {"akinsho/toggleterm.nvim"},

    -- Code linting helper
    {"folke/trouble.nvim"},

    -- LaTeX integration
    {"lervag/vimtex"},

    {"folke/which-key.nvim"},

    -- Git status flags in LHS gutter
    -- {"airblade/vim-gitgutter"},

    -- Syntax highlighting of .xsh and .xonshrc files
    {"linkinpark342/xonsh-vim"},
}

function M.load(config)
    plugins = {}
    for _, value in ipairs(base_plugins) do
	table.insert(plugins, value)
    end
    if config == "full" then
        for _, value in ipairs(full_plugins) do
            table.insert(plugins, value)
        end
    end
    require("packer").startup(
        {
            plugins,
            config = packer_config
        }
    )
end

return M
