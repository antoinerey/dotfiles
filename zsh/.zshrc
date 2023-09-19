# Path to your oh-my-zsh installation.
export ZSH=/Users/$(whoami)/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="custom"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# We do not want ZSH to automatically compute the terminal title.
DISABLE_AUTO_TITLE="true"

# Display the current directory in the terminal tab title.
# Before: `-zsh` / After: `directory (-zsh)`.
function precmd () {
  echo -ne "\033]0;${PWD##*/}\007"
}

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=~/.dotfiles/zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# Initialise Startship prompt
# See: https://starship.rs
eval "$(starship init zsh)"

# Initialise Zoxide (z)
# See https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# Updates PATH for the Google Cloud SDK.
if [ -f '/Users/antoine/google-cloud-sdk/path.zsh.inc' ]; then
  source '/Users/antoine/google-cloud-sdk/path.zsh.inc';
fi

# Enables shell command completion for gcloud.
if [ -f '/Users/antoine/google-cloud-sdk/completion.zsh.inc' ]; then
  source '/Users/antoine/google-cloud-sdk/completion.zsh.inc';
fi

# Enables shell command completion using fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PNPM_HOME="/Users/antoine/Library/pnpm"
export PATH="/Users/antoine/.deno/bin:$PATH"
export PATH="$PNPM_HOME:$PATH"
# export PATH="./node_modules/.bin:$PATH"
export PATH="/Users/antoine/.local/share/ken/bin:$PATH"

# bun completions
[ -s "/Users/antoine/.bun/_bun" ] && source "/Users/antoine/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/antoine/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/antoine/Desktop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/antoine/Desktop/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/antoine/Desktop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/antoine/Desktop/google-cloud-sdk/completion.zsh.inc'; fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/antoine/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Launch tmux as soon as the terminal opens.
# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
