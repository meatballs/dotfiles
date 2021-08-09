" editorconfig support
Plug 'editorconfig/editorconfig-vim'

" Git wrapper (git commands within nvim)
Plug 'tpope/vim-fugitive'

" Comment lines and blocks
Plug 'tpope/vim-commentary'

" Git status flags in LHS gutter
Plug 'airblade/vim-gitgutter'

" Syntax highlighting of .xsh and .xonshrc files
Plug 'linkinpark342/xonsh-vim'

" LaTeX integration
Plug 'lervag/vimtex'

" PUDB Integration
Plug 'SkyLeach/pudb.vim', {'do': ':UpdateRemotePlugins'}

" CSV Tools
Plug 'chrisbra/csv.vim'

" Neovim in the browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Help file for strftime formats
Plug 'sjl/strftimedammit.vim'

" kitty runner
Plug 'lkemitchll/vim-kitty-runner'

" Common lsp config settings
Plug 'neovim/nvim-lspconfig'

" Improved lsp ui
Plug 'glepnir/lspsaga.nvim'

" Autocomplete
Plug 'nvim-lua/completion-nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Indentation guide lines
Plug 'lukas-reineke/indent-blankline.nvim'
