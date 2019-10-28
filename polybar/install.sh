#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed wget
yay -S --noconfirm --needed polybar

dir="$(dirname -- "$(readlink -f -- "$0")")"

POLYBAR=$HOME/.config/polybar
mkdir -p $POLYBAR
mkdir -p $POLYBAR/scripts
ln -sf $dir/config $POLYBAR/
ln -sf $dir/launch.sh $POLYBAR/
ln -sf $dir/scripts/pulseaudio-control.sh $POLYBAR/scripts

wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/MPlus/Regular/complete/M%2B%201mn%20Nerd%20Font%20Complete.ttf -P $HOME/.fonts
