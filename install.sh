#!/bin/bash

sudo pacman -Syyuu

# General requirements
sudo pacman -S base-devel git python-pip

yay -Syyuu

# General things
sudo pacman -S htop \
               docker docker-compose \
               aws-cli kubectl helm \
               kubectx k9s terraform kustomize

# Home directories
echo "Create home directories..."

# Sites
cp -R $PWD/Sites/* ~/Sites/

# Pictures
cp -R $PWD/Pictures/* ~/Pictures/

# i3
sudo pacman -S manjaro-i3-settings
cp -r /etc/skel /home/eksoverzero/
rm -fR ~/.i3 && \
ln -s $PWD/.i3 ~/.i3

# Oh My ZSH
echo "Installing and configuring Oh My ZSH..."
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -f ~/.zshrc && \
ln -s $PWD/.zshrc ~/.zshrc
cp $PWD/.zshrc-secrets.sample $PWD/.zshrc-secrets && \
ln -s $PWD/.zshrc-secrets ~/.zshrc-secrets && \
ln -s $PWD/.zshrc-aliases ~/.zshrc-aliases

# Terminal
sudo pacman -S rxvt-unicode urxvt-perls

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

# KB
echo "Installing KB..."
pip install -U kb-manager
ln -s $PWD/.kb ~/.kb

# WTF
echo "Installing WTF..."
yay -S wtfutil
ln -s $PWD/.config/wtf ~/.config/wtf

# Sublime Text
echo "Installing and configuring Sublime Text 3..."
yay -S sublime-text-3
rm -f ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
rm -f ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
ln -s $PWD/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -s $PWD/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap' ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
