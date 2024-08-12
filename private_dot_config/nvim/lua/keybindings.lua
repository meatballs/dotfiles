-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
function map(key)
    local opts = { noremap = true, silent = true }
    for i, v in pairs(key) do
        if type(i) == 'string' then opts[i] = v end
    end

    local buffer = opts.buffer
    opts.buffer = nil

    if buffer then
        vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
    else
        vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
    end
end

return map
