# Setup aliases
. ~/.bash_aliases

# Setup terminal

if command -v termite &> /dev/null
then
    TERMINAL=termite
fi
TERM=xterm-256color
PS1="\[\e[0;32m\]\H\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\[\e[m\] \[\e[1;37m\] \n$ "

# Editor
VISUAL=nvim
EDITOR=nvim
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

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# For ibus
export GTK_IM_MODULE=ibus
export QT4_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1 # fixes emacs gettext issue
ibus-daemon -drx

# SSH Agent
SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# # For pyenv
eval "$(pyenv init -)"
# For auto activation of environements
eval "$(pyenv virtualenv-init -)"
