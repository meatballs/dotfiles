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
    "lervag/vimtex",
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      vim.g.tex_flavor = "latex"
      vim.g.tex_conceal = ""
      vim.g.vimtex_fold_manual = 1
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_mappings_enabled = false
      vim.g.vimtex_compiler_method = "tectonic"
    end,
    keys = {
      { "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
    },
  },
  {
    "chrisbra/csv.vim",
    lazy = true,
    ft = "csv",
    config = function()
      vim.g.csv_highlight_column = "y"
    end,
  },
  {
    "glacambre/firenvim",
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    config = function()
      vim.g.firenvim_config = {
        globalSettings = {
          alt = "all",
        },
        localSettings = {
          [".*"] = {
            cmdline = "neovim",
            priority = 0,
            selector = "textarea",
            takeover = "never",
          },
        },
      }
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    opts = {
      workspaces = {
        {
          name = "Owen",
          path = "~/Nextcloud/Obsidian/Owen/",
        },
      },
      notes_subdir = "Notes",
      daily_notes = {
        folder = "Journal",
        date_format = "%d %b %Y",
      },
      ui = { enable = false },
    },
  },
}
