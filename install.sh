#!/bin/bash

# In the process of ditching regolith
#
# sudo apt install git build-essential software-properties-common
#
# sudo add-apt-repository ppa:kgilmer/speed-ricer
# sudo apt-get update
#
# sudo apt install build-essential ubuntu-drivers-common mesa-utils mesa-utils-extra gnupg curl wget unzip wpasupplicant
# sudo apt install i3-gaps polybar scrot rofi numlockx xautolock xorg xserver-xorg lightdm

# git clone https://github.com/ryanoasis/nerd-fonts

ln -s $PWD/.config/i3/config ~/.config/i3/config
ln -s $PWD/.config/i3/picom.conf ~/.config/i3/picom.conf
ln -s $PWD/.config/polybar/config ~/.config/polybar/config
ln -s $PWD/.config/termite/config ~/.config/termite/config

ln -s $PWD/.gtkrc-2.0 ~/.gtkrc-2.0
ln -s $PWD/.config/gtk-3.0 ~/.config/gtk-3.0

ln -s $PWD/.themes ~/.themes

# Home directories
echo "Create home directories..."
# Pictures
rm -fR ~/Pictures && \
ln -s $PWD/Pictures ~/Pictures

# Fonts
echo "Installing fonts..."
ln -s $PWD/.fonts ~/.fonts
fc-cache -f -v

# Oh My Bash
# https://ohmyz.sh/
echo "Installing and configuring Oh My Zsh..."
#bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
rm -f ~/.zshrc && \
ln -s $PWD/.zshrc ~/.zshrc
cp $PWD/.zshrc-secrets.sample $PWD/.zshrc-secrets && \
ln -s $PWD/.zshrc-secrets ~/.zshrc-secrets

# Tmux
echo "Installing and configuring Tmux..."
sudo pacman -S tmux
ln -s $PWD/.tmux.conf ~/.tmux.conf

# Git
echo "Installing and configuring Git..."
sudo pacman -S git
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitignore_global ~/.gitignore_global

# Vim
echo "Installing and configuring Vim..."
sudo pacman -S vim
rm -fR ~/.vim && \
ln -s $PWD/.vim ~/.vim && \
ln -s $PWD/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall > /dev/null

# Sublime Text
echo "Configuring Sublime Text 3..."
rm -f ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
rm -f ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
ln -s $PWD/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -s $PWD/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap' ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
