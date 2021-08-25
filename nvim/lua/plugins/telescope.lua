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
    {"n", "<leader>ee", "<cmd>Telescope file_browser<cr>"},
    {"n", "<leader>eb", "<cmd>Telescope buffers<cr>"},
    {"n", "<leader>et", "<cmd>Telescope treesitter<cr>"},
    {"n", "<leader>eg", "<cmd>Telescope git_files<cr>"},
}

for k, v in pairs(keybindings) do
    map(v)
end
