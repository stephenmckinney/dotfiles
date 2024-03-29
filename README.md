# my dotfiles

Create an IDE using vim + tmux + fish with a focus on Ruby and TypeScript development on OS X.

## First...

- copy over `~/.localrc`.
- copy over `~/.zhistory` to aid `fasd`.
- generate and add new ssh keys for git/github. remove the keys from the
  previous computer.

## Getting started

### Install dotfiles

Installs dotfiles, prezto, and iTerm preferences.

```shell
git clone --recursive git@github.com:stephenmckinney/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./install.sh
```

### Install brews

Installs brews, casks (e.g. iTerm), and mas (e.g. Slack)

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
- Paste `~/.dotfiles/iterm2` into the text field (this should import
  of Solarized Dark and Solarized Light
  [itermcolors](https://iterm2colorschemes.com).

### Remap `Caps Lock` to act like `Control` and `ESC` at the same time

- Karabiner should load configuration from [karabiner.json](config/karabiner/karabiner.json).

Now when you hit `Caps Lock` alone, it will act as `ESC`, meaning you can
use it as `ESC` in Vim, but if you hold down `Caps Lock` and hit another
key (like most Emacs keybindings), it will act as if you hit `Control`
plus that other key. Bonus: `CMD` + `Caps Lock` is used in iTerm as a
Visor hotkey.

## Staying updated

Merge updates from prezto/sorin/master and rebase changes.
