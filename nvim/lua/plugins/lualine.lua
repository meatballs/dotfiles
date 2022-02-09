local function lsp_provider()

    local clients = {}
    local icon = ' '

    for _, client in pairs(vim.lsp.buf_get_clients()) do
        if client.name == "pylsp" then
            local venv_name = ""
            if vim.env.VIRTUAL_ENV then
                venv_name = vim.env.VIRTUAL_ENV:match("([^/]+)$")
            else
                venv_name = client.config.settings.pylsp.plugins.jedi.environment
            end
            clients[#clients+1] = icon .. client.name .. '('.. venv_name .. ')'
        else
          clients[#clients+1] = icon .. client.name
        end
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

