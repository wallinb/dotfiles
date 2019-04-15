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

# Tell ipython to use VI bindings
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'

# List executables in current bash environment
alias lsbin='echo $PATH | xargs -d: -i find {} -executable -type f'

# Manage homedir config files
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree $HOME'
alias configstat='config status -uno'
alias pc200w='wine .wine/drive_c/Program\ Files\ \(x86\)/Campbellsci/PC200W/PC200W.exe'
