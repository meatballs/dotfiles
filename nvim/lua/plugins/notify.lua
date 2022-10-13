require("notify").setup {
    max_width = 100,
    top_down = false,
}
vim.notify = require("notify")
require("telescope").load_extension("notify")
