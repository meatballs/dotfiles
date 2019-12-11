" General Settings
set path+=**
:au FocusLost * :wa
set splitbelow
set splitright
autocmd TermOpen * set bufhidden=hide

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

