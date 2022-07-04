#!/bin/bash

sudo apt install build-essential software-properties-common git curl \
                 htop

# Home directories
echo "Create home directories..."

# Sites
cp -R $PWD/Sites/* ~/Sites/

# Pictures
cp -R $PWD/Pictures/* ~/Pictures/

# Oh My ZSH
echo "Installing and configuring Oh My ZSH..."
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -f ~/.zshrc && \
ln -s $PWD/.zshrc ~/.zshrc
cp $PWD/.zshrc-secrets.sample $PWD/.zshrc-secrets && \q
ln -s $PWD/.zshrc-secrets ~/.zshrc-secrets && \
ln -s $PWD/.zshrc-aliases ~/.zshrc-aliases
chsh -s $(which zsh)

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

# NVM
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# Rbenv
sudo apt install libssl-dev libreadline-dev zlib1g-dev autoconf bison libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev
sudo apt install postgresql postgresql-contrib libpq-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

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
