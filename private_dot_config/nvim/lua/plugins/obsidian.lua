local options = {
    workspaces = {
        {
            name = "Owen",
            path = "~/Nextcloud/Obsidian/Owen/",
        }
    },
    completion = {
        nvim_cmp = true,
    },
}
require("obsidian").setup(options)
