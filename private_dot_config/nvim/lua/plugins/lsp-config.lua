return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      servers = {
        texlab = {
          keys = {
            { "<leader>kc", ":VimtexClean<CR>", desc = "Clean build files" },
            { "<leader>ko", ":VimtexCompileSS<CR>", desc = "Compile once" },
            { "<leader>ks", ":VimtexCompile<CR>", desc = "Start compiler" },
            { "<leader>kv", ":VimtexView<CR>", desc = "View" },
            { "<leader>kx", ":VimtexStop<CR>", desc = "Stop compiler" },
          },
        },
        ruff = {},
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                pylint = { enabled = false },
                pylsp_mypy = { enabled = false },
                pylsp_rope = { enabled = false },
              },
            },
          },
        },
        basedpyright = {
          settings = {
            basedpyright = {
              disableLanguageServices = true,
              disableOrganizeImports = true,
              disableTaggedHints = true,
              analysis = {
                diagnosticSeverityOverrides = {
                  reportUnusedVariable = false,
                  reportUndefinedVariable = false,
                },
              },
            },
          },
        },
      },
    },
  },
}
