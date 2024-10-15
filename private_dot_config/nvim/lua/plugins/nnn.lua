local builtin = require("nnn").builtin
require("nnn").setup({
    picker = {
        cmd = "nnn -Pp",
    },
    mappings = {
        {"<C-v>", builtin.open_in_vsplit},
    }
})
