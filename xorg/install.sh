#!/bin/sh

sudo pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-xrandr xorg-xinput

dir="$(dirname -- "$(readlink -f -- "$0")")"
ln -sf $dir/.Xresources $HOME
ln -sf $dir/.xinitrc $HOME
