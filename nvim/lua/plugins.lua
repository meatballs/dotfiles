local M = {}
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"


local packer_config = {
    display = {
        open_fn = require('packer.util').float,
    },
}

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

local base_plugins = {
    -- Packer can manage itself
    {"wbthomason/packer.nvim"},

    -- Lua based status line
    {"hoob3rt/lualine.nvim"},

    -- Nord colour theme
    {"shaunsingh/nord.nvim"},

    -- icon set
    {"kyazdani42/nvim-web-devicons"},

    -- kitty navigation
    {"knubie/vim-kitty-navigator"},
}

local full_plugins = {
    -- Cheatsheets
    {"sudormrfbin/cheatsheet.nvim"},

    -- CSV Tools
    {"chrisbra/csv.vim"},

    -- Autocomplete
    {"nvim-lua/completion-nvim"},

    -- editorconfig support
    {"editorconfig/editorconfig-vim"},

    -- Neovim in the browser
    {
        "glacambre/firenvim",
        run = function() vim.fn["firenvim#install"](0) end
    },

    -- Indentation guide lines
    {"lukas-reineke/indent-blankline.nvim"},

    -- Improved lsp ui
    {"glepnir/lspsaga.nvim"},

    -- Debug Adapter Protocol
    {"mfussenegger/nvim-dap"},
    {"mfussenegger/nvim-dap-python"},
    {"rcarriga/nvim-dap-ui"},

    --Common lsp config settings
    {"neovim/nvim-lspconfig"},

    -- File Explorer Tree
    {"kyazdani42/nvim-tree.lua"},

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    },

    -- Help file for strftime formats
    {"sjl/strftimedammit.vim"},

    -- Telescope
    {"nvim-lua/popup.nvim"},
    {"nvim-lua/plenary.nvim"},
    {"nvim-telescope/telescope.nvim"},
    {"nvim-telescope/telescope-dap.nvim"},

    -- LaTeX integration
    {"lervag/vimtex"},

    -- Comment lines and blocks
    {"tpope/vim-commentary"},

    -- Git status flags in LHS gutter
    {"airblade/vim-gitgutter"},

    -- Git wrapper (git commands within nvim)
    {"tpope/vim-fugitive"},

    -- kitty runner
    {"lkemitchll/vim-kitty-runner"},

    -- Syntax highlighting of .xsh and .xonshrc files
    {"linkinpark342/xonsh-vim"},
}

function M.load(config)
    local plugins = base_plugins
    if config == "full" then
        for key, value in pairs(full_plugins) do
                plugins[key] = value
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
