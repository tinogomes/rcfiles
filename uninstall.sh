#!/usr/bin/env bash

cd $HOME

rm -rf $HOME/.oh-my-zsh
rm -rf $HOME/.rcfiles
rm $HOME/bin
rm $HOME/.gemrc
rm $HOME/.gitattributes
rm $HOME/.gitconfig
rm $HOME/.gitignore_global
rm $HOME/.irbeditorrc
rm $HOME/.irbrc
rm $HOME/.pryrc
rm $HOME/.railsrc
rm $HOME/.rdebugrc
rm $HOME/.tm_properties
rm $HOME/.vimrc
rm $HOME/.zshrc
rm $HOME/.starship

mv .zshrc_original .zshrc
