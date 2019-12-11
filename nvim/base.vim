" General Settings
set nu
set t_Co=256
set colorcolumn=88
set cursorline

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