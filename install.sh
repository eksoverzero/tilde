#!/bin/bash

ln -s $PWD/.config/rofi ~/.config/rofi
ln -s $PWD/.config/i3 ~/.config/i3
ln -s $PWD/.config/polybar ~/.config/polybar
ln -s $PWD/.config/termite/config ~/.config/termite/config

ln -s $PWD/.gtkrc-2.0 ~/.gtkrc-2.0
ln -s $PWD/.config/gtk-3.0 ~/.config/gtk-3.0

ln -s $PWD/.icons ~/.icons
ln -s $PWD/.themes ~/.themes

# Home directories
echo "Create home directories..."

# Sites
rm -fR ~/Sites && \
ln -s $PWD/Sites ~/Sites

# Pictures
rm -fR ~/Pictures && \
ln -s $PWD/Pictures ~/Pictures

# Fonts
echo "Installing fonts..."
ln -s $PWD/.fonts ~/.fonts
fc-cache -f -v

# Oh My Bash
# https://ohmybash.github.io/
echo "Installing and configuring Oh My Bash..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
rm -f ~/.bashrc && \
ln -s $PWD/.bashrc ~/.bashrc
cp $PWD/.bashrc-secrets.sample $PWD/.bashrc-secrets && \
ln -s $PWD/.bashrc-secrets ~/.bashrc-secrets
ln -s $PWD/.bashrc-aliases ~/.bashrc-aliases

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
echo "Installing and configuring Sublime Text 3..."
yay -S sublime-text-3
rm -f ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
rm -f ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
ln -s $PWD/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -s $PWD/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap' ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
