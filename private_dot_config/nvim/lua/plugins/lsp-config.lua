return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
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
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
              format = {
                defaultConfig = { indent_style = "space", indent_size = 4 },
              },
            },
          },
        },
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                autopep8 = { enabled = false },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                pylint = { enabled = false },
                pylsp_mypy = { enabled = false },
                pylsp_rope = { enabled = false },
                yapf = { enabled = false },
              },
            },
          },
        },
        ruff = {},
        texlab = {
          keys = {
            { "<leader>kc", ":VimtexClean<CR>", desc = "Clean build files" },
            { "<leader>ko", ":VimtexCompileSS<CR>", desc = "Compile once" },
            { "<leader>ks", ":VimtexCompile<CR>", desc = "Start compiler" },
            { "<leader>kv", ":VimtexView<CR>", desc = "View" },
            { "<leader>kx", ":VimtexStop<CR>", desc = "Stop compiler" },
          },
        },
      },
    },
  },
}
