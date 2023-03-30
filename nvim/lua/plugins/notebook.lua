require("notebook")

function _G.define_cell()
    local extmarks = vim.api.nvim_buf_get_var(0, "notebook.extmarks")
    local settings = vim.api.nvim_buf_get_var(0, "notebook.settings")
    local current_line = vim.api.nvim__buf_stats(0).current_lnum

    for id, _ in pairs(extmarks) do
        local extmark = vim.api.nvim_buf_get_extmark_by_id(
            0, settings.plugin_namespace, id, { details = true }
        )
        local start_line = extmark[1] + 1
        local end_line = extmark[3].end_row
        if current_line >= start_line and current_line <= end_line then
            vim.fn.MagmaDefineCell(start_line, end_line)
            break
        end
    end
end

function _G.define_all_cells()
    local extmarks = vim.api.nvim_buf_get_var(0, "notebook.extmarks")
    local settings = vim.api.nvim_buf_get_var(0, "notebook.settings")

    for id, cell in pairs(extmarks) do
        local extmark = vim.api.nvim_buf_get_extmark_by_id(
            0, settings.plugin_namespace, id, { details = true }
        )
        if cell.cell_type == "code" then
            local start_line = extmark[1] + 1
            local end_line = extmark[3].end_row
            vim.fn.MagmaDefineCell(start_line, end_line)
        end
    end

end

vim.api.nvim_create_autocmd(
    { "BufRead", },
    { pattern = { "*.ipynb" }, command = "MagmaInit" }
)
vim.api.nvim_create_autocmd(
     "User",
    {pattern = "MagmaInitPost", callback = _G.define_all_cells }
)
