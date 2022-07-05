#!/bin/bash

# Home directories
echo "Create home directories..."

# Sites
cp -R $PWD/Sites/* ~/Sites/

# Pictures
cp -R $PWD/Pictures/* ~/Pictures/

rm -fR ~/.Xresources && \
ln -s $PWD/.Xresources ~/.Xresources
rm -fR ~/.i3 && \
ln -s $PWD/.i3 ~/.i3
rm -fR ~/.config/i3status && \
ln -s $PWD/.config/i3status ~/.config/i3status


# Oh My ZSH
echo "Installing and configuring Oh My ZSH..."
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -f ~/.zshrc && \
ln -s $PWD/.zshrc ~/.zshrc
cp $PWD/.zshrc-secrets.sample $PWD/.zshrc-secrets && \
ln -s $PWD/.zshrc-secrets ~/.zshrc-secrets && \
ln -s $PWD/.zshrc-aliases ~/.zshrc-aliases
chsh -s $(which zsh)

# Git
echo "Installing and configuring Git..."
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitignore_global ~/.gitignore_global

# Vim
echo "Installing and configuring Vim..."
rm -fR ~/.vim && \
ln -s $PWD/.vim ~/.vim && \
ln -s $PWD/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall > /dev/null

# Rbenv
yay -S rbenv ruby-build

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
rm -f ~/.config/sublime-text/Packages/User/Preferences.sublime-settings
rm -f ~/.config/sublime-text/Packages/User/'Default (Linux).sublime-keymap'
ln -s $PWD/.config/sublime-text/Packages/User/Preferences.sublime-settings ~/.config/sublime-text/Packages/User/Preferences.sublime-settings
ln -s $PWD/.config/sublime-text/Packages/User/'Default (Linux).sublime-keymap' ~/.config/sublime-text/Packages/User/'Default (Linux).sublime-keymap'
