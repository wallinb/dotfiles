ln -s ~/dotfiles/readline/inputrc ~/.inputrc
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

ln -s ~/dotfiles/bash/bashrc_linux ~/.bashrc
ln -s ~/dotfiles/bash/bash_profile ~/.bash_profile
# ln -s ~/configs/tmux/bashrc_mac ~/.bashrc
ln -s ~/dotfiles/bash/bash_aliases ~/.bash_aliases

ln -s ~/dotfiles/flake8rc ~/flake8rc

if [ "${uname}" == "Linux" ]; then
    sudo ln -s ~/dotfiles/profile.d/keyboard.sh /etc/profile.d/keyboard.sh
fi
