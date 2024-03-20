local wk = require("which-key")
wk.setup {}



-- Normal mode bindings
wk.register({
    ["f"] = { ":lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
        "Find (forward)" },
    ["F"] = { ":lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
        "Find (backward)" },
    ["C-h"] = { ":NavigatorLeft<CR>" },
    ["C-l"] = { ":NavigatorRight<CR>" },
    ["C-j"] = { ":NavigatorDown<CR>" },
    ["C-k"] = { ":NavigatorUp<CR>" },
    ["<leader>"] = {
        c = {
            name = "+code",
            a = { ":lua vim.lsp.buf.code_action()<CR>", "Action" },
            d = { ":lua vim.lsp.buf.definition()<CR>", "Definition" },
            f = { ":lua vim.lsp.buf.format()<CR>", "Format" },
            l = { ":cgetexpr system('ruff -q --ignore E902 check .')<CR>:Trouble quickfix<CR>", "Lint" },
            n = { ":set relativenumber!<CR>", "Line numbers" },
            r = { ":lua vim.lsp.buf.rename<CR>", "Rename" },
            s = { ":lua vim.lsp.buf.signature_help()<CR>", "Signature" },
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
            f = { ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "Files" },
            g = { ":Telescope live_grep<CR>", "Live grep" },
            m = { ":Telescope marks<CR>", "Marks" },
            n = { ":Telescope notify<CR>", "Notifications" },
            p = { ":Telescope project display_type=full<CR>", "Projects" },
            t = { ":Telescope treesitter<CR>", "Treesitter" },
        },
        j = {
            name = "+jupyter",
            a = { ":NBAddCell<CR>", "Add cell" },
            d = { ":NBDeleteCell<CR>", "Delete cell" },
            i = { ":NBInsertCell<CR>", "Insert cell" },
            j = { ":NBMoveCellDown<CR>", "Move cell down" },
            k = { ":NBMoveCellUp<CR>", "Move cell up" },
            m = { ":NBMoveCell", "Move cell" },
            o = { ":MagmaShowOutput<CR>", "Show output" },
            r = { ":MagmaReevaluateCell<CR>", "Re-evaluate cell" },
            s = { ":MagmaDeinit<CR>", "Stop" },
        },
        l = {
            name = "+lazy",
            d = { ":lua lazydocker_toggle()<CR>", "Docker" },
            g = { ":lua lazygit_toggle()<CR>", "Git" },
        },
        r = {
            name = "+run",
            r = { ":OverseerRun<CR>", "Run Task" },
            t = { ":OverseerToggle<CR>", "Toggle List" },
        },
        s = {
            name = "+spell checker",
            d = { ":setlocal nospell<CR>", "Disable" },
            e = { ":setlocal spell<CR>", "Enable" },
            t = { ":setlocal spell!<CR>", "Toggle" },
        },
        t = {
            name = "+terminal",
            h = { ":ToggleTerm direction=horizontal<CR>", "Horizontal" },
            f = { ":ToggleTerm direction=float<CR>", "Float" },
            v = { ":ToggleTerm direction=vertical<CR>", "Vertical" },
        },
        w = {
            name = "+window",
            h = { ":vertical resize +5<CR>", "Increase width" },
            j = { ":resize -5<CR>", "Decrease height" },
            k = { ":resize +5<CR>", "Increase height" },
            l = { ":vertical resize -5<CR>", "Decrease width" },
        },
        x = {
            name = "+latex",
            c = { ":VimtexClean<CR>", "Clean build files" },
            o = { ":VimtexCompileSS<CR>", "Compile once" },
            s = { ":VimtexCompile<CR>", "Start compiler" },
            v = { ":VimtexView<CR>", "View" },
            x = { ":VimtexStop<CR>", "Stop compiler" },
        },
    },
})

-- Visual mode bindings
wk.register({
    ["<leader>"] = {
        j = {
            name = "+jupyter",
            e = { ":<C-U>MagmaEvaluateVisual<CR>", "Evaluate" },
        },
    }
}, { mode = "x" })
