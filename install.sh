#!/bin/bash

sudo pacman -Syyuu

# General requirements
sudo pacman -S base-devel git

yay -Syyuu

# General things
sudo pacman -S htop spotify slack-desktop \
               aws-cli kubectl helm \
               kubectx k9s terraform kustomize

# Home directories
echo "Create home directories..."

# Sites
cp -R $PWD/Sites/* ~/Sites/

# Pictures
cp -R $PWD/Pictures/* ~/Pictures/

# Oh My Bash
# https://ohmybash.github.io/
echo "Installing and configuring Oh My Bash..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
rm -f ~/.bashrc && \
ln -s $PWD/.bashrc ~/.bashrc
cp $PWD/.bashrc-secrets.sample $PWD/.bashrc-secrets && \
ln -s $PWD/.bashrc-secrets ~/.bashrc-secrets
ln -s $PWD/.bashrc-aliases ~/.bashrc-aliases

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
yay -S python-kb
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
