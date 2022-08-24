local wk = require("which-key")
wk.setup {}

-- Normal mode bindings
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
            f = {":Telescope file_browser<CR>", "Files"},
            g = {":Telescope live_grep<CR>", "Grep"},
            p = {":Telescope projects<CR>", "Projects"},
            t = {":Telescope treesitter<CR>", "Treesitter"},
        },
        j = {
            name = "+jupyter",
            d = {":MagmaDelete<CR>", "Delete cell"},
            e = {":MagmaEvaluateLine<CR>", "Evaluate cell"},
            i = {":MagmaInit<CR>", "Initialise"},
            r = {":MagmaReevaluateCell<CR>", "Re-evaluate cell"},
            s = {":MagmaDeinit<CR>", "Stop"},
        },
        l = {
            name = "+lazy",
            g = {":lua lazygit_toggle()<CR>", "Git"},
            d = {":lua lazydocker_toggle<CR>", "Docker"},
        },
        t = {
            name = "+terminal",
            v = {":ToggleTerm direction=vertical<CR>", "Vertical"},
            h = {":ToggleTerm direction=horizontal<CR>", "Horizontal"},
            f = {":ToggleTerm direction=float<CR>", "Float"},
        },
    },
})

-- Visual mode bindings
wk.register({
    ["<leader>"] = {
        j = {
            name = "+jupyter",
            e = {":<C-U>MagmaEvaluateVisual<CR>", "Evaluate"},
        },
    }
}, {mode="x"})
