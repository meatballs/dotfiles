" General Settings
set path+=**
:au FocusLost * :wa
set splitbelow
set splitright
autocmd TermOpen * set bufhidden=hide
autocmd TermOpen * setlocal nonumber

" Ale plugin settings
let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Custom Key Mappings
noremap <Leader>c :vsplit term://xonsh<CR> :startinsert<CR>
noremap <Leader>ch :split term://xonsh<CR> :startinsert<CR>
tnoremap <Esc> <C-\><C-n>
noremap <Leader>e :NERDTreeToggle<CR>
noremap <Leader>f :Autoformat<CR>
noremap <Leader>t :TagbarToggle<CR>
:autocmd FileType python nnoremap <buffer> <localleader>d :PUDBLaunchDebuggerTab<CR><CR>
:autocmd FileType python nnoremap <buffer> <localleader>i :Isort<CR>

let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
autocmd BufWinEnter * silent! :%foldopen!
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
