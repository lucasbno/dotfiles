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

install_awesome() {
  read -p "Should install Awesomewm? (y/n)" answer
  if [ "$answer" == "${answer#[Yy]}" ]; then
    return
  fi

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

  git clone https://github.com/void-linux/void-packages.git
  cd void-packages
  ./xbps-src binary-bootstrap
}

main () {
  install_void-packages_repo
  
  install_packages

  install_awesome

}

main
