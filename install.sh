#!/bin/bash

packages_url="https://raw.githubusercontent.com/LucasBno/dotfiles/main/packages"
packages=$(curl "${packages_url}")
echo "Installing packages"
sudo xbps-install -S $packages

echo "Finished"
