-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.python3_host_prog = "/home/owen/.virtualenvs/neovim/bin/python"
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.spelllang = "en-gb"
vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
vim.g.tex_flavor = "latex"
vim.g.tex_conceal = ""
vim.g.vimtex_fold_manual = 1
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_mappings_enabled = false
vim.g.vimtex_compiler_method = "tectonic"
vim.g.autoformat = false

vim.opt.colorcolumn = { 88 }
vim.opt.completeopt = { "menuone", "noinsert" }
vim.opt.cursorline = true
vim.opt.guifont = "SauceCodePro Nerd Font Mono:h11"
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.shell = "/home/linuxbrew/.linuxbrew/bin/xonsh"
vim.opt.laststatus = 3
vim.opt.winborder = "rounded"

vim.lsp.enable({
  "cssls",
  "dockerls",
  "esbonio",
  "jsonls",
  "lua_ls",
  "marksman",
  "pyslp",
  "rust_analyzer",
  "solidity_ls_nomicfoundation",
  "texlab",
  "ts_ls",
  "yamlls",
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {
    current_line = true,
  },
})

