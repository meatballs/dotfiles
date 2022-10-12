local wk = require("which-key")
wk.setup {}

-- Normal mode bindings
wk.register({
    ["f"] = { ":lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
        "Find (forward)" },
    ["F"] = { ":lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
        "Find (backward)" },
    ["<leader>"] = {
        c = {
            name = "+code",
            a = { ":Lspsaga code_action<CR>", "Action" },
            d = { ":Lspsaga preview_definition<CR>", "Definition" },
            f = { ":lua vim.lsp.buf.formatting()<CR>", "Format" },
            l = { ":make --max-line-length 88 --extend-ignore E203<CR><CR>:copen<CR>", "Lint" },
            n = { ":set relativenumber!<CR>", "Line numbers" },
            r = { ":Lspsaga rename<CR>", "Rename" },
            s = { ":Lspsaga signature_help<CR>", "Signature" },
            t = { ":Lspsaga show_line_diagnostics<CR>", "Diagnostics" },
        },
        d = {
            name = "+debug",
            b = { ":lua require'dap'.toggle_breakpoint()<CR>", "Breakpoint" },
            c = { ":lua require'dap'.continue()<CR>", "Continue" },
            si = { ":lua require'dap'.step_into()<CR>", "Step into" },
            so = { ":lua require'dap'.step_over()<CR>", "Step over" },
            sx = { ":lua require'dap'.step_out()<CR>", "Step out" },
        },
        e = {
            name = "+explorer",
            f = { ":NvimTreeToggle<CR>", "Toggle" },
            r = { ":NvimTreeRefresh<CR>", "Refresh" },
        },
        f = {
            name = "+finder",
            b = { ":Telescope buffers<CR>", "Buffers" },
            f = { ":Telescope find_files<CR>", "Files" },
            m = { ":Telescope marks<CR>", "Marks" },
            n = { ":Telescope notify<CR>", "Notifications" },
            p = { ":Telescope projects<CR>", "Projects" },
            t = { ":Telescope treesitter<CR>", "Treesitter" },
        },
        j = {
            name = "+jupyter",
            d = { ":MagmaDelete<CR>", "Delete cell" },
            e = { ":MagmaEvaluateLine<CR>", "Evaluate cell" },
            i = { ":MagmaInit<CR>", "Initialise" },
            r = { ":MagmaReevaluateCell<CR>", "Re-evaluate cell" },
            s = { ":MagmaDeinit<CR>", "Stop" },
        },
        l = {
            name = "+lazy",
            d = { ":lua lazydocker_toggle()<CR>", "Docker" },
            g = { ":lua lazygit_toggle()<CR>", "Git" },
        },
        s = {
            name = "+spell checker",
            d = { ":setlocal nospell<CR>", "Disnable" },
            e = { ":setlocal spell<CR>", "Enable" },
            t = { ":setlocal spell!<CR>", "Toggle" },
        },
        t = {
            name = "+terminal",
            h = { ":ToggleTerm direction=horizontal<CR>", "Horizontal" },
            f = { ":ToggleTerm direction=float<CR>", "Float" },
            v = { ":ToggleTerm direction=vertical<CR>", "Vertical" },
        },
        x = {
            name = "+latex",
            c = { ":VimtexCompile<CR>", "Start compiler" },
            o = { ":VimtexCompileSS<CR>", "Compile once" },
            s = { ":VimtexStop<CR>", "Stop compiler" },
            v = { ":VimtexView<CR>", "View" },
        },
    },
})

-- Visual mode bindings
wk.register({
    ["<leader>"] = {
        c = {
            name = "+code",
            c = { "<Plug>kommentary_visual_default", "Comment" },
        },
        j = {
            name = "+jupyter",
            e = { ":<C-U>MagmaEvaluateVisual<CR>", "Evaluate" },
        },
    }
}, { mode = "x" })
