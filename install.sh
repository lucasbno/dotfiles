#!/bin/bash

packages_url="https://raw.githubusercontent.com/LucasBno/dotfiles/main/packages"

packages=$(curl "${packages_url}")

sudo xbps-install -S $packages
