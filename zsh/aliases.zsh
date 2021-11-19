alias c="clear"
alias l="exa -lah"
alias tree="exa -lah --tree --git-ignore --ignore-glob .git"
alias cat="bat"
alias grep="rg"
alias rm="rm -rf"
alias n="sudo n"
alias p="pnpm"
alias y="yarn"
alias yt="yarn test"

# Reuse the same VSCode window, instead of creating new ones.
alias code="code -r"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Git
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

alias g="git"
alias gl="git log --format='%Cgreen%h%Creset %s - %Cblue%an%Creset' --no-merges"
alias gd="git diff --ignore-space-change"
alias gds="git diff --ignore-space-change --staged"
alias gs="git status --short"
alias gaa="git add --all"
alias gco="git checkout"
alias gc="git commit"
alias gpl="git pull"
alias gp="git push"
alias gpf="git push --force-with-lease"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Misc
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

alias rsource="source ~/.zshrc"
