# Setup terminal
export TERM=xterm-256color
export PS1="\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\[\e[m\] \[\e[1;37m\] \n$ "

# Editor
export VISUAL=vim
export EDITOR=vim
set -o vi

# Miniconda 3
export PATH="$HOME/miniconda3/bin:$PATH"

# FZF
# https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Go executables
export PATH="$HOME/go/bin:$PATH"

# User executables
export PATH="$HOME/bin:$PATH"

# For pipsi
export PATH=/home/ekpyro/.local/bin:$PATH

# For pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Start ssh-agent on login
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi