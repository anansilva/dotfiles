# Alias
alias gpr="git pull --rebase"
alias nb="git checkout -b"
alias m="git checkout master"
alias gd="git diff"
alias gs="git status"
alias gp="git push"
alias gcm="git commit -m"
alias gad="git add --all ."
alias gfa="git fetch --all"
alias gmm="git merge origin master"

# Functions
cb() { git branch | grep "*" | awk '{ print $2 }' | pbcopy }
gpo() { git push origin $(git branch | grep "*" | awk '{ print $2 }') }
