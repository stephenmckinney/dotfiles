# dotfiles

My dotfiles install and configure an IDE comprising neovim + tmux + fish shell on macOS, with a focus on Ruby/Rails and TypeScript development. 

## Getting started

### Generate SSH Keys

Generate and add new SSH keys for Git/GitHub. Remove the keys from the previous computer.

### Install dotfiles

Installs dotfiles and iTerm preferences.

```shell
git clone git@github.com:stephenmckinney/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./install.sh
```

### Install Homebrew packages

Installs Homebrew packages, casks (e.g., iTerm), and Mac App Store apps (e.g., Slack)

- Install [Homebrew](https://brew.sh/)
- Check install: `brew doctor`
- Check Brewfile
- Install all brews, casks, and mas in Brewfile:
  ```shell
  brew update && brew bundle
  ```

### Setup iTerm2

- Open Preferences.
- In **General** tab, under **Preferences** tab, check **Load preferences from a custom folder or URL**.
- Paste `~/.dotfiles/iterm2` into the text field.

### Configure Caps Lock as Control/ESC

- Karabiner should load configuration from [karabiner.json](config/karabiner/karabiner.json).

Now when you hit `Caps Lock` alone, it will act as `ESC`, meaning you can
use it as `ESC` in Vim, but if you hold down `Caps Lock` and hit another
key (like most Emacs keybindings), it will act as if you hit `Control`
plus that other key. Bonus: `CMD` + `Caps Lock` is used in iTerm as a
Visor hotkey.

## Developer Notes
See [CLAUDE.md](CLAUDE.md) for detailed developer documentation and notes.