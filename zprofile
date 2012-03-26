# Taken from http://zsh.sourceforge.net/FAQ/zshfaq03.html:
#
# .zprofile and .zlogin are only run when the shell is a login shell --- when
# you first login, of course, and whenever you start zsh with the -l option.
# All login shells are interactive. The order is the only difference between
# those; you should decide whether you need things set before or after .zshrc.
# These files are a good place to set environment variables (i.e. export
# commands), since they are passed on to all shells without you having to set
# them again, and also to check that your terminal is set up properly (except
# that if you want to change settings for terminal emulator windows like xterm
# you will need to put those in .zshrc, since usually you do not get a login
# shell here).

#. ~/.zsh/config
