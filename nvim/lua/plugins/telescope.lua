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
    {"n", "<leader>ff", "<cmd>Telescope file_browser<cr>"},
    {"n", "<leader>fb", "<cmd>Telescope buffers<cr>"},
    {"n", "<leader>ft", "<cmd>Telescope treesitter<cr>"},
    {"n", "<leader>fg", "<cmd>Telescope live_grep<cr>"},
    {"n", "<leader>fp", "<cmd>Telescope projects<cr>"},
}

for k, v in pairs(keybindings) do
    map(v)
end
