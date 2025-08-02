#!/usr/bin/env bash

echo "install dependencies"
sudo pacman -S greetd greetd-tuigreet vim tmux rofi-wayland hyprland hypridle hyprpaper hyprlock ghostty waybar ttf-jetbrains-mono ttf-font-awesome papirus-icon-theme base-devel rust uwsm gtk4-layer-shell ttf-firacode-nerd nautilus gammastep qt6-wayland qt5-wayland cargo hyprpolkitagent gtk4 base-devel git dunst libnotify ttf-hack fzf zsh otf-fira-mono otf-fira-sans otf-font-awesome

echo "setup dotfiles"
cp -r ./dotfiles/.* $HOME

echo "build hyprswitch"
mkdir -p $HOME/AUR/hyprswitch && pushd $_
git clone https://aur.archlinux.org/hyprswitch.git .
makepkg
sudo pacman -U hyprswitch-3.3.2-1-any.pkg.tar.zst
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
popd

echo "setup greetd"
sudo mkdir -p /etc/greetd/
sudo cp ./etc/greetd/config.toml /etc/greetd/
sudo systemctl enable --now greetd.service

# start polkit
systemctl --user enable --now hyprpolkitagent.service
