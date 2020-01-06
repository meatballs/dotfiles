" General Settings
set path+=**
:au FocusLost * :wa
set splitbelow
set splitright
autocmd TermOpen * set bufhidden=hide

" Ale plugin settings
let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Custom Key Mappings
map <F4> :split term://xonsh<CR> :startinsert<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :Autoformat<CR>
map <F7> :Isort<CR>
map <F8> :TagbarToggle<CR>
map <F9> :vsplit term://xonsh<CR> :startinsert<CR>
tnoremap <Esc> <C-\><C-n>

let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
