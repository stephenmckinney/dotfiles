# Still trying new utilities Aug 31, 2018
abbr cat "bat --theme=Dracula"
abbr help "tldr"
abbr ping "prettyping --nolegend"

# Tmux
abbr mux "tmuxifier load-session"

# Neovim
abbr v "nvim"

# Git
abbr g "git"

# checkout/fetch/merge/push/rebase
# checkout
abbr gco   "git checkout"
abbr gcob  "git checkout -b"
abbr gco0  "git checkout HEAD -- "
abbr gcom  "git checkout main"
# fetch
abbr gf    "git fetch"
abbr gfm   "git pull"
abbr gfo   "git fetch origin"
abbr gfu   "git fetch upstream"
# merge
abbr gm    "git merge"
abbr gmom  "git merge origin/main"
# push
abbr gp    "git push"
abbr gpa   "git push --all"
abbr gpt   "git push --tags"
# rebase
abbr gr    "git rebase"
abbr gra   "git rebase --abort"
abbr grc   "git rebase --continue"
abbr gri   "git rebase --interactive"
abbr grs   "git rebase --skip"
abbr grom  "git rebase origin/main"
abbr griom "git rebase --interactive origin/main"

# branch
abbr gb  "git branch"
abbr gba "git branch --all --verbose"
abbr gbd "git branch --delete"
abbr gbm "git branch --move"
abbr gbs "git show-branch"

# commit
abbr gc      "git commit --verbose"
abbr gcm     "git commit --message --verbose"
abbr gca     "git commit --all --verbose"
abbr gcam    "git commit --all --message --verbose"
abbr gcamend "git commit --amend"
abbr gcp     "git cherry-pick --edit -sx"
# verbose alternatives
abbr gundo-last-commit  "git reset --soft 'HEAD^'"
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




# # meta alias
# alias aliasgrep='alias | grep $(echo $1)'
#
# # ps | grep
# alias psgrep='ps -e -o pid,command | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'
#
#
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
#
# # Edit dotfiles
# alias edots='vim ~/.dotfiles'
# alias eprezto='vim ~/.zprezto'
#
#
