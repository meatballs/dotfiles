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

" Don't use jedi-vim for autocomplete because we're using deoplete for that
let g:jedi#completions_enabled = 0

let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }
let fc = g:firenvim_config['localSettings']

" Custom Key Mappings
noremap <Leader>c :vsplit term://xonsh<CR> :startinsert<CR>
noremap <Leader>ch :split term://xonsh<CR> :startinsert<CR>
tnoremap <Esc> <C-\><C-n>
noremap <Leader>e :NERDTreeToggle<CR>
noremap <Leader>f :Autoformat<CR>
noremap <Leader>t :TagbarToggle<CR>
:autocmd FileType python nnoremap <buffer> <localleader>p :PUDBLaunchDebuggerTab<CR><CR>
:autocmd FileType python nnoremap <buffer> <localleader>i :Isort<CR>

let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
autocmd BufWinEnter * silent! :%foldopen!
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:VtrUseVtrMaps = 1
let g:VtrStripLeadingWhitespace = 1
let g:VtrClearEmptyLines = 1

set rtp+=/usr/bin/fzf
