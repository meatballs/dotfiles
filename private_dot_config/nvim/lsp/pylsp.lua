return {
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "anvil.yaml",
  },
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        pylint = { enabled = false },
        pylsp_mypy = { enabled = false },
        pylsp_rope = { enabled = false },
      },
    },
  },
}
