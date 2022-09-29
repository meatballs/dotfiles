require("toggleterm").setup {
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.2
        end
    end,
    open_mapping = [[<c-y>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'vertical',
    close_on_exit = true,
    shell = vim.o.shell,
}

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal   = require('toggleterm.terminal').Terminal
local lazygit    = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "single",
    },
})
local lazydocker = Terminal:new({
    cmd = "lazydocker",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "single",
    },
})

function Lazygit_toggle()
    lazygit:toggle()
end

function Lazydocker_toggle()
    lazydocker:toggle()
end
