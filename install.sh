hash git >/dev/null || {
  echo "git not installed"
  exit
}

cd $HOME

if [ -d $HOME/.oh-my-zsh ]; then
	git clone git://github.com/tinogomes/oh-my-zsh.git .oh-my-zsh
fi

if [ -d $HOME/rcfiles ]; then
	git clone git@github.com:tinogomes/rcfiles.git
fi

ln -s $HOME/.rcfiles/gemrc $HOME/.gemrc
ln -s $HOME/.rcfiles/gitattributes-global $HOME/.gitattributes
ln -s $HOME/.rcfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/.rcfiles/gitignore_global $HOME/.gitignore_global
ln -s $HOME/.rcfiles/irbeditorrc $HOME/.irbeditorrc
ln -s $HOME/.rcfiles/irbrc $HOME/.irbrc
ln -s $HOME/.rcfiles/pryrc $HOME/.pryrc
ln -s $HOME/.rcfiles/rdebugrc $HOME/.rdebugrc
ln -s $HOME/.rcfiles/vimrc $HOME/.vimrc
ln -s $HOME/.rcfiles/slate $HOME/.slate

echo "Write on $HOME/.zshrc_local file your local settings"
echo "Write here your local settings" >> $HOME/.zshrc_local

if [ -f $HOME/.zshrc ]; then
	mv $HOME/.zshrc $HOME/.zshrc_original
fi

case $1 in
	ubuntu|linux) ln -s $HOME/.rcfiles/zshrc_ubuntu $HOME/.zshrc;;
	*) ln -s $HOME/.rcfiles/zshrc_osx $HOME/.zshrc;;
esac
