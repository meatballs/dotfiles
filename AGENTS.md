# Agent Instructions for Dotfiles Repository

This repository contains personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). It tracks configuration files for various development tools and applies them to target machines.

## Repository Structure

- **Root level**: Shell configurations (`.zshrc`, `.xonshrc`), global git config, editor config
- **`private_dot_config/`**: XDG config directory (`~/.config/`) containing:
  - **nvim**: Neovim configuration (LazyVim-based)
  - **helix**: Helix editor configuration
  - **kitty**: Kitty terminal emulator configuration
  - **jj**: Jujutsu VCS configuration
  - **lazygit/lazydocker**: TUI git/docker clients
  - **yazi**: File manager configuration
  - **iamb**: Matrix client configuration
  - **bottom/glances**: System monitoring tools
  - **regolith3**: Regolith desktop environment config
  - **pudb**: Python debugger configuration

## Key Conventions

### Chezmoi Naming
- `dot_` prefix ’ `.` (dotfiles)
- `private_` prefix ’ excluded from public sharing, may contain secrets
- `symlink_` prefix ’ creates symlinks instead of copying
- Check `.chezmoi.toml.tmpl` or `.chezmoiignore` for templating/ignore rules

### Configuration Philosophy
- Tools are configured for development workflows with Linux/Unix systems
- Git config uses user-specific settings (check for templates)
- Shell configs support xonsh and zsh
- Editor configs emphasize Neovim (LazyVim) and Helix as backup

## When Making Changes

1. **Always use chezmoi commands**:
   - `chezmoi add <file>` - track new dotfiles
   - `chezmoi edit <file>` - edit tracked files
   - `chezmoi apply` - apply changes to home directory
   - `chezmoi diff` - preview changes

2. **Respect privacy boundaries**:
   - Don't commit actual secrets (API keys, tokens, passwords)
   - Use chezmoi templates for machine-specific values
   - Keep `private_` prefixed files truly private

3. **Configuration style**:
   - Prefer declarative configs over scripted setups
   - Document non-obvious settings
   - Keep tool configs modular and self-contained

4. **Testing changes**:
   - Use `chezmoi diff` before applying
   - Test config changes on non-production first
   - Verify symlinks resolve correctly

## Common Tasks

- **Add new config**: `chezmoi add ~/.config/newtool/config.toml`
- **Edit existing config**: `chezmoi edit ~/.config/nvim/init.lua`
- **Track shell config changes**: `chezmoi add ~/.zshrc`
- **Apply changes**: `chezmoi apply`
- **View what's managed**: `chezmoi managed`

## Tool-Specific Notes

### Neovim (LazyVim)
- Check `private_dot_config/nvim/lua/plugins/` for plugin configurations
- Custom keybindings likely in `lua/config/keymaps.lua`
- LSP configs in `private_dot_config/nvim/lsp/`
- Formatting configs in `lua/config/` or plugin files

### Git
- Global gitconfig at `dot_gitconfig`
- May contain user-specific templates or includes
- Check for conditional includes based on directory

### Jujutsu (jj)
- Config at `private_dot_config/private_jj/config.toml`
- Marked private - may contain user email/identity

When working with this repository, prioritize maintaining the existing organizational structure and chezmoi conventions. Always preview changes with `chezmoi diff` before applying.
