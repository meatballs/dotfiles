" editorconfig support
Plug 'editorconfig/editorconfig-vim'

" File explorer tree in LH sidebar
Plug 'scrooloose/nerdtree'

" Git status flags in nerdtree file explorer
Plug 'Xuyuanp/nerdtree-git-plugin'

" Asynchronous Linting Engine
Plug 'dense-analysis/ale'

" Code auto-formatting
Plug 'Chiel92/vim-autoformat'

" Python syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" RestructuredText notes and highlighting
Plug 'Rykka/riv.vim'

" Python import statement sorting
Plug 'fisadev/vim-isort'

" Git wrapper (git commands within nvim)
Plug 'tpope/vim-fugitive'

" Fugitive extension for branch management
Plug 'idanarye/vim-merginal'

" Comment lines and blocks
Plug 'tpope/vim-commentary'

" Git status flags in LHS gutter
Plug 'airblade/vim-gitgutter'

" Syntax highlighting of .xsh and .xonshrc files
Plug 'linkinpark342/xonsh-vim'

" Syntax for toml files
Plug 'cespare/vim-toml'

" Syntax for postresgl
Plug 'lifepillar/pgsql.vim'

" Tag explorer in RH sidebar
Plug 'majutsushi/tagbar'

" Autocompleter
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Deoplete plugin for Python autocompletion using jedi
Plug 'deoplete-plugins/deoplete-jedi'

" Further plugin for jedi with extra features
Plug 'davidhalter/jedi-vim'

" Tag manager
Plug 'ludovicchabant/vim-gutentags'

" LaTeX integration
Plug 'lervag/vimtex'

" Auto session management
" Plug 'tpope/vim-obsession'

" PUDB Integration
Plug 'SkyLeach/pudb.vim', {'do': ':UpdateRemotePlugins'}

" CSV Tools
Plug 'chrisbra/csv.vim'

" Python code folding
Plug 'tmhedberg/SimpylFold'

" Docker files syntax
Plug 'ekalinin/Dockerfile.vim'

" Neovim in the browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Help file for strftime formats
Plug 'sjl/strftimedammit.vim'

" Fuzzy Finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" kitty runner
Plug 'lkemitchll/vim-kitty-runner'
