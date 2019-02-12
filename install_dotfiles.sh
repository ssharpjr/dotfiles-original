#!/usr/bin/env bash

# Copy dotfiles
dstdir="~"

cp -v .bashrc $dstdir
cp -v .tmux.conf $dstdir
cp -v .vimrc $dstdir
cp -v .bash_profile $dstdir
cp -v .profile $dstdir
cp -v .xinitrc $dstdir
cp -v .Xresources $dstdir
