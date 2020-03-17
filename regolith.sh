#!/bin/bash

rm -fR ~/.config/regolith && \
ln -s $PWD/.config/regolith ~/.config/regolith
ln -s $PWD/.Xresources ~/.Xresources-regolith
ln -s $PWD/.Xresources.d ~/.Xresources.d
