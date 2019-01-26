#!/usr/bin/env bash

# Copy dotfiles

cp -v bashrc ~/.bashrc
cp -v tmux.conf ~/.tmux.conf
cp -v vimrc ~/.vimrc

cp -v archlinux/bash_profile ~/.bash_profile
cp -v archlinux/profile ~/.profile
cp -v archlinux/xinitrc ~/.xinitrc
cp -v archlinux/Xresources ~/.Xresources
