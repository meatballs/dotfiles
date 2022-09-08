local nvim_lsp = require("lspconfig")
local util = require("lspconfig/util")
local servers = {"pylsp", "yamlls", "texlab", "dockerls", "marksman", "cssls", "texlab"}

local path = util.path

local on_attach = function(client, bufnr)
  -- Fix for https://github.com/redhat-developer/yaml-language-server/issues/486
  if client.name == "yamlls" then
    client.resolved_capabilities.document_formatting = true
  end

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
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
	        configurationSources = {"flake8"},
	        plugins = {
		    jedi = {
		        environment = get_python_path(),
		    },
	        },
	    },
        },
    },
    yamlls = {
        settings = {
            yaml = {
                format = {enable = true},
            }
        }
    }
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

