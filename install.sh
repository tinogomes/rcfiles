function is_osx () {
  [[ "$(uname)" == "Darwin" ]]
}

if git >/dev/null || [ ! -f /usr/local/bin/zsh ]; then
  echo 'Verify if you have installed Git and Z Shell yet.'

  if is_osx; then
    echo "$ brew install git zsh git-lfs"
    echo "$ brews cask install slate"
  else
    echo "$ sudo apt-get update"
    echo "$ sudo apt-get install git-core zsh"
    echo "# Instructions to install GIT LFS: https://github.com/git-lfs/git-lfs/wiki/Installation#ubuntu"
  fi

  exit 1
fi

cd $HOME

if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "Getting OM MY ZSH from tinogomes' fork repository"
  git clone https://github.com/tinogomes/ohmyzsh.git .oh-my-zsh || exit 1
  echo "Getting My OH-MY-ZSH custom plugin and theme"
  git clone https://github.com/tinogomes/oh-my-zsh-custom.git .oh-my-zsh/custom || exit 1
  echo "Getting zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting || exit 1
fi

if [ ! -d $HOME/.rcfiles ]; then
  echo "Getting RCFiles"
  git clone https://github.com/tinogomes/rcfiles.git .rcfiles || exit 1
fi

if [ ! -d $HOME/.rcfiles ]; then
  echo "You don't clone tinogomes's rcfiles repo"
  exit 1
fi

if [ -f $HOME/.zshrc ]; then
  echo "Backing up your $HOME/.zshrc file into $HOME/.zshrc_original"
  mv $HOME/.zshrc $HOME/.zshrc_original
fi

ln -s $HOME/.rcfiles/files/bin $HOME/bin

ln -s $HOME/.rcfiles/files/gemrc $HOME/.gemrc
ln -s $HOME/.rcfiles/files/gitattributes-global $HOME/.gitattributes
ln -s $HOME/.rcfiles/files/gitconfig $HOME/.gitconfig
ln -s $HOME/.rcfiles/files/gitignore_global $HOME/.gitignore_global
ln -s $HOME/.rcfiles/files/irbeditorrc $HOME/.irbeditorrc
ln -s $HOME/.rcfiles/files/irbrc $HOME/.irbrc
ln -s $HOME/.rcfiles/files/pryrc $HOME/.pryrc
ln -s $HOME/.rcfiles/files/railsrc $HOME/.railsrc
ln -s $HOME/.rcfiles/files/rdebugrc $HOME/.rdebugrc
ln -s $HOME/.rcfiles/files/tm_properties $HOME/.tm_properties
ln -s $HOME/.rcfiles/files/vimrc $HOME/.vimrc
ln -s $HOME/.rcfiles/files/zshrc $HOME/.zshrc

echo "Changing default shell for Z Shell"
chsh -s /usr/local/bin/zsh

if [ is_osx ]
  then
  ln -s $HOME/.rcfiles/files/slate $HOME/.slate

  open /Applcations/Slate.app
fi

echo "Write on $HOME/.zshrc_local file your local settings"
echo "# Write here your local settings" >> $HOME/.zshrc_local
