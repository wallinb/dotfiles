# Setup aliases
. ~/.bash_aliases

# Setup terminal
TERMINAL=termite
TERM=xterm-256color
PS1="\[\e[0;32m\]\H\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\[\e[m\] \[\e[1;37m\] \n$ "

# Editor
VISUAL=vim
EDITOR=vim
set -o vi


# avoid duplicates in history
HISTCONTROL=ignoredups:erasedups
# append history entries
shopt -s histappend
# After each command, save and reload history
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Miniconda 3
PATH="$HOME/miniconda3/bin:$PATH"

# FZF
# https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Node Version Manager
NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Go executables
PATH="$HOME/go/bin:$PATH"

# User executables
PATH="$HOME/bin:$PATH"

# For pipsi
PATH=/home/ekpyro/.local/bin:$PATH

# # For pyenv
PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# For rbenv
# PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# Set default browser
BROWSER=/usr/bin/firefox-developer-edition

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

# Completion
source ~/bin/tmuxinator.bash
source  ~/bin/tmux-completion/tmux
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

setup_input.sh

# Setup/connect to single ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/wallinb/.pyenv/versions/miniconda3-latest/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/wallinb/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh" ]; then
        . "/home/wallinb/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh"
    else
        export PATH="/home/wallinb/.pyenv/versions/miniconda3-latest/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

