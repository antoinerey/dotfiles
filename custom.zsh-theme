local ret_status="%(?:%{$fg_bold[yellow]%}✝:%{$fg_bold[red]%}✝)"

PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} %{$fg_bold[cyan]%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="/ "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}- "
ZSH_THEME_GIT_PROMPT_CLEAN=" "
