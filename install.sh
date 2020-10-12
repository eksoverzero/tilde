#!/bin/bash

# https://dzone.com/articles/arch-linux-installation-on-hw-with-i3-windows-mana-1
sudo pacman -Syyuu && \
yay -Syyuu

# Display
# Nvidia
sudo pacman -S nvidia nvidia-utils nvidia-settings

# Intel
sudo pacman -S intel-media-driver

# Sound
sudo pacman -S alsa-utils alsa-plugins alsa-lib pavucontrol playerctl

# i3
sudo pacman -S xorg-server xorg-apps xorg-xinit i3-gaps \
               numlockx polybar rofi conky dmenu feh dunst \
               betterlockscreen paper-icon-theme \
               autorandr xfce4-power-manager

# Terminal
sudo pacman -S rxvt-unicode urxvt-perls

# Ranger
sudo pacman -S ranger atool elinks ffmpegthumbnailer highlight libcaca \
               lynx mediainfo perl-image-exiftool poppler \
               python-chardet transmission-cli ueberzug w3m

sudo pacman -S aws-cli kubectl

# LightDM
sudo pacman -S lightdm lightdm-gtk-greeter
sudo sed -i 's/#autologin-session=/autologin-session=i3/g' /etc/lightdm/lightdm.conf
sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-gtk-greeter/g' /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm && \
sudo systemctl start lightdm

# General things
sudo pacman -S htop spotify

ln -s $PWD/.config/rofi ~/.config/rofi
ln -s $PWD/.config/i3 ~/.config/i3
ln -s $PWD/.config/polybar ~/.config/polybar
ln -s $PWD/.config/dunst ~/.config/dunst

ln -s $PWD/.xinit.rc ~/.xinit.rc
ln -s $PWD/.Xdefaults ~/.Xdefaults
ln -s $PWD/.Xresources ~/.Xresources
ln -s $PWD/.gtkrc-2.0 ~/.gtkrc-2.0
ln -s $PWD/.config/gtk-3.0 ~/.config/gtk-3.0

# Icons
yay -S paper-icon-theme
ln -s $PWD/.icons ~/.icons

# Themes
ln -s $PWD/.themes ~/.themes

# Home directories
echo "Create home directories..."

# Sites
# rm -fR ~/Sites && \
# ln -s $PWD/Sites ~/Sites
cp -R $PWD/Sites/* ~/Sites/

# Pictures
# rm -fR ~/Pictures && \
# ln -s $PWD/Pictures ~/Pictures
cp -R $PWD/Pictures/* ~/Pictures/

# Fonts
echo "Installing fonts..."
ln -s $PWD/.fonts ~/.fonts
ln -s $PWD/.fontconfig ~/.fontconfig
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

# KB
echo "Installing KB..."
python3 -m pip install --user kb
ln -s $PWD/.kb ~/.kb

# Sublime Text
echo "Installing and configuring Sublime Text 3..."
yay -S sublime-text-3
rm -f ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
rm -f ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
ln -s $PWD/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -s $PWD/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap' ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
