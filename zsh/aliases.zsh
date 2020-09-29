alias n="sudo n"

# unix
alias ll="ls -lA"
alias f="fuck"
alias ff="fuck --yes"
alias k="kubectl"
alias c="clear"
alias rm="rm -rf"

# yarn
alias y="yarn"
alias yr="yarn run"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yt="yarn test"

# git
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gd="git diff --ignore-space-change"
alias gds="git diff --ignore-space-change --staged"
alias gco="git checkout"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gl="git log --format='%Cgreen%h%Creset %s - %Cblue%an%Creset' --no-merges"
alias gb="git branch"
alias gf="git fetch"
alias grc="git rebase --continue"

if [ -f ./aliases.bm.zsh ]; then
  source ./aliases.bm.zsh
fi
