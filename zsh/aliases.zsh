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

# Create a pull request on Github
function gpr_old () {
  local assignee="antoinerey"
  local branch=$(git symbolic-ref --short -q HEAD)
  local labels="Waiting for QA"
  local repository=$(git remote get-url origin  | sed 's/^git@github.com:/https:\/\/github.com\//; s/.git$//')

  open "$repository/compare/$branch?expand=1&assignee=$assignee&labels=$labels&body=$branch"
}

function gpr {
  local assignee="antoinerey"
  local branch=$(git symbolic-ref --short -q HEAD)
  local labels="Waiting for QA"

  gh pr create --web --body $branch --label $labels --assignee $assignee
}

function jira () {
  local branch=$(git symbolic-ref --short -q HEAD)

  open "https://backmarket.atlassian.net/browse/$branch"
}
