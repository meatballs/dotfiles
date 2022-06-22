local function lsp_provider()

    local clients = {}
    local icon = ' '

    for _, client in pairs(vim.lsp.buf_get_clients()) do
        local label = icon .. client.name
        clients[#clients+1] = label
    end

    return table.concat(clients, ' ')
end

local function virtualenv()
    local snake = '🐍️ '
    local venv = vim.env.VIRTUAL_ENV
    if venv then
        local venv_name = venv:match("([^/]+)$")
        return snake .. venv_name
    end
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
    lualine_x = {'encoding', 'fileformat', 'filetype', virtualenv, lsp_provider},
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
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'tabs',
        mode = 2,
      },
    }
  },
  extensions = {'fugitive', 'nvim-tree', 'toggleterm'},
}
