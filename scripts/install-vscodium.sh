mkdir -p $HOME/AUR/vscodium && pushd $_
git clone https://aur.archlinux.org/vscodium-bin.git .
sed 's/^[^#]*vscodium-bin-wayland.desktop".*/#&/' -i PKGBUILD
makepkg
sudo pacman -U vscodium-bin-1*.pkg.tar.zst
popd
