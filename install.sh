#!/bin/sh

VUNDLE_PATH="$HOME/.vim/bundle/Vundle.vim"

cd $(dirname $0)
rm -f ~/.vimrc ~/.tmux.conf
ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.tmux.conf ~/.tmux.conf
cd "$VUNDLE_PATH" && git pull ||
    (rm -rf "$VUNDLE_PATH" && git clone https://github.com/VundleVim/Vundle.vim "$VUNDLE_PATH")
vim -c PluginInstall -c 'silent VimProcInstall' -c qa
