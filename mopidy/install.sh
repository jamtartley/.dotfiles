#!/bin/sh

sudo pacman -S --noconfirm --needed mopidy
yay -S --noconfirm --needed mopidy-spotify mopidy-spotify-tunigo

dir="$(dirname -- "$(readlink -f -- "$0")")"

MOPIDY=$HOME/.config/mopidy
mkdir -p $MOPIDY
cp $dir/mopidy.conf $MOPIDY