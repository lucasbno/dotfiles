#!/bin/bash


install_packages(){
  packages_url="https://raw.githubusercontent.com/LucasBno/dotfiles/main/packages"
  packages=$(curl "${packages_url}")

  echo "Installing packages"
  sleep 2
  sudo xbps-install -S $packages

  sleep 1
  echo "Finished downloading packages"
}


install_awesome() {
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

install_packages

read -p "Should install Awesomewm? (y/n)" answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  install_awesome
else
  echo "Awesomewm installation canceled"
fi
