#!/bin/bash

install_x11_dev_libraries() {
    echo "Installing X11 development libraries..."
    sudo xbps-install -y libxcb-devel pango-devel xcb-util-devel xcb-util-image-devel \
        xcb-util-keysyms-devel xcb-util-wm-devel xcb-util-cursor-devel startup-notification-devel \
        libxdg-basedir-devel gdk-pixbuf-devel dbus-devel libxkbcommon-devel xcb-util-xrm-devel
}

install_ruby_imagemagick() {
    echo "Installing Ruby Asciidoctor and ImageMagick..."
    sudo xbps-install -y ruby-asciidoctor ImageMagick pkg-config
}

install_lua_lgi() {
    echo "Installing Lua 5.3, Lua 5.4 and LGI bindings..."
    sudo xbps-install -y lua53 lua53-lgi lua53-devel lua54-lgi
}

install_cmake() {
    echo "Installing CMake..."
    sudo xbps-install -y cmake
}

install_awesome_wm() {
    echo "Cloning AwesomeWM repository..."
    git clone https://github.com/awesomeWM/awesome.git
    cd awesome || exit
    echo "Building and installing AwesomeWM..."
    make
    sudo make install
    cd ..
}

main() {
    install_x11_dev_libraries
    install_ruby_imagemagick
    install_lua_lgi
    install_cmake
    install_awesome_wm
    echo "All packages and AwesomeWM have been installed successfully!"
}

main
