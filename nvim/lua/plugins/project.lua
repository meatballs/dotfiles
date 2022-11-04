require("project_nvim").setup {
    silent_chdir = false,
    ignore_lsp = {"pylsp"},
}
require("telescope").load_extension("projects")
