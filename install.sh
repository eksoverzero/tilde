#!/bin/bash

# https://github.com/heckelson/i3-and-kde-plasma
# https://github.com/avivace/dotfiles
sudo pacman -Syyuu

# General things
sudo pacman -S base-devel yay htop \
               bspwm sxhkd dmenu feh

sudo pacman -S docker docker-compose \
               aws-cli kubectl helm \
               kubectx k9s terraform kustomize

sudo usermod -aG docker $USER

yay -Syyuu && \
yay -S aws-iam-authenticator \
       spotify slack-desktop ngrok

# Desktop setup
ln -s $PWD/.config/i3 ~/.config/i3
ln -s $PWD/.config/bspwm ~/.config/bspwm
ln -s $PWD/.config/sxhkd ~/.config/sxhkd
ln -s $PWD/.urxvt ~/.urxvt
ln -s $PWD/.dmenurc ~/.dmenurc
ln -s $PWD/.Xresources ~/.Xresources

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

# WTF
echo "Installing WTF..."
yay -S wtfutil
ln -s $PWD/.config/wtf ~/.config/wtf

# KB
# https://github.com/gnebbia/kb
echo "Installing KB..."
yay -S kb
ln -s $PWD/.kb ~/.kb

# Sublime Text
echo "Installing and configuring Sublime Text 3..."

curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

sudo pacman -S sublime-text

rm -f ~/.config/sublime-text/Packages/User/Preferences.sublime-settings
rm -f ~/.config/sublime-text/Packages/User/'Default (Linux).sublime-keymap'
ln -s $PWD/.config/sublime-text/Packages/User/Preferences.sublime-settings ~/.config/sublime-text/Packages/User/Preferences.sublime-settings
ln -s $PWD/.config/sublime-text/Packages/User/'Default (Linux).sublime-keymap' ~/.config/sublime-text/Packages/User/'Default (Linux).sublime-keymap'
