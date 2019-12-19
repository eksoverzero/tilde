# ~


### Common

```
sudo apt-get install -y build-essential apt-transport-https git unzip ubuntu-drivers-common mesa-utils mesa-utils-extra gnupg numlockx xautolock xorg xserver-xorg wpasupplicant
```

### i3

```
sudo apt-get install -y i3 rofi feh scrot conky lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
```

Py3status:

```
sudo apt-gt install python3 python3-pip
sudo pip3 install py3status pytz tzlocal
```

### Vim

Installing Plug:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Installing plugins:

```
:PlugInstall
```

### Fonts

Hack font

```
cd /tmp
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
sudo mv ttf/* /usr/local/share/fonts
```

### Termite

```
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
```

```
# export TERM=xterm-color
export TERM=xterm-256color
```

### ZSH

```
sudo apt-get install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Sublime Text

```
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update
sudo apt-get install sublime-text
```

### Brave

```
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update
sudo apt install brave-browser
```

### RVM

```
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

curl -sSL https://get.rvm.io | bash -s stable --ruby
```

### NVM

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
```
