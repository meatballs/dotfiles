local function get_python_path()
    if vim.env.VIRTUAL_ENV then
        return vim.fs.joinpath(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end

    return "/home/owen/.virtualenvs/neovim/bin/python"
end

return {
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_dir = function(fname)
        local markers = {
            'pyproject.toml',
            'setup.py',
            'setup.cfg',
            'requirements.txt',
            'Pipfile',
            'anvil.yaml',
        }
        
        local dir = vim.fs.dirname(fname)
        
        -- Search for root markers
        while dir and dir ~= "" do
            for _, marker in ipairs(markers) do
                if vim.loop.fs_stat(vim.fs.joinpath(dir, marker)) then
                    return dir
                end
            end
            
            -- Move up one directory
            local parent = vim.fs.dirname(dir)
            if parent == dir then
                break
            end
            dir = parent
        end
        
        -- Fallback to the file's directory
        return vim.fs.dirname(fname)
    end,
    settings = {
        pylsp = {
            plugins = {
                jedi = { environment = get_python_path() },
            },
        },
    },
}
