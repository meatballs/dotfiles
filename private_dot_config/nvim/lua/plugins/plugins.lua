return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
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
  {
    "swaits/lazyjj.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      mapping = "<leader>gj",
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        enabled = true,
        render_modes = false,
        atx = true,
        setext = true,
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        position = "overlay",
        signs = { "󰫎 " },
        width = "full",
        left_margin = 0,
        left_pad = 0,
        right_pad = 0,
        min_width = 0,
        border = false,
        border_virtual = false,
        border_prefix = false,
        above = "▄",
        below = "▀",
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
        foregrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        },
        custom = {},
      },
      checkbox = {
        enabled = true,
        render_modes = false,
        bullet = false,
        right_pad = 1,
        unchecked = {
          icon = "󰄱 ",
          highlight = "RenderMarkdownUnchecked",
          scope_highlight = nil,
        },
        checked = {
          icon = "󰱒 ",
          highlight = "RenderMarkdownChecked",
          scope_highlight = nil,
        },
        custom = {
          todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
        },
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    opts = { view = { merge_tool = { layout = "diff4_mixed" } } },
  },
}
