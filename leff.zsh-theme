
# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function virtual_env_info {
    local env=`basename $VIRTUAL_ENV 2>/dev/null`
    if [[ ${env} != '' ]] then
        return "%{$BG[240]$FG[250]%} env: ${env}"
    fi
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[027]%}git:%{$FG[039]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[160]%}dirty "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[046]%}clean "

# HG (mercurial) info.
local hg_info='$(hg_prompt_info)'
ZSH_THEME_HG_PROMPT_PREFIX=" %{$FG[208]%}hg:$FG[220]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY=" %{$FG[160]%}dirty "
ZSH_THEME_HG_PROMPT_CLEAN=" %{$FG[046]%}clean "



# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $ 
precmd() { print -rP "
%{$reset_color%}%{$fg_no_bold[white]%}\
%{$BG[235]$FG[245]%}%n\
%{$FG[166]%}@\
%{$FG[245]%}$(box_name) \
%{$BG[240]$FG[235]%}⮀\
$(virtual_env_info) \
%{$BG[022]$FG[240]%}⮀\
%{$BG[022]$FG[041]%} ${current_dir} \
%{$reset_color%}%{$FG[022]%}⮀\
${git_info}\
%{$FG[220]%}${hg_info}\
%{$reset_color%}\
%{$FG[250]%}[%*]"
}

PROMPT="%{$FG[255]%}$ %{$reset_color%}"