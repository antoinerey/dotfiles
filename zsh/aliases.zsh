alias n="sudo n"

# unix
alias l="exa -la --no-user"
alias ll="exa -la --no-user"
alias f="fuck"
alias ff="fuck --yes"
alias k="kubectl"
alias c="clear"
alias rm="rm -rf"
alias cat="bat"
alias code="code -r"

# yarn
alias y="yarn"
alias yr="yarn run"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yt="yarn test"

# git
alias gs="git status --short"
alias gaa="git add ."
alias gc="git commit"
alias gco="git checkout"
alias gd="git diff --ignore-space-change"
alias gds="git diff --ignore-space-change --staged"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpl="git pull"
alias gl="git log --format='%Cgreen%h%Creset %s - %Cblue%an%Creset' --no-merges"
alias gb="git branch"

source $(dirname $0)/aliases.bm.zsh
