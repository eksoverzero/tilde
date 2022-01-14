#!/bin/bash

sudo apt update && \
sudo apt upgrade

# General things
# sudo pacman -S base-devel yay htop \
#                bspwm sxhkd dmenu feh

# sudo pacman -S docker docker-compose \
#                aws-cli kubectl helm \
#                kubectx k9s terraform kustomize

sudo apt install -y build-essential libssl-dev libffi-dev \
                    git-core htop curl \
                    python-dev python3-pip python3-venv \
                    polybar lm-sensors libpq-dev

sudo apt install docker.io docker-compose
sudo usermod -aG docker $USER

# Desktop setup
ln -s $PWD/.Xresources-regolith ~/.Xresources-regolith
ln -s $PWD/.config/regolith/Xresources ~/.config/regolith/Xresources
ln -s $PWD/.config/regolith/styles ~/.config/regolith/styles
rm -fR ~/.config/regolith/i3 && \
ln -s $PWD/.config/regolith/i3 ~/.config/regolith/i3
rm -fR ~/.config/regolith/i3xrocks && \
ln -s $PWD/.config/regolith/i3xrocks ~/.config/regolith/i3xrocks

ln -s $PWD/.local/bin ~/.local/bin

# Home directories
echo "Create home directories..."

# Sites
cp -R $PWD/Sites/* ~/Sites/

# Pictures
cp -R $PWD/Pictures/* ~/Pictures/

# Oh My ZSH
# https://ohmyz.sh/
echo "Installing and configuring Oh My ZSH..."
sudo apt install zsh fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir -p ~/.zsh
git clone https://github.com/reobin/typewritten.git ~/.zsh/typewritten
rm -f ~/.zshrc && \
ln -s $PWD/.zshrc ~/.zshrc
cp $PWD/.zshrc-secrets.sample $PWD/.zshrc-secrets && \
ln -s $PWD/.zshrc-secrets ~/.zshrc-secrets && \
ln -s $PWD/.zshrc-aliases ~/.zshrc-aliases
chsh -s $(which zsh)

# Tmux
echo "Installing and configuring Tmux..."
sudo apt install tmux
ln -s $PWD/.tmux.conf ~/.tmux.conf

# Git
echo "Installing and configuring Git..."
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitignore_global ~/.gitignore_global

# Vim
echo "Installing and configuring Vim..."
sudo apt install vim
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
sudo pip3 install -U kb-manager
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
