#!/bin/bash

# General
sudo apt install -y htop lm-sensors hddtemp

# Regolith
# https://regolith-linux.org
# general customisations
ln -s $PWD/.config/regolith ~/.config/regolith
# custom look
ln -s $PWD/.config/regolith/styles/custom /etc/regolith/styles/custom
ln -s $PWD/.Xresources ~/.Xresources

# Polybar
sudo apt-get install libasound2-dev libpulse-dev


ln -s $PWD/.config/polybar ~/.config/polybar

# Dunst
sudo apt-get install dunst
ln -s $PWD/.config/dunst ~/.config/dunst

# Home directories
echo "Create home directories..."

# Pictures
cp -R $PWD/Pictures/* ~/Pictures/

sudo apt-get install -y rxvt-unicode
ln -s $PWD/.urxvt ~/.urxvt

# Oh My ZSH
# https://ohmyz.sh/
echo "Installing and configuring Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -f ~/.zshrc && \
ln -s $PWD/.zshrc ~/.zshrc
cp $PWD/.zshrc-secrets.sample $PWD/.zshrc-secrets && \
ln -s $PWD/.zshrc-secrets ~/.zshrc-secrets
ln -s $PWD/.zshrc-aliases ~/.zshrc-aliases

# Tmux
# https://github.com/tmux/tmux/wiki
echo "Installing and configuring Tmux..."
sudo apt-get install -y tmux
ln -s $PWD/.tmux.conf ~/.tmux.conf

# Git
echo "Installing and configuring Git..."
sudo apt-get install -y git
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitignore_global ~/.gitignore_global

# Vim
echo "Installing and configuring Vim..."
sudo apt-get install -y vim
rm -fR ~/.vim && \
rm -fR ~/.vimrc && \
ln -s $PWD/.vim ~/.vim && \
ln -s $PWD/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall > /dev/null

# KB
# https://github.com/gnebbia/kb
echo "Installing KB..."
python3 -m pip install --user kb-manager
ln -s $PWD/.kb ~/.kb

# WTF
echo "Configuring WTF..."
yay -S wtfutil
ln -s $PWD/.config/wtf ~/.config/wtf

# Sublime Text
echo "Configuring Sublime Text 3..."
rm -f ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
rm -f ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
ln -s $PWD/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -s $PWD/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap' ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
