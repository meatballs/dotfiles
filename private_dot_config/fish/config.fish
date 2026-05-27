# ~/.config/fish/config.fish
# Ported from dot_xonshrc. Complex helpers live in functions/*.fish;
# autovox-style venv hook lives in conf.d/autovox.fish.

# ───── Environment ─────
set -gx EDITOR nvim
set -gx PYTEST_ADDOPTS "--pdbcls pudb.debugger:Debugger --capture=no"
set -gx DOCKER_BUILDKIT 1
set -gx BAT_THEME Nord
set -gx OLLAMA_API_BASE http://localhost:11434
set -gx OLLAMA_FAKE_API_KEY fake
set -gx PODMAN_COMPOSE_WARNING_LOGS false
set -gx OPENCODE_EXPERIMENTAL_LSP_TOOL true

# ───── PATH (prepended, idempotent) ─────
fish_add_path -p \
    $HOME/AppImages \
    $HOME/.cargo/bin \
    $HOME/.radicle/bin \
    $HOME/.local/bin \
    $HOME/bin \
    $HOME/go/bin \
    $HOME/.bun/bin \
    /home/linuxbrew/.linuxbrew/bin \
    /home/linuxbrew/.linuxbrew/sbin

# ───── Interactive-only ─────
if status is-interactive
    # Suppress the "Welcome to fish…" banner on shell start.
    set -g fish_greeting ""

    # was $VI_MODE = True
    fish_vi_key_bindings

    # ── Abbreviations (expand inline on space/enter — fish's idiom over alias) ──
    abbr -a gst git status
    abbr -a gco git checkout
    abbr -a gcm git checkout main
    abbr -a glg git log --oneline --graph --decorate

    abbr -a open xdg-open
    abbr -a rm trash
    abbr -a bat batcat
    abbr -a cat batcat
    abbr -a ssh kitty +kitten ssh
    abbr -a 'nvim.basic' nvim -u ~/.config/nvim/basic.lua
    abbr -a gearlever flatpak run it.mijorus.gearlever
    abbr -a xclip xclip -selection clipboard

    # ── Tool init ──
    starship init fish | source
    zoxide init --cmd cd fish | source
    direnv hook fish | source
    mnemosyne shellenv --shell fish | source
end
