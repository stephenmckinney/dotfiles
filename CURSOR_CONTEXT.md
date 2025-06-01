# Dotfiles Repository Context

## Overview
This is a comprehensive dotfiles repository containing configuration files and settings for various development tools and environments. The repository is designed to be easily installed on new machines using the included `install.sh` script.

## Primary Configurations

### Shell Environments
- **Fish Shell**: Modern, user-friendly shell with smart features
  - Located in `config/fish/`
  - Includes custom functions, aliases, and environment settings

- **Zsh with Prezto**: Feature-rich shell framework
  - Configuration files: `zshrc`, `zpreztorc`, `zlogin`, `zlogout`, `zshenv`
  - Uses Powerlevel10k theme (`p10k.zsh`)

### Development Tools
- **Neovim**: Modern Vim-based editor
  - Configuration in `config/nvim/`
  - Includes Lua-based configuration and plugins

- **Tmux**: Terminal multiplexer
  - Configuration in `tmux.conf`
  - Includes custom keybindings and session management

### Terminal & UI
- **iTerm2**: macOS terminal emulator
  - Settings in `iterm2/` directory
  - Custom themes and preferences

- **Karabiner**: Keyboard customization
  - Configuration in `config/karabiner/`

## Secondary Configurations

### Ruby & Rails Development
- Ruby configuration files:
  - `irbrc`: Interactive Ruby configuration
  - `pryrc`: Pry REPL configuration
  - `gemrc`: RubyGems configuration
  - `railsrc`: Rails-specific settings
  - `rspec`: RSpec testing configuration

### Git Configuration
- `gitconfig`: Main Git configuration
- `gitconfig-work`: Work-specific Git settings
- `gitignore`: Global Git ignore patterns
- `gitk`: Git GUI configuration

### Utility Scripts
- `bin/`: Directory containing custom utility scripts
- Various tool configurations:
  - `ackrc`: Ack search tool configuration
  - `agignore`: Silver Searcher ignore patterns
  - `aprc`: Apache configuration
  - `dir_colors`: Directory color schemes
  - `inputrc`: Readline configuration
  - `editrc`: Line editor configuration

## Setup and Installation
- `install.sh`: Main installation script
  - Symlinks configuration files to appropriate locations
  - Sets up development environment
  - Installs required dependencies

- `Brewfile`: Homebrew package manager configuration
  - Lists all required packages and applications

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

## Notes
- Some configuration files may be targeted at OS X specifically
- Sensitive information should not be stored in this repository
- The repository uses symlinks to maintain configurations in their standard locations
- Regular updates to this repository help maintain consistency across machines 