#!/bin/bash

# Verificar se o script está sendo executado diretamente
if [ "$$" -ne 1 ]; then
  echo "O script não está sendo executado diretamente. Ignorando a execução da função."
  exit 0
fi

# Função para instalar os pacotes
install_packages() {
  # Seu código para instalar pacotes
  echo "Instalando pacotes..."
}

# Função para instalar o Awesome Window Manager
install_awesome() {
  # Seu código para instalar o Awesome Window Manager
  echo "Instalando Awesome Window Manager..."
}

# Resto do seu script...

install_packages

sleep 2

read -p "Deseja instalar o Awesome Window Manager? (s/n): " answer
if [ "$answer" != "${answer#[Yy]}" ]; then
  install_awesome
else
  echo "Instalação do Awesome Window Manager cancelada."
fi
