# Easily reload ZSH configuration.
alias rsource="source ~/.zshrc"

alias c="clear"
alias l="exa -lah"
alias tree="l --tree --git-ignore --ignore-glob .git"

alias p="pnpm"
alias y="yarn"

alias g="git"
alias gl="git log --format='%Cgreen%h%Creset %s - %Cblue%an%Creset' --no-merges"
alias gd="git diff --ignore-space-change"
alias gds="git diff --ignore-space-change --staged"
alias gs="git status"
alias gaa="git add --all"
alias gco="git checkout"
alias gc="git commit"
alias gpl="git pull"
alias gp="git push"
alias gpf="git push --force-with-lease"

# See https://github.com/BurntSushi/ripgrep
alias grep="rg"
