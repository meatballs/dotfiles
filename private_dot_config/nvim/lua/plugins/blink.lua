local border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

require("blink-cmp").setup {
    keymap = {
        preset = 'super-tab',
        ['<A-y>'] = require('minuet').make_blink_map(),
    },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'minuet' },
        providers = {
            minuet = {
                name = 'minuet',
                module = 'minuet.blink',
                score_offset = 8,
            },
        },
    },
    completion = {
        menu = {
            auto_show = true,
            border = border_chars,
            draw = {
                columns = {
                    { "label", "label_description", gap = 1, "kind_icon", "kind" },
                },
                treesitter = { "lsp" },
            },
        },
        trigger = {
            prefetch_on_insert = false,
        },
        documentation = {
            auto_show = true,
            window = {
                border = border_chars,
            }
        },
    },
    signature = {
        enabled = true,
        window = {
            border = border_chars,
        }
    },
}
