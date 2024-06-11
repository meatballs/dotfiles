local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        initial_mode = "normal",
        mappings = {
            n = {
                ["q"] = actions.close,
            },
        },
    },
    pickers = {
        extensions ={
            project = {
                base_dirs = { "~/projects", max_depth=4 },
            }
        }
    }
}
require('telescope').load_extension('dap')
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")
