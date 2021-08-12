local actions = require("telescope.actions")
local map = require("keybindings")

require("telescope").setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  }
}
require('telescope').load_extension('dap')

keybindings = {
    {"n", "<leader>tf", "<cmd>Telescope file_browser<cr>"},
    {"n", "<leader>tb", "<cmd>Telescope buffers<cr>"},
    {"n", "<leader>tt", "<cmd>Telescope treesitter<cr>"},
    {"n", "<leader>tg", "<cmd>Telescope git_files<cr>"},
}

for k, v in pairs(keybindings) do
    map(v)
end
