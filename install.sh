#!/bin/sh
set -x

if [ -z "$DOTFILES_DIR" ]; then
    DOTFILES_DIR="$PWD"
fi

link() {
  rm -rf $2
  ln -nfs $1 $2
}

# install prezto & zsh config
link $DOTFILES_DIR/zsh/zprezto $HOME/.zprezto
link $DOTFILES_DIR/zsh/zlogin $HOME/.zlogin
link $DOTFILES_DIR/zsh/zlogout $HOME/.zlogout
link $DOTFILES_DIR/zsh/zpreztorc $HOME/.zpreztorc
link $DOTFILES_DIR/zsh/zprofile $HOME/.zprofile
link $DOTFILES_DIR/zsh/zshenv $HOME/.zshenv
link $DOTFILES_DIR/zsh/zshrc $HOME/.zshrc

# install vim config
link $DOTFILES_DIR/vim $HOME/.vim
link $DOTFILES_DIR/vim/vimrc $HOME/.vimrc
link $DOTFILES_DIR/vim/gvimrc $HOME/.gvimrc
bundle exec vim-update-bundles -n

