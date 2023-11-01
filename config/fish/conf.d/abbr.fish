# New utilities Aug 31, 2018
abbr cat "bat --theme=TwoDark"
abbr help "tldr"
abbr ping "prettyping --nolegend"

# # meta alias
# alias aliasgrep='alias | grep $(echo $1)'
#
# # ps | grep
# alias psgrep='ps -e -o pid,command | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'
#
#
# # Git
abbr g "git"
# alias gbpurgedryrun='git branch --merged | grep -v "\*" | grep -v "master"'
# alias gbpurge='git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d'
#
# # Heroku
# alias h='heroku'
#
# # Nvim
# alias v='nvim .'
# alias vi='nvim'
#
# # Edit dotfiles
# alias edots='vim ~/.dotfiles'
# alias eprezto='vim ~/.zprezto'
#
# # Mac OS X
# alias show_hidden='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'
# alias hide_hidden='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
# # Lock the screen (when going AFK)
# alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
#
# # Misc.
# alias gf='fg'            # I often screw this up.
#
# # Slack CLI
# alias slack-meeting='slack status edit --text "In meetings" --emoji :virtual-meeting: && slack presence active && slack snooze start'
# alias slack-lunch='slack status edit --text "lunch [back at $(date -v +30M +"%l:%M %p")]" --emoji :taco: && slack presence away && slack snooze end'
# alias slack-focus='slack status edit --text "Heads down, Slack delayed" --emoji :heads-down: && slack presence active && slack snooze start'
# alias slack-back='slack status clear && slack presence active && slack snooze end'
# # alias slack-PERSON='slack chat send "hey <https://docs.google.com/TKTK|FILENAME>" @PERSON'
abbr mux "tmuxifier load-session"
#
# # Edit dotfiles
# alias edots='vim ~/.dotfiles'
# alias eprezto='vim ~/.zprezto'
#
# [alias]
# # blame
# blame = blame -w
#
# # branch
# b  = branch
# ba = branch -av
# bd = branch -d
# bm = branch -m
# bs = show-branch
#
# # checkout/fetch/merge/push/rebase
# # checkout
# co  = checkout
# cob = checkout -b
# co0 = checkout HEAD -- 
# com = checkout main
# # fetch
# f   = fetch
# fm  = pull
# fo  = fetch origin
# fu  = fetch upstream
# # merge
# m   = merge
# mom = merge origin/main
# # push
# p   = push
# pa  = push --all
# pt  = push --tags
# # rebase
# r   = rebase
# ra  = rebase --abort
# rc  = rebase --continue
# ri  = rebase --interactive
# rs  = rebase --skip
# rom = rebase origin/main
# riom = rebase --interactive origin/main
#
# # commit
# c      = commit --verbose
# cm     = commit --verbose --message
# ca     = commit --verbose --all
# cam    = commit --verbose --all --message
# camend = commit --amend --reuse-message HEAD
# camendm= commit --amend --verbose
# cp     = cherry-pick -sex
# # verbose alternatives
# undo-last-commit = reset --soft "HEAD^"
#
# #stash
# sl  = stash list
# ss  = stash show
# ssp = stash show -p
# sp  = stash pop
# sd  = stash drop
# sc  = stash clear
#
# # diff
# d    = diff          # Diff working dir to index
# dw   = diff -w       # Diff ignore whitespace
# ds   = diff --staged # Diff index to HEAD
# dc   = diff --staged # Diff index to HEAD
# dh   = diff HEAD     # Diff working dir and index to HEAD
#
# # hub
# h = browse
# hc = compare
#
# # index
# s  = status
# a  = add
# ia = add
# ir = reset
# unstage = reset HEAD 
#
# # log
# l   = log --topo-order --pretty=format:'%C(yellow)%h %C(cyan)%cn %C(blue)%cr%C(reset) %s'
# ls  = log --topo-order --stat --pretty=format:'%C(bold)%C(yellow)Commit:%C(reset) %C(yellow)%H%C(red)%d%n%C(bold)%C(yellow)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)%C(yellow)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
# ld  = log --topo-order --stat --patch --full-diff --pretty=format:'%C(bold)%C(yellow)Commit:%C(reset) %C(yellow)%H%C(red)%d%n%C(bold)%C(yellow)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)%C(yellow)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
# lg  = log --topo-order --all --graph --pretty=format:'%C(yellow)%h%C(reset) %s %C(red)%d%C(reset)%n'
# lga = log --topo-order --all --graph --pretty=format:'%C(yellow)%h %C(cyan)%cn%C(reset) %s %C(red)%d%C(reset)%n'
# lm  = log --topo-order --pretty=format:'%s'
# lh  = shortlog --summary --numbered
# llf = fsck --lost-found
# lme = log --author='Steve McKinney'
#
# # show
# sh = show HEAD
#
# # remote
# re  = remote
# rel = remote --verbose
# rea = remote add
# rex = remote rm
# rem = remote rename
# rep = remote prune origin
