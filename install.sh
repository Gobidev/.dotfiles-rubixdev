#!/bin/bash

install_file () {
    mkdir -p "$HOME/$(dirname "$1")"
    [[ ! -f ~/"$1" ]] || mv ~/"$1" ~/"$1".old
    [[ ! -L ~/"$1" ]] || rm ~/"$1"
    ln -s "$PWD/$1" "$HOME/$1"
}

# Install powerlevel10k theme, if not yet present
[[ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]] || {
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k
}

# Uninstall SpaceVim if present
[ -e ~/.SpaceVim ] && curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall

install_file .zshrc
install_file .p10k.zsh
install_file .config/.aliasrc.zsh
install_file .tmux.conf
install_file .config/terminator/config
install_file .config/alacritty/alacritty.yml
install_file .config/i3/config
install_file .config/nvim/init.vim
