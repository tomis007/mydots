#!/usr/bin/env bash

echo "install dependencies"
sudo pacman -S tuigreet greetd vim tmux rofi-wayland hyprland hypridle hyprlock alacritty waybar ttf-jetbrains-mono ttf-font-awesome papirus-icon-theme base-devel rust uwsm

echo "setup dotfiles"
cp -r dotfiles/* $HOME

echo "build hyprswitch"
git clone https://aur.archlinux.org/hyprswitch.git && cd hyprswitch
makepkg
echo "install it"


echo "setup greetd"
sudo mkdir -p /etc/greetd/
sudo cp ./etc/greetd/config.toml /etc/greetd/
sudo systemctl enable --now greetd.service
