RED="\033[0;31m"
GREEN="\033[0;32m"

local host_name="
¯\_(ツ%)_/¯
"
local path_string="%{$fg[cyan]%}%~%{$reset_color%}"
local prompt_string="$"
local return_status="%(?:%{$fg_bold[green]%}$prompt_string:%{$fg[red]%}$prompt_string)"

PROMPT='${host_name} ${return_status} %{$reset_color%} $(git_remote_status)'
RPROMPT='%U$path_string%u $(git_custom_prompt) '
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[green]%} ᕕ(ಠ_ಠ) ᕗ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ミ ᕕ(ᐛ) ᕗ "
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

git_custom_prompt() {
  local branch=$(current_branch)
  if [ -n "$branch" ]; then
    echo "@ $ZSH_THEME_GIT_PROMPT_PREFIX$branch $(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}
