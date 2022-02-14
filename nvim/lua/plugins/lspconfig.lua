local nvim_lsp = require("lspconfig")
local util = require("lspconfig/util")
local servers = {"pylsp", "yamlls", "texlab"}

local path = util.path

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

local function get_python_path()
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  return "python"
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
          }
          return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
        end,
        single_file_support = true,
        settings = {
	    pylsp = {
	        configurationSources = {"flake8"},
	        plugins = {
		    jedi = {
		        environment = get_python_path(),
		    },
	        },
	    },
        },
    },
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

