local util = require("lspconfig/util")
local path = util.path

local function get_python_path()
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end

    return "/home/owen/.virtualenvs/neovim/bin/python"
end

return {
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'anvil.yaml',
    },
    settings = {
        pylsp = {
            plugins = {
                jedi = { environment = get_python_path() },
            },
        },
    },
}
