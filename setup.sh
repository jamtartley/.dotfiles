#!/usr/bin/env sh

set -e

read -r -p "git author: " git_author
read -p "git email: " git_email
git config --global user.name "$git_author"
git config --global user.email "$git_email"
git config --global credential.helper 'cache --timeout=999999'

sudo groupadd -f pulse
sudo groupadd -f pulse-access
sudo usermod -aG pulse,pulse-access sam
sudo pacman -S --noconfirm --needed python python2 python-pip python2-pip python-dbus

pushd $HOME
rm -rf $HOME/yay
git clone https://aur.archlinux.org/yay.git
pushd yay
makepkg -si --noconfirm --needed
popd
popd

pip3 install --user taggregator
sudo pip install hidapi rivalcfg

ln -sf $(pwd)/.ignore $HOME
ln -sf $(pwd)/.zprofile $HOME

sudo pacman -S --noconfirm --needed xterm pulseaudio pulseaudio-alsa neofetch playerctl keepassxc nodejs npm i3lock scrot imagemagick thunar firefox pavucontrol ncmpcpp ripgrep man mpc mpv youtube-dl git-lfs lib32-glu htop nvidia-settings xclip network-manager-applet shellcheck dunst
yay -S --noconfirm --needed unityhub

find . -type f -name 'install.sh' -exec sh -c '
for f do
    chmod +x $f
    sh -c $f
done' sh {} +

chsh -s $(which zsh)
