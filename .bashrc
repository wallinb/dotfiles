# Setup aliases
. ~/.bash_aliases

# Setup terminal
TERMINAL=termite
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
# After each command, save and reload history
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

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

# # For pyenv
PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

# For rbenv
# PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
PATH="${HOME}/.emacs.d/bin:$PATH"

# For emacs/doom

# Set default browser
BROWSER=/usr/bin/firefox

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

# Completion
source ~/bin/tmuxinator.bash

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Setup/connect to single ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# For ibus
export GTK_IM_MODULE=ibus
export QT4_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1 # fixes emacs gettext issue
ibus-daemon -drx
