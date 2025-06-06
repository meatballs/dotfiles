-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local global_settings = {
  python3_host_prog = "/home/owen/.virtualenvs/neovim/bin/python",
  lazyvim_python_lsp = "basedpyright",
  spelllang = "en-gb",
}
local options = {
  colorcolumn = { 88 },
  completeopt = { "menuone", "noinsert" },
  cursorline = true,
  guifont = "SauceCodePro Nerd Font Mono:h11",
  hidden = true,
  number = true,
  shell = "/home/linuxbrew/.linuxbrew/bin/xonsh",
  laststatus = 3,
  winborder = "rounded",
}
vim.lsp.enable({
  "cssls",
  "dockerls",
  "esbonio",
  "jsonls",
  "lua_ls",
  "marksman",
  "pyslp",
  -- "pyright",
  -- "ruff",
  "rust_analyzer",
  "solidity_ls_nomicfoundation",
  "texlab",
  "ts_ls",
  "yamlls",
})

for k, v in pairs(global_settings) do
  vim.g[k] = v
end

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {
    current_line = true,
  },
})
