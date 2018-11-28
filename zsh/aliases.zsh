# unix
alias ll="ls -lA"
alias f="fuck"
alias ff="fuck --yes"
alias k="kubectl"
alias c="clear"

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
alias gl="git log"

# List not released commits yet
function glr () {
  git fetch --tags
  git log --oneline --no-merges $(git describe --abbrev=0 --tags)...origin/master
}

# Create a pull request on Github
function gpr () {
  local assignee="antoinerey"
  local labels="Review%20%F0%9F%94%8D"
  local branch=$(git symbolic-ref --short -q HEAD)
  local repository="BackMarket/front"

  open "https://github.com/$repository/compare/$branch?expand=1&assignee=$assignee&labels=$labels"
}
