# All my aliases are configured here because .zshenv is loaded on all shell
# (interactive and non-interactive ones), which means that thanks to aliases
# being here, they are available on Vim shell commands.

alias ...="../.."

alias cd="z"
alias c="clear"
alias l="exa -lah"
alias ll="exa -lah"
alias tree="exa -lah --tree --git-ignore --ignore-glob .git"
alias cat="bat"
alias grep="rg"
alias mkdir="mkdir -p"
alias rm="rm -rf"
alias k="kubectl"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias nt="nr test"

# Reuse the same VSCode window, instead of creating new ones.
alias code="code -r"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Git
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Get the default branch name.
# From https://joshtronic.com/2020/08/09/how-to-get-the-default-git-branch
#
# Sometimes, no branch are set as "default". In such cases, you can use the
# following command line from any branch to make the main branch the default.
#
# ```
# git checkout main
# git remote set-head origin --auto
# ```
function git_default_branch() {
  (git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@') 2>/dev/null
}

# Those are functions because we want to execute git_default_branch when they
# are called (vs. execute when the terminal loads as it is for aliases).
function gcom() { git checkout $(git_default_branch) }
function gplm() { git pull origin $(git_default_branch) }

function gb() {
    git branch --sort=-committerdate | fzf \
        --bind 'enter:execute(git switch {1})' \
        --bind 'enter:+abort' \
        --bind 'ctrl-d:execute-silent(git branch -D {1})' \
        --bind 'ctrl-d:+reload-sync(git branch --sort=-committerdate)' \
        --header 'Enter to Switch branch, CTRL+D to [D]elete branch' \
        --preview 'git diff --color {1} | diff-so-fancy'
}

alias g="git"
alias gl="git log --format='%Cgreen%h%Creset %s - %Cblue%an%Creset' --no-merges"
alias gd="git diff --ignore-space-change"
alias gds="git diff --ignore-space-change --staged"
alias gs="git status --short"
alias gaa="git add --all"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gc="git commit"
alias gpl="git pull"
alias gp="git push"
alias gpf="git push --force-with-lease"
# alias gb="git branch --sort=-committerdate | fzf --bind 'ctrl-d:execute-silent(git branch -D {1})+reload-sync(git branch --sort=-committerdate)' --header 'CTRL+D to [D]elete branch' --preview 'git diff --color {1} | diff-so-fancy' | xargs git switch"
alias grh="git reset --hard"
alias grc="git rebase --continue"

alias ghb="gh browse"
alias ghpr="gh pr view --web"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Yarn
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

alias y="yarn"
alias yt="yarn test"
alias yu="yarn upgrade-interactive"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# pnpm
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

alias p="pnpm"
alias pt="pnpm test"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Dotfiles
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

alias dot="cd ~/Code/dotfiles"
alias dotu="code ~/Code/dotfiles"
alias dotc="cd ~/Code/dotfiles && gaa && gc -m 'Update' && gp && cd -"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Misc
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

alias rsource="source ~/.zshrc"



