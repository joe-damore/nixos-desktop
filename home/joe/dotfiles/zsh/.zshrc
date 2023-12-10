# History size and config.
HISTSIZE="10000"
SAVEHIST="10000"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

# Show Git branch in prompt.
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{yellow}↱:%b%f '
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f %1~ ${vcs_info_msg_0_}%# '
