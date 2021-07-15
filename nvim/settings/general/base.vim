" General Settings
set nu
set t_Co=256
set colorcolumn=88
let mapleader=" "
let maplocalleader=" "
let g:python3_host_prog = '~/.pyenv/versions/nvim/bin/python3'
set termguicolors
set guifont=SourceCodePro:h9
set shiftwidth=4

" Airline plugin settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='nord'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

" Nord theme settings
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
" let g:nord_uniform_status_lines = 1
" let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
augroup nord-theme-overrides
    autocmd!
    " Use nord8 as color for toml tables
    autocmd ColorScheme nord highlight tomlTable ctermfg=8 guifg=#88C0D0
    autocmd ColorScheme nord highlight tomlTableArray ctermfg=8 guifg=#88C0D0
augroup END
colorscheme nord
set cursorline


inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <silent> <leader>n :set relativenumber!<CR>
