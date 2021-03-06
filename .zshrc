# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fethbita/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

# User configurations #

## Mode indicator
#function zle-line-init zle-keymap-select {
#    echoti smkx
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    RPS2=$RPS1
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

# Del Key problem
bindkey "^[[3~" delete-char
bindkey -M vicmd "^[[3~" delete-char
# Backspace Key problem
bindkey "^?" backward-delete-char

# Set prompt to something that looks nice
#prompt adam2 8bit
prompt zefram
RPROMPT="%B%D %*"
# https://stackoverflow.com/questions/47061766/zsh-prompt-adam2-script-output-without-newline-is-not-being-displayed
setopt prompt_sp

# Mode change delay time to 0.1
KEYTIMEOUT=1

# Aliases
alias rm='rm -i'
alias ls='ls -hFH --color=auto'
alias grep='grep --color=auto'
alias df='df -h'
alias ping='ping -c 5'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Run ssh-agent and let there be only 1 running ssh-agent process
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
fi

