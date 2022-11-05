# Setup aliases
. ~/.bash_aliases

# Setup terminal
TERM=xterm-24bit
PS1="\[\e[0;32m\]\H\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\[\e[m\] \[\e[1;37m\] \n$ "

# Editor
VISUAL=vim
EDITOR=vim
set -o vi

# avoid duplicates in history
HISTCONTROL=ignoredups:erasedups
# append history entries
shopt -s histappend

# FZF
# https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Node Version Manager
NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# User executables
PATH="$HOME/bin:$PATH"

# Set default browser
BROWSER=/usr/bin/firefox

PATH="${HOME}/.emacs.d/bin:$PATH"

# For ibus
export GTK_IM_MODULE=ibus
export QT4_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1 # fixes emacs gettext issue
ibus-daemon -drx

# Setup/connect to single ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent)"
fi

# # For pyenv
eval "$(pyenv init -)"
# For auto activation of environements
eval "$(pyenv virtualenv-init -)"

# NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Automatically added by the Guix install script.
if [ -n "$GUIX_ENVIRONMENT" ]; then
    if [[ $PS1 =~ (.*)"\\$" ]]; then
        PS1="${BASH_REMATCH[1]} [env]\\\$ "
    fi
fi

