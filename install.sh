#!/bin/bash

# https://dzone.com/articles/arch-linux-installation-on-hw-with-i3-windows-mana-1
sudo pacman -Syyuu && \
yay -Syyuu

# General things
sudo pacman -S polybar htop autorandr \
               adobe-source-code-pro-fonts powerline-fonts otf-powerline-symbols \
               docker docker-compose \
               aws-cli kubectl helm \
               kubectx k9s terraform kustomize

yay -S aws-iam-authenticator \
       spotify slack-desktop ngrok

# Desktop setup
ln -s $PWD/.config/i3 ~/.i3
ln -s $PWD/.config/dunst ~/.config/dunst
ln -s $PWD/.config/polybar ~/.config/polybar
ln -s $PWD/.config/autorandr ~/.config/autorandr
ln -s $PWD/.config/gtk-2.0 ~/.config/gtk-2.0
ln -s $PWD/.config/gtk-3.0 ~/.config/gtk-3.0

ln -s $PWD/.Xresources ~/.Xresources
ln -s $PWD/.gtkrc-2.0 ~/.gtkrc-2.0
ln -s $PWD/.dmenurc ~/.dmenurc

# Home directories
echo "Create home directories..."

# Sites
cp -R $PWD/Sites/* ~/Sites/

# Pictures
cp -R $PWD/Pictures/* ~/Pictures/

# Fonts
echo "Installing fonts..."
ln -s $PWD/.fonts ~/.fonts
ln -s $PWD/.fontconfig ~/.fontconfig
fc-cache -f -v

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
