call plug#begin()

" Status bar at bottom of window
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nord colour theme
Plug 'arcticicestudio/nord-vim'

" Common navigation of tmux and nvim windows
Plug 'christoomey/vim-tmux-navigator'

" This plugin must be the last in the list
" Add icons for use by other plugins
Plug 'ryanoasis/vim-devicons'

call plug#end()

" General Settings
set nu
set colorcolumn=79
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set autoread
set cursorline

" Solarized theme plugin settings
colorscheme nord
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'

