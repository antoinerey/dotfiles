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
alias gl="git log --format='%Cgreen%H%Creset %s - %Cblue%an%Creset'"
alias gb="git branch"
alias gf="git fetch"
alias grc="git rebase --continue"

# List not released commits yet
function glr () {
  git fetch --tags
  git log --format="%Cgreen%h%Creset %s - %Cblue%an%Creset" --no-merges $(git describe --abbrev=0 --tags)...origin/master
}

# Create a pull request on Github
function gpr () {
  local assignee="antoinerey"
  local labels="Need%20Review%20%F0%9F%94%8E"
  local branch=$(git symbolic-ref --short -q HEAD)
  local repository=$(git remote get-url origin  | sed 's/^git@github.com:/https:\/\/github.com\//; s/.git$//')

  open "$repository/compare/$branch?expand=1&assignee=$assignee&labels=$labels&body=$branch"
}
