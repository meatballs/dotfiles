require("notify").setup {
    max_width = 100,
}
vim.notify = require("notify")
require("telescope").load_extension("notify")
