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
    notes_subdir = "Notes",
    daily_notes = {
        folder = "Journal",
        date_format = "%d %b %Y"
    },
}
require("obsidian").setup(options)
