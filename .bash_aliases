shopt -s expand_aliases

if [ "$(uname)" = "Linux" ]; then
    alias ls="ls --color=auto -Flash"
elif [ "$(uname)" = "Darwin" ]; then
    alias ls="ls -GFlash"
fi
alias ll="ls -l"
alias lla="ls -la"

alias df="df -ha"

alias vn="vagrant nsidc"

alias h="history"

alias more='less -R'

alias dockrm='docker rm -v $(docker ps -aq -f status=exited)'

alias tmux='tmux -2'

# Clean up merged branches
alias gbc='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# List executables in current bash environment
alias lsbin='echo $PATH | xargs -d: -i find {} -executable -type f'

# Manage homedir config files
alias dotfiles="/usr/bin/git --git-dir=$HOME/Sync/dotfiles.git/ --work-tree=$HOME"

# Fix for using xterm-24bit locally when not available remotely
alias ssh="TERM=xterm-256color ssh"
