#!/bin/bash

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

sudo apt-get install -y build-essential apt-transport-https git unzip wget curl \
                        conky lm-sensors hddtemp

# Home directories
echo "Create home directories..."
# Pictures
rm -fR ~/Pictures && \
ln -s $PWD/Pictures ~/Pictures

# i3-gaps
sudo apt-get install -y i3status rofi feh dunst

mkdir tmp
cd /tmp
git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
sudo make install

cd /tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install

# py3status
echo "Installing and configuring py3status..."
sudo apt-get install -y python3 python3-pip
sudo pip3 install py3status pytz tzlocal i3ipc
ln -s $PWD/.config/py3status ~/.config/py3status

# Dunst
echo "Installing and configuring Dunst..."
sudo apt-get install -y dunst
ln -s $PWD/.config/dunst ~/.config/dunst

# Termite
sudo apt-get install -y git g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool libpcre2-dev libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev libxml2-utils gperf neofetch

cd /tmp
git clone https://github.com/thestinger/vte-ng.git
cd vte-ng
./autogen.sh
make && sudo make install

cd /tmp
git clone --recursive https://github.com/thestinger/termite.git
cd termite
make
sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/termite 60

mkdir -p ~/.config/termite && \
ln -s $PWD/.config/termite/config ~/.config/termite/config

# Fonts
echo "Installing fonts..."
ln -s $PWD/.fonts ~/.fonts
fc-cache -f -v

# ZSH
echo "Installing and configuring ZSH..."
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
rm -f ~/.zshrc && \
ln -s $PWD/.zshrc ~/.zshrc
chsh -s $(which zsh)

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
ln -s $PWD/.vim ~/.vim
ln -s $PWD/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall > /dev/null

# Sublime Text
echo "Configuring Sublime Text 3..."
rm -f ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -s $PWD/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
