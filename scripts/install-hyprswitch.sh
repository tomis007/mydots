#!/usr/bin/env bash

echo "build hyprswitch"
mkdir -p $HOME/AUR/hyprswitch && pushd $_
git clone https://aur.archlinux.org/hyprswitch.git .
makepkg
sudo pacman -U hyprswitch-3.3.2-1-any.pkg.tar.zst
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
popd