RED="\033[0;31m"
GREEN="\033[0;32m"

local host_name="¯\_(ツ%)_/¯
"
local path_string="%{$fg[cyan]%}%~%{$reset_color%}"
local prompt_string="$"
local return_status="%(?:%{$fg_bold[green]%}$prompt_string:%{$fg[red]%}$prompt_string)"

PROMPT='${host_name} ${return_status} %{$reset_color%}'
RPROMPT='$(parse_git_dirty) $(git_custom_prompt) @ %U$path_string%u'
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ᕕ(ಠ_ಠ)ᕗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ᕕ(ಠ‿<)ᕗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

git_custom_prompt() {
  local branch=$(current_branch)
  if [ -n "$branch" ]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$branch$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}
