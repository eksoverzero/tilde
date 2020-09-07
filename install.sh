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

ln -s $PWD/.config/i3 ~/.config/i3

# py3status
echo "Installing and configuring py3status..."
sudo apt-get install -y python3 python3-pip
sudo pip3 install py3status pytz tzlocal i3ipc
ln -s $PWD/.config/py3status ~/.config/py3status

ln -s $PWD/.Xresources ~/.Xresources

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
# https://github.com/ohmybash/oh-my-bash
echo "Installing and configuring Oh My Bash..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
rm -f ~/.bashrc && \
ln -s $PWD/.bashrc ~/.bashrc
cp $PWD/.bashrc_secrets.sample $PWD/.bashrc_secrets && \
ln -s $PWD/.bashrc_secrets ~/.bashrc_secrets

# Tmux
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
