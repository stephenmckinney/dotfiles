# Still trying new utilities Aug 31, 2018
abbr cat "bat --theme=Dracula"
abbr help "tldr"
abbr ping "prettyping --nolegend"

# Neovim
abbr v "nvim"

# Bundler
abbr b "bundle"
abbr be "bundle exec"
abbr bi "bundle install && bundle exec yard gems"
abbr bu "bundle update && bundle exec yard gems"

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
abbr gbpurgedryrun 'git branch --merged | grep -v "\*" | grep -v "master"'
abbr gbpurge 'git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d'


# #stash
abbr gsl  "git stash list"
abbr gss  "git stash show"
abbr gssp "git stash show -p"
abbr gsp  "git stash pop"
abbr gsd  "git stash drop"
abbr gsc  "git stash clear"

# diff
abbr gd  "git diff"           # Diff working dir to index
abbr gdw "git diff  -w"       # Diff ignore whitespace
abbr gds "git diff  --staged" # Diff index to HEAD
abbr gdh "git diff  HEAD"     # Diff working dir and index to HEAD

# index
abbr gs  "git status"
abbr ga  "git add"
abbr gia "git add"
abbr gir "git reset"
abbr gunstage "git reset HEAD "

# log
abbr gl   "git log --topo-order --pretty=format:'%C(yellow)%h %C(cyan)%cn %C(blue)%cr%C(reset) %s'"
abbr gls  "git log --topo-order --stat --pretty=format:'%C(bold)%C(yellow)Commit:%C(reset) %C(yellow)%H%C(red)%d%n%C(bold)%C(yellow)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)%C(yellow)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'"
abbr gld  "git log --topo-order --stat --patch --full-diff --pretty=format:'%C(bold)%C(yellow)Commit:%C(reset) %C(yellow)%H%C(red)%d%n%C(bold)%C(yellow)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)%C(yellow)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'"
abbr glg  "git log --topo-order --all --graph --pretty=format:'%C(yellow)%h%C(reset) %s %C(red)%d%C(reset)%n'"
abbr glga "git log --topo-order --all --graph --pretty=format:'%C(yellow)%h %C(cyan)%cn%C(reset) %s %C(red)%d%C(reset)%n'"
abbr glm  "git log --topo-order --pretty=format:'%s'"
abbr glh  "git shortlog --summary --numbered"
abbr gllf "git fsck --lost-found"
abbr glme "git log --author='Steve McKinney'"

# show
abbr gsh "git show HEAD"

# remote
abbr gre  "git remote"
abbr grel "git remote --verbose"
abbr grea "git remote add"
abbr grex "git remote rm"
abbr grem "git remote rename"
abbr grep "git remote prune origin"

# grepping stuff
# alias aliasgrep='alias | grep $(echo $1)'
# alias psgrep='ps -e -o pid,command | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'

# Heroku
abbr h "heroku"

# Edit dotfiles
abbr edots "v ~/.dotfiles"
abbr efish "v ~/.dotfiles/config/fish"
abbr evim  "v ~/.dotfiles/config/nvim"
