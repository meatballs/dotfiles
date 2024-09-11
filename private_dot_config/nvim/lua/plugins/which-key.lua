local wk = require("which-key")

-- Normal mode bindings
wk.add(
  {
    { "<leader>c", group = "code" },
    { "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", desc = "Action" },
    { "<leader>cc", ":TSContextToggle<CR>", desc = "Toggle Context" },
    { "<leader>cd", ":lua vim.lsp.buf.definition()<CR>", desc = "Definition" },
    { "<leader>cf", ":lua vim.lsp.buf.format()<CR>", desc = "Format" },
    { "<leader>cl", ":cgetexpr system('ruff -q --ignore E902 check .')<CR>:Trouble quickfix<CR>", desc = "Lint" },
    { "<leader>cn", ":set relativenumber!<CR>", desc = "Line numbers" },
    { "<leader>cr", ":lua vim.lsp.buf.rename<CR>", desc = "Rename" },
    { "<leader>cs", ":lua vim.lsp.buf.signature_help()<CR>", desc = "Signature" },
    { "<leader>d", group = "debug" },
    { "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", desc = "Breakpoint" },
    { "<leader>dc", ":lua require'dap'.continue()<CR>", desc = "Continue" },
    { "<leader>dsi", ":lua require'dap'.step_into()<CR>", desc = "Step into" },
    { "<leader>dso", ":lua require'dap'.step_over()<CR>", desc = "Step over" },
    { "<leader>dsx", ":lua require'dap'.step_out()<CR>", desc = "Step out" },
    { "<leader>e", group = "explorer" },
    { "<leader>ef", ":NvimTreeToggle<CR>", desc = "Toggle" },
    { "<leader>er", ":NvimTreeRefresh<CR>", desc = "Refresh" },
    { "<leader>f", group = "finder" },
    { "<leader>fb", ":Telescope buffers<CR>", desc = "Buffers" },
    { "<leader>ff", ":Telescope file_browser path=%:p:help |select_buffer=true<CR>|", desc = "Files" },
    { "<leader>fg", ":Telescope live_grep search_dirs=.<CR>", desc = "Live grep" },
    { "<leader>fm", ":Telescope marks<CR>", desc = "Marks" },
    { "<leader>fn", ":Telescope notify<CR>", desc = "Notifications" },
    { "<leader>fp", ":Telescope project display_type=full<CR>", desc = "Projects" },
    { "<leader>ft", ":Telescope treesitter<CR>", desc = "Treesitter" },
    { "<leader>g", ":Smoji<CR>", desc="gitmoji"},
    { "<leader>j", group = "jupyter" },
    { "<leader>ja", ":NBAddCell<CR>", desc = "Add cell" },
    { "<leader>jd", ":NBDeleteCell<CR>", desc = "Delete cell" },
    { "<leader>ji", ":NBInsertCell<CR>", desc = "Insert cell" },
    { "<leader>jj", ":NBMoveCellDown<CR>", desc = "Move cell down" },
    { "<leader>jk", ":NBMoveCellUp<CR>", desc = "Move cell up" },
    { "<leader>jm", ":NBMoveCell", desc = "Move cell" },
    { "<leader>jo", ":MagmaShowOutput<CR>", desc = "Show output" },
    { "<leader>jr", ":MagmaReevaluateCell<CR>", desc = "Re-evaluate cell" },
    { "<leader>js", ":MagmaDeinit<CR>", desc = "Stop" },
    { "<leader>l", group = "lazy" },
    { "<leader>ld", ":lua lazydocker_toggle()<CR>", desc = "Docker" },
    { "<leader>lg", ":lua lazygit_toggle()<CR>", desc = "Git" },
    { "<leader>lj", ":lua lazyjj_toggle()<CR>", desc = "Jujutsu" },
    { "<leader>m", group = "markdown" },
    { "<leader>mc", ":MarkdownPreview<CR>", desc = "Preview" },
    { "<leader>me", ":MarkdownExport<CR>", desc = "Export" },
    { "<leader>mp", ":MarkdownPreview<CR>", desc = "Preview" },
    { "<leader>r", group = "run" },
    { "<leader>rr", ":OverseerRun<CR>", desc = "Run Task" },
    { "<leader>rt", ":OverseerToggle<CR>", desc = "Toggle List" },
    { "<leader>s", group = "spell checker" },
    { "<leader>sd", ":setlocal nospell<CR>", desc = "Disable" },
    { "<leader>se", ":setlocal spell<CR>", desc = "Enable" },
    { "<leader>st", ":setlocal spell!<CR>", desc = "Toggle" },
    { "<leader>t", group = "terminal" },
    { "<leader>tf", ":ToggleTerm direction=float<CR>", desc = "Float" },
    { "<leader>th", ":ToggleTerm direction=horizontal<CR>", desc = "Horizontal" },
    { "<leader>tv", ":ToggleTerm direction=vertical<CR>", desc = "Vertical" },
    { "<leader>w", group = "window" },
    { "<leader>wh", ":vertical resize +5<CR>", desc = "Increase width" },
    { "<leader>wj", ":resize -5<CR>", desc = "Decrease height" },
    { "<leader>wk", ":resize +5<CR>", desc = "Increase height" },
    { "<leader>wl", ":vertical resize -5<CR>", desc = "Decrease width" },
    { "<leader>x", group = "latex" },
    { "<leader>xc", ":VimtexClean<CR>", desc = "Clean build files" },
    { "<leader>xo", ":VimtexCompileSS<CR>", desc = "Compile once" },
    { "<leader>xs", ":VimtexCompile<CR>", desc = "Start compiler" },
    { "<leader>xv", ":VimtexView<CR>", desc = "View" },
    { "<leader>xx", ":VimtexStop<CR>", desc = "Stop compiler" },
    { "C-h", ":KittyNavigateLeft<CR>" },
    { "C-j", ":KittyNavigateDown<CR>" },
    { "C-k", ":KittyNavigateUp<CR>" },
    { "C-l", ":KittyNavigateRight<CR>" },
    { "F", ":lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", desc = "Find (backward)" },
    { "f", ":lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", desc = "Find (forward)" },
  }

)

-- Visual mode bindings
wk.add(
  {
    { "<leader>j", group = "jupyter", mode = "x" },
    { "<leader>je", ":<C-U>MagmaEvaluateVisual<CR>", desc = "Evaluate", mode = "x" },
  }
)

