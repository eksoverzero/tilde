# ~

My home environment


### Common

```
sudo apt-get install -y build-essential git ubuntu-drivers-common mesa-utils mesa-utils-extra gnupg numlockx xautolock xorg xserver-xorg wpasupplicant
```

### i3

```
sudo apt-get install -y i3 feh scrot conky
```

Py3status:

```
sudo apt-gt install python3-pip
pip3 install py3status
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
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
mv ttf/* /usr/local/share/fonts
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
