hash git >/dev/null || {
  echo "Git not installed. $ brew install git"
  exit 1
}

cd $HOME

if [ ! -f /usr/local/bin/zsh ]; then
  echo "Z Shell required. $ brew install zsh"
  exit 1
fi

if [ ! -d $HOME/.oh-my-zsh ]; then
	git clone git@github.com:tinogomes/oh-my-zsh.git .oh-my-zsh || exit 1
fi

if [ ! -d $HOME/.rcfiles ]; then
	git clone git@github.com:tinogomes/rcfiles.git .rcfiles || exit 1
fi

if [ ! -d $HOME/.rcfiles ]; then
	echo "You don't clone tinogomes's rcfiles repo"
	exit 1
fi

chsh -s /usr/local/bin/zsh

ln -s $HOME/.rcfiles/files/gemrc $HOME/.gemrc
ln -s $HOME/.rcfiles/files/gitattributes-global $HOME/.gitattributes
ln -s $HOME/.rcfiles/files/gitconfig $HOME/.gitconfig
ln -s $HOME/.rcfiles/files/gitignore_global $HOME/.gitignore_global
ln -s $HOME/.rcfiles/files/irbeditorrc $HOME/.irbeditorrc
ln -s $HOME/.rcfiles/files/irbrc $HOME/.irbrc
ln -s $HOME/.rcfiles/files/pryrc $HOME/.pryrc
ln -s $HOME/.rcfiles/files/rdebugrc $HOME/.rdebugrc
ln -s $HOME/.rcfiles/files/vimrc $HOME/.vimrc
ln -s $HOME/.rcfiles/files/zshrc_shared $HOME/.zshrc_shared
ln -s $HOME/.rcfiles/files/tm_properties $HOME/.tm_properties

if [ -f $HOME/.zshrc ]; then
	echo "Backing up your $HOME/.zshrc file into $HOME/.zshrc_original"
	mv $HOME/.zshrc $HOME/.zshrc_original
fi

case $1 in
	ubuntu|linux) ln -s $HOME/.rcfiles/files/zshrc_ubuntu $HOME/.zshrc;;
	*) 
		ln -s $HOME/.rcfiles/files/zshrc_osx $HOME/.zshrc
		
		ln -s $HOME/.rcfiles/files/slate $HOME/.slate
		echo "Installing https://github.com/jigish/slate"
		echo "------------------------------------------"
		echo "Note: You must turn on the Accessibility API by checking"
		echo "System Preferences > Universal Access > Enable access for assistive devices"
		
		cd /Applications && curl http://www.ninjamonkeysoftware.com/slate/versions/slate-latest.tar.gz | tar -xz && open Slate.app
		;;
esac

echo "Write on $HOME/.zshrc_local file your local settings"
echo "# Write here your local settings" >> $HOME/.zshrc_local
