local function lsp_provider()

    local clients = {}
    local icon = ' '
    local snake = '🐍️ '

    for _, client in pairs(vim.lsp.buf_get_clients()) do
        local label = icon .. client.name
        if (client.name == "pylsp" and vim.env.VIRTUAL_ENV) then
            local venv_name = vim.env.VIRTUAL_ENV:match("([^/]+)$")
            label = label .."(".. snake .. venv_name ..")"
        end
        clients[#clients+1] = label
    end

    return table.concat(clients, ' ')
end


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype', lsp_provider},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive', 'nvim-tree'},
}

