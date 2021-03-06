# ~

[ArcoLinux D](https://arcolinux.info/download/)

## Manual steps

### Handle suspending when closing the laptop lid

```
# /etc/systemd/logind.conf

...
HandleLidSwitch=suspend
...
```

## Software

Some things that aren't available otherwise.

### Sublime Text Packages

* [Gravity Theme](https://packagecontrol.io/packages/Theme%20-%20Gravity)

### RVM

```
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

curl -sSL https://get.rvm.io | bash -s stable --ruby
```

### NVM

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
```

### Python, PIP and venv

```
cd /tmp && \
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
```

```
python3 -m pip install --user virtualenv
```
