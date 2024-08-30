local nvim_lsp = require("lspconfig")
local util = require("lspconfig/util")
local servers = {
    "cssls",
    "dockerls",
    "esbonio",
    "jsonls",
    "lua_ls",
    "marksman",
    "pylsp",
    "ruff",
    "rust_analyzer",
    "solidity_ls_nomicfoundation",
    "texlab",
    "tsserver",
    "yamlls",
}

local path = util.path

local on_attach = function(client, bufnr)
    -- Fix for https://github.com/redhat-developer/yaml-language-server/issues/486
    if client.name == "yamlls" then
        client.server_capabilities.documentFormattingProvider = true
    end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

end

local function get_python_path()
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end

    return "/home/owen/.pyenv/versions/nvim/bin/python"
end

local defaults = {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

local server_config = {
    pylsp = {
        cmd = { "pylsp" },
        filetypes = { "python" },
        root_dir = function(fname)
            local root_files = {
                'pyproject.toml',
                'setup.py',
                'setup.cfg',
                'requirements.txt',
                'Pipfile',
                'anvil.yaml',
            }
            return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
        end,
        single_file_support = true,
        settings = {
            pylsp = {
                plugins = {
                    jedi = { environment = get_python_path() },
                },
            },
        },
    },
    ruff = {
        filetypes = { "python" },
    },
    yamlls = {
        settings = {
            yaml = {
                format = { enable = true },
            }
        }
    },
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
                format = {
                    defaultConfig = { indent_style = "space", indent_size = 4 },
                },
            },
        },
    },
    esbonio = { cmd = { "esbonio" } },
}

for _, server in pairs(servers) do
    local config = {}
    for k, v in pairs(defaults) do
        config[k] = v
    end
    if server_config[server] then
        for k, v in pairs(server_config[server]) do
            config[k] = v
        end
    end
    nvim_lsp[server].setup(config)
end
