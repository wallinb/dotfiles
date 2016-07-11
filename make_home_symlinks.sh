#!/usr/bin/env bash

ln -s ~/dotfiles/readline/inputrc ~/.inputrc
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

ln -s ~/dotfiles/vim/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# ln -s ~/dotfiles/bash/bashrc_linux ~/.bashrc
ln -s ~/dotfiles/bash/bashrc_mac ~/.bashrc
ln -s ~/dotfiles/bash/bash_aliases ~/.bash_aliases

ln -s ~/dotfiles/flake8 ~/.config/flake8
