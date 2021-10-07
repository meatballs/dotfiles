require("nvim-tree").setup()
local map = require("keybindings")

keybindings = {
    {"n", "<leader>ef", ":NvimTreeToggle<cr>"},
    {"n", "<leader>er", ":NvimTreeRefresh<cr>"},
}


for k, v in pairs(keybindings) do
    map(v)
end
