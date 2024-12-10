local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
    -- snippet = {
    --     expand = function(args)
    --         vim.fn["vsnip#anonymous"](args.body)
    --     end,
    -- },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources({
        { name = "copilot" },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'gitmoji' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = {
                menu = 50,
                abbr = 50,
            },
            symbol_map = { Copilot = "" },
            ellipsis_char = '...',
            show_labelDetails = true,
        })
    }
})
