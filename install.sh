#!/bin/bash

# Função para instalar os pacotes
install_packages(){
  packages_url="https://raw.githubusercontent.com/LucasBno/dotfiles/main/packages"
  packages=$(curl "${packages_url}")

  echo "Installing packages"
  sleep 2
  sudo xbps-install -S $packages

  sleep 1
  echo "Finished installing packages"
}

install_awesome() {
  echo "Installing Awesome WM"
  sleep 1

  git clone https://github.com/awesomeWM/awesome.git
  cd awesome

  make
  sudo make install

  cd ..
  rm -rf awesome

  echo "Finished Awesome WM installation"
}

install_packages

sleep 1

read -p "Should install Awesome WM? (y/n)" answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  install_awesome
else
  echo "Awesome WM installation canceled"
fi
