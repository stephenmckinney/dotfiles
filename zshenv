# Taken from http://zsh.sourceforge.net/FAQ/zshfaq03.html:
#
# The only file you can alter which is started with every zsh (unless you use
# the -f option) is .zshenv, so this is a good place to put things you want
# even if the shell is non-interactive: options for changing the syntax, like
# EXTENDED_GLOB, any changes to set with limit, any more variables you want to
# make sure are set as for example $fpath to find functions. You almost
# certainly do not want .zshenv to produce any output. Some people prefer not
# to use .zshenv for setting options, as this affects scripts; but making zsh
# scripts portable usually requires special handling anyway.

. ~/.zsh/paths

