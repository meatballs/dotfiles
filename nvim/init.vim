call plug#begin()

" Support for .editorconfig files
Plug 'editorconfig/editorconfig-vim'

" Nord colour theme
Plug 'arcticicestudio/nord-vim'

" Common navigation of tmux and nvim windows
Plug 'christoomey/vim-tmux-navigator'

" File explorer tree in LH sidebar
Plug 'scrooloose/nerdtree'

" Git status flags in nerdtree file explorer
Plug 'albfan/nerdtree-git-plugin'

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
Plug 'meatballs/vim-xonsh'

" Syntax for toml files
Plug 'cespare/vim-toml'

" Show vertical lines for indent level
Plug 'Yggdroot/indentLine'

" Tag explorer in RH sidebar
Plug 'majutsushi/tagbar'

" Autocompleter
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Tag manager
Plug 'ludovicchabant/vim-gutentags'

" Status bar at bottom of window
" This should be after any plugins that it integrates with
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" This plugin must be the last in the list
" Add icons for use by other plugins
Plug 'ryanoasis/vim-devicons'

call plug#end()

" General Settings
set nu
set t_Co=256
set colorcolumn=88
set path+=**
set cursorline
:au FocusLost * :wa
set splitbelow
set splitright
autocmd TermOpen * set bufhidden=hide

" Fix colours on simple terminal and tmux
" https://github.com/arcticicestudio/nord-vim/issues/166
if exists('+termguicolors') && ($TERM == "st-256color" || $TERM == "tmux-256color")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Airline plugin settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='nord'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

" Nord theme settings
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord

" Ale plugin settings
let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'

" Use bash as the shell because xonsh has a bug that stops plugins working
" https://github.com/xonsh/xonsh/issues/3402
set shell=/usr/bin/bash

" Custom Key Mappings
map <F4> :split term://xonsh<CR> :startinsert<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :Autoformat<CR>
map <F7> :Isort<CR>
map <F8> :TagbarToggle<CR>
map <F9> :vsplit term://xonsh<CR> :startinsert<CR>
tnoremap <Esc> <C-\><C-n>

