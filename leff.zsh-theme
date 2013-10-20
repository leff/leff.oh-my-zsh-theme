
# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

# HG (mercurial) info.
local hg_info='$(hg branch 2>/dev/null)'
#local hg_info='$(hg_prompt_info)'
ZSH_THEME_HG_PROMPT_PREFIX="%{$BG[106]$FG[154]%} on %{$BG[130]$FG[166]%} "
ZSH_THEME_HG_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$FG[196]%}x"
ZSH_THEME_HG_PROMPT_CLEAN="%{$FG[112]%}o"


# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $ 
precmd() { print -rP "
%{$reset_color%}%{$fg_no_bold[white]%}\
%{$BG[235]$FG[245]%}%n\
%{$FG[166]%}@\
%{$FG[245]%}$(box_name) \
%{$BG[240]$FG[235]%}⮀\
%{$BG[240]$FG[250]%} env: `basename $VIRTUAL_ENV 2>/dev/null` \
%{$BG[022]$FG[240]%}⮀\
%{$BG[022]$FG[041]%} ${current_dir} \
%{$reset_color%}%{$FG[022]%}⮀\
${git_info}\
%{$FG[220]%}${hg_info}\
%{$reset_color%}\
%{$FG[250]%}[%*]"
}

PROMPT="%{$FG[255]%}$ %{$reset_color%}"