local wk = require("which-key")
wk.setup {}
wk.register({
    ["f"] = {":lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", "Find (forward)"},
    ["F"] = {":lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", "Find (backward)"},
    ["<leader>"] = {
        c = {
            name = "+code",
            a = {":Lspsaga code_action<CR>", "Action"},
            d = {":Lspsaga preview_definition<CR>", "Definition"},
            f = {":lua vim.lsp.buf.formatting()<CR>", "Format"},
            l = {":make --max-line-length 88<CR><CR>:copen<CR>", "Lint"},
            n = {":set relativenumber!<CR>", "Line numbers"},
            r = {":Lspsaga rename<CR>", "Rename"},
            s = {":Lspsaga signature_help<CR>", "Signature"},
            t = {":Lspsaga show_line_diagnostics<CR>", "Diagnostics"},
        },
        d = {
            name = "+debug",
            b = {":lua require'dap'.toggle_breakpoint()<CR>", "Breakpoint"},
            c = {":lua require'dap'.continue()<CR>", "Continue"},
            so = {":lua require'dap'.step_over()<CR>", "Step over"},
            si = {":lua require'dap'.step_into()<CR>", "Step into"},
            sx = {":lua require'dap'.step_out()<CR>", "Step out"},
        },
        e = {
            name = "+explorer",
            f = {":NvimTreeToggle<CR>", "Toggle"},
            r = {":NvimTreeRefresh<CR>", "Refresh"},
        },
        f = {
            name = "+finder",
            b = {":Telescope buffers<CR>", "Buffers"},
            f = {":Telescope file_browser", "Files"},
            g = {":Telescope live_grep", "Grep"},
            p = {":Telescope projects", "Projects"},
            t = {":Telescope treesitter", "Treesitter"},
        },
        l = {
            name = "+lazy",
            g = {":lua lazygit_toggle()<CR>", "Git"},
            d = {":lua lazydocker_toggle<CR>", "Docker"},
        },
    },
})
