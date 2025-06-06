return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
  { "knubie/vim-kitty-navigator" },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        separator_style = "slant",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      servers = {
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
