local function lsp_provider()

    local clients = {}
    local icon = ' '

    for _, client in pairs(vim.lsp.buf_get_clients()) do
        local label = icon .. client.name
        clients[#clients + 1] = label
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

local function getWords()
    local file_type = vim.bo.filetype
    if file_type == "markdown" or file_type == "text" or file_type == "rst" or file_type == "tex" then
        local total_words = vim.fn.wordcount().words
        local visual_words = vim.fn.wordcount().visual_words
        local cursor_words = vim.fn.wordcount().cursor_words

        if visual_words ~= nil then
            return tostring(visual_words) .. "/" .. tostring(total_words) .. " words"
        elseif cursor_words ~= nil then
            return tostring(cursor_words) .. "/" .. tostring(total_words) .. " words"
        else
            return tostring(total_words) .. " words"
        end
    else
        return ""
    end
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'nord',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { "filename", { getWords } },
        -- lualine_c = {'filename'},
        lualine_x = { 'encoding', 'fileformat', 'filetype', virtualenv, lsp_provider },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = { 'buffers' },
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
    extensions = { 'fugitive', 'nvim-tree', 'toggleterm' },
}
