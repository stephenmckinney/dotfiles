# Startup file order
#
#   * /etc/zshenv - Usually run for every zsh.
#   * ~/.zshenv
#   * /etc/zprofile - Run for login shells.
#   * ~/.zprofile
#   * /etc/zshrc - Run for interactive shells.
#   * ~/.zshrc
#   * /etc/zlogin - Run for login shells.
#   * ~/.zlogin
#
# Taken from http://zsh.sourceforge.net/FAQ/zshfaq03.html:
#
# Finally, .zshrc is run for every interactive shell; that includes login
# shells, but also any other time you start up a shell, such as simply by
# typing zsh or opening a new terminal emulator window. This file is the place
# to change the editing behaviour via options or bindkey, control how your
# history is saved, set aliases unless you want to use them in scripts too, and
# for any other clutter which can't be exported but you only use when
# interacting directly with the shell. You probably don't want .zshrc to
# produce output, either, since there are occasions when this can be a problem,
# such as when using rsh from another host. See 3.21 for what to put in .zshrc
# to save your history.

. ~/.zsh/config
. ~/.zsh/aliases

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
