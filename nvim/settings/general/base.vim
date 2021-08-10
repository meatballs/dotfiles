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
colorscheme nord

lua <<EOF
require'lualine'.setup {
  options = {
    theme = 'nord',
  },
}
EOF

set cursorline

inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <silent> <leader>n :set relativenumber!<CR>
