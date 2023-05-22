#!/bin/bash

install_packages(){
  packages_url="https://raw.githubusercontent.com/LucasBno/dotfiles/main/packages"
  packages=$(curl "${packages_url}")

  echo "Installing packages"
  sleep 1
  xi $packages

  sleep 1
  echo "Finished downloading packages"
}

install_zsh_plugins() {
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

 git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

 git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

 git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

}

install_awesome() {
  read -p "Should install Awesomewm? (y/n)" opt 
  case $opt in
    n*|N*) echo "Awesome installation skipped"; return ;;
  esac

  echo "Installing awesomewm"
  sleep 1

  git clone https://github.com/awesomeWM/awesome.git
  cd awesome

  make
  sudo make install

  cd ..
  rm -rf awesome

  echo "Finished awesomewm installation"

}

install_void_packages_repo() {
  echo "Installing void packages"
  sleep 1

  sudo xbps-install xtools

  sleep 1

  git clone https://github.com/void-linux/void-packages.git
  cd void-packages
  ./xbps-src binary-bootstrap

  xi
}

main () {
  #install_void_packages_repo
  
  # install_packages

  # install_awesome

  install_zsh_plugins

}

main
