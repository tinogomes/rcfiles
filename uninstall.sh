#!/usr/bin/env bash

cd $HOME

rm -rf $HOME/.oh-my-zsh
rm -rf $HOME/.rcfiles

[[ -L $HOME/.gemrc ]]             && rm $HOME/.gemrc
[[ -L $HOME/.gitattributes ]]     && rm $HOME/.gitattributes
[[ -L $HOME/.gitconfig ]]         && rm $HOME/.gitconfig
[[ -L $HOME/.gitignore_global ]]  && rm $HOME/.gitignore_global
[[ -L $HOME/.irbeditorrc ]]       && rm $HOME/.irbeditorrc
[[ -L $HOME/.irbrc ]]             && rm $HOME/.irbrc
[[ -L $HOME/.pryrc ]]             && rm $HOME/.pryrc
[[ -L $HOME/.railsrc ]]           && rm $HOME/.railsrc
[[ -L $HOME/.rdebugrc ]]          && rm $HOME/.rdebugrc
[[ -L $HOME/.starship ]]          && rm $HOME/.starship
[[ -L $HOME/.tm_properties ]]     && rm $HOME/.tm_properties
[[ -L $HOME/.tmux ]]              && rm $HOME/.tmux.conf
[[ -L $HOME/.vimrc ]]             && rm $HOME/.vimrc
[[ -L $HOME/.zshrc ]]             && rm $HOME/.zshrc
[[ -L $HOME/bin ]]                && rm $HOME/bin

mv .zshrc_original .zshrc
