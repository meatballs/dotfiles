" General Settings
set path+=**
:au FocusLost * :wa
set splitbelow
set splitright
autocmd TermOpen * set bufhidden=hide

" Ale plugin settings
let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'

" Custom Key Mappings
map <F4> :split term://xonsh<CR> :startinsert<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :Autoformat<CR>
map <F7> :Isort<CR>
map <F8> :TagbarToggle<CR>
map <F9> :vsplit term://xonsh<CR> :startinsert<CR>
tnoremap <Esc> <C-\><C-n>

