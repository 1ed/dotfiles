#!/bin/sh
set -x

if [ -z "$DOTFILES_DIR" ]; then
    DOTFILES_DIR="$PWD"
fi

link() {
  rm -rf $HOME/$2
  ln -nfs $DOTFILES_DIR/$1 $HOME/$2
}

# install prezto & zsh config
link zsh/zprezto .zprezto
link zsh/zlogin .zlogin
link zsh/zlogout .zlogout
link zsh/zpreztorc .zpreztorc
link zsh/zprofile .zprofile
link zsh/zshenv .zshenv
link zsh/zshrc .zshrc

# install rc files
link rc/gemrc .gemrc
link rc/phpenvrc .phpenvrc
link rc/rbenvrc .rbenvrc

# install vim config
link vim .vim
link vim/vimrc .vimrc
link vim/gvimrc .gvimrc
bundle exec vim-update-bundles -n

