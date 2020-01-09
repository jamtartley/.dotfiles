#!/bin/sh

dir="$(dirname -- "$(readlink -f -- "$0")")"

QUTE=$HOME/.config/qutebrowser
mkdir -p $QUTE
ln -sf $dir/config.py $QUTE
