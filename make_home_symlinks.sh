ln -s ~/dotfiles/readline/inputrc ~/.inputrc

ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
if [ "${uname}" == "Darwin" ]; then
    ln -s ~/dotfiles/tmux/.tmux-osx.conf ~/.tmux-osx.conf
fi

ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

ln -s ~/dotfiles/bash/bashrc_linux ~/.bashrc
ln -s ~/dotfiles/bash/bash_profile ~/.bash_profile
ln -s ~/dotfiles/bash/bash_aliases ~/.bash_aliases

ln -s ~/dotfiles/flake8rc ~/.config/flake8rc

ln -s ~/dotfiles/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py

if [ "${uname}" == "Linux" ]; then
    sudo ln -s ~/dotfiles/profile.d/keyboard.sh /etc/profile.d/keyboard.sh
fi
