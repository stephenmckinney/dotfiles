# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive dotfiles repository for setting up a development environment on macOS, with a focus on Ruby/Rails and TypeScript development. The repository uses a symlink-based installation approach where configuration files remain in the repository and are symlinked to their standard locations.

## Common Commands

### Installation and Setup
```bash
# Install dotfiles (creates symlinks)
./install.sh                    # Full installation
./install.sh --dry-run         # Preview changes without making them
./install.sh --remote-shell    # Minimal installation for remote servers

# Install all Homebrew packages, casks, and Mac App Store apps
brew bundle

# Check and install Neovim dependencies
./bin/check_neovim --gems --brews
./bin/check_neovim --gems --brews --dry-run  # Preview without installing
```

### Development Commands
Since this is a dotfiles repository, there are no traditional build/test commands. However, when modifying configurations:

1. **Fish Shell**: Changes to fish configurations take effect immediately or after running `source ~/.config/fish/config.fish`
2. **Neovim**: Run `:checkhealth` in Neovim to verify configuration health
3. **Tmux**: Reload configuration with `tmux source-file ~/.tmux.conf`

## Architecture and Key Components

### Shell Configuration Structure
The repository supports three shell environments:

1. **Fish Shell (Primary)** - Modern shell with smart features
   - Configuration: `config/fish/`
   - Functions: `config/fish/functions/` - Custom functions like `nvm.fish`
   - Config modules: `config/fish/conf.d/` - Loaded automatically in order
   - Plugins managed via Fisher (fish plugin manager)
   - Includes custom functions, aliases, and environment settings

2. **Zsh with Prezto (Secondary)** - Traditional shell with extensive framework
   - Main config: `zshrc`, `zshenv`, `zprofile`, `zlogin`, `zlogout`, `zpreztorc`
   - Theme: Powerlevel10k (`p10k.zsh`)
   - Framework: Prezto (included as git submodule)

3. **Bash (Minimal)** - Basic configuration for compatibility
   - Configuration: `bashrc`
   - Minimal setup optimized for Claude Code and other tools
   - Includes essential environment variables: Homebrew, Ruby/Rails, NPM, editor preferences
   - Automatic Node.js version detection via NVM (same logic as Fish)
   - rbenv initialization for Ruby version management

### Development Tools

#### Neovim Configuration
Located in `config/nvim/`, uses Lua-based configuration:
- Plugin management via lazy.nvim
- LSP integration for multiple languages
- DAP (Debug Adapter Protocol) support
- AI integrations: ChatGPT and GitHub Copilot
- Extensive custom keymappings and IDE features

#### Tmux Configuration
- Configuration in `tmux.conf`
- Custom keybindings and session management
- Integration with Fish/Zsh shells

### Terminal & UI

1. **iTerm2**: macOS terminal emulator
   - Settings in `iterm2/` directory
   - Custom themes and preferences (Solarized Dark/Light)
   - Visor hotkey integration

2. **Karabiner**: Keyboard customization
   - Configuration in `config/karabiner/`
   - Caps Lock remapped to act as both Control (when held) and ESC (when tapped)

### Ruby & Rails Development
Comprehensive Ruby development setup:
- `gemrc`: RubyGems configuration
- `rspec`: RSpec testing configuration
- Ruby version management via rbenv (installed via Homebrew)

### Git Configuration
- `gitconfig`: Main Git configuration
- `gitconfig-work`: Work-specific Git settings
- `gitignore`: Global Git ignore patterns
- Custom git utilities in `bin/` for branch/tag management

### Key Integration Points
1. **Git Workflow**: Custom git utilities in `bin/` for branch/tag management
2. **Tmux Integration**: Session management and navigation shortcuts
3. **FZF Integration**: Fuzzy finding integrated across fish, zsh, and neovim
4. **Modern CLI Tools**: Heavy use of ripgrep, bat, fd, fasd

### Installation Process
The `install.sh` script:
1. Creates symlinks from dotfiles to home directory (e.g., `~/.zshrc` → `~/.dotfiles/zshrc`)
2. Special handling for `config/` directory contents (symlinked to `~/.config/`)
3. Skips files in denylist (README, Brewfile, etc.)
4. Installs Fish shell and sets as default if not in remote-shell mode
5. Installs Fisher and fish plugins

### Package Management
`Brewfile` manages all dependencies:
- Development tools: neovim, tmux, git, fzf, ripgrep, bat, fd, the_silver_searcher
- Programming languages: Ruby (rbenv), Node.js
- Services: PostgreSQL, Redis

### Environment Variables and Local Overrides
- Local machine-specific settings: `~/.localrc` (not tracked in git)
- Work-specific git config: `gitconfig-work`
- Environment variables set in: `config/fish/conf.d/01-set_env.fish` or `zshenv`
- NPM token extracted from `~/.npmrc` for private packages

### Utility Scripts
Custom scripts in `bin/` directory:
- Git workflow helpers (branch/tag management)
- Tmux utilities
- Neovim integration scripts
- `check_neovim`: Validates and installs Neovim dependencies

## Directory Structure
```
.
├── bin/               # Custom utility scripts
├── config/           # Application configurations
│   ├── fish/        # Fish shell configuration
│   ├── karabiner/   # Keyboard customization
│   └── nvim/        # Neovim configuration
├── iterm2/          # iTerm2 settings
├── .ruby-lsp/       # Ruby LSP configuration
├── bundle/          # Bundler configuration
└── [various config files]
```

## Important Notes

1. **Node Version Management**: Uses nvm with automatic default version detection
2. **Keyboard Remapping**: Karabiner configuration maps Caps Lock to act as both Control (when held) and ESC (when tapped)
3. **First-time Setup**: Copy over `~/.localrc` and `~/.zhistory` from previous machine
4. **SSH Keys**: Generate new SSH keys for git/github after installation
5. **OS Targeting**: Configurations are optimized for macOS
6. **Sensitive Information**: Should not be stored in this repository
