#!/usr/bin/env bash

echo "install dependencies"
sudo pacman -S greetd greetd-tuigreet vim tmux rofi-wayland hyprland hypridle hyprpaper hyprlock ghostty waybar ttf-jetbrains-mono ttf-font-awesome papirus-icon-theme base-devel rust uwsm gtk4-layer-shell ttf-firacode-nerd nautilus gammastep qt6-wayland qt5-wayland cargo hyprpolkitagent gtk4 base-devel git dunst libnotify ttf-hack fzf zsh otf-fira-mono otf-fira-sans otf-font-awesome nvidia ttf-jetbrains-mono-nerd

echo "setup dotfiles"
cp -r ./dotfiles/.config $HOME
cp ./dotfiles/{.bashrc,.vimrc,.zshrc,.tmux.conf} $HOME

echo "setup greetd"
sudo mkdir -p /etc/greetd/
sudo cp ./etc/greetd/config.toml /etc/greetd/
sudo systemctl enable --now greetd.service

# start polkit
systemctl --user enable --now hyprpolkitagent.service
