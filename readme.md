# Tom's Debian setup

![desktop screenshot](http://i.imgur.com/OPQUMzA.png)

This was written for Debian 10. Download debian amd64 netinst [here](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/)

### Using graphical install

- install lang: english
- locale: en_US
- location: croatia
- no root account
- partition: guided - use entire disc, LVM, encrypted
- scheme: all in one
- use network mirror: yes, Sweden; deb.debian.org; blank proxy
- software selection: standard sys utilities, xfce & print server


### After install

append `contrib non-free` to apt sources list - if needed

```bash
sudo nano /etc/apt/sources.list /etc/apt/sources.list.d/*
```

update, upgrade & install dev packages

```bash
sudo apt-get update && sudo apt-get upgrade

# Basic
sudo apt-get -y install git curl rsync

# TUI & sys
sudo apt-get -y install tmux links htop ncdu ranger gparted

# Media & office
sudo apt-get -y install chromium audacious vlc peek transmission

# Fonts & spell checking
sudo apt -y install fonts-dejavu fonts-dejavu-extra fonts-droid-fallback fonts-freefont-ttf fonts-liberation fonts-noto-mono fonts-opensymbol ttf-bitstream-vera ttf-mscorefonts-installer
sudo apt -y install aspell aspell-en hunspell hunspell-en-us mythes-en-us
```

Setup instructions:

- [VSCode](https://wiki.debian.org/VisualStudioCode) - consider using vscodium
- [Firefox (regular)](https://support.mozilla.org/en-US/kb/install-firefox-linux#w_install-firefox-deb-package-for-debian-based-distributions) - consider donating to ladybird browser
- [Chrome](https://support.google.com/chrome/a/answer/9025903?hl=en) - consider using chromium

Goodies:

- [papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme?tab=readme-ov-file#debian-and-derivatives) (new)
- [papericons](https://snwh.org/paper) (old) or 
    - `sudo dpkg -i paper*.deb && sudo apt-get -y install -f`
- xfce [axis theme](https://www.xfce-look.org/p/1016678/)
    - `tar zxf axis-xfwm.tar.gz && sudo cp -pr axis* /usr/share/themes/ && rm -R axis*`

Copy your home files/dotfiles back into home dir and reboot or log out and log back in.


> [!NOTE]  
> To handle different git configs and accounts ~/.gitconfig tracks subfolder .gitconfigs. Github added for the example.


### Other

- Setting up console resolution

```bash
sudo apt install hwinfo
hwinfo --framebuffer //to see available resolutions
sudo nano /etc/default/grub
    GRUB_GFXMODE=1024x768 //enter one of available resolutions
    GRUB_GFXPAYLOAD="keep"
    GRUB_CMDLINE_LINUX="nomodeset"
sudo update-grub
sudo reboot
```

### Keyboards

My keyboards:
- Future: Ergo K860 ?
- Currently using: Microsoft Ergonomic Keyboard - Wired (LXM-00001)
- ~~HP KB-0316 (HR) - For use with default Croatian layout~~
- ~~Modecom MC-800G (US with UK enter) - custom layout, .Xmodmap~~
- ~~METOO Black - (US ANSI) - custom layout .Xmodmap~~

I like good cheap keyboards. You can find Microsoft keyboards for next to nothing on marketplaces. I got mine for ~$15.

<!--
Keyboard docs: 
- http://pascal.tsu.ru/en/xkb/setup.html
- https://www.charvolant.org/doug/xkb/html/
- https://superuser.com/questions/290115/
- http://rlog.rgtti.com/2014/05/01/how-to-modify-a-keyboard-layout-in-linux/
- http://wiki.linuxquestions.org/wiki/List_of_Keysyms_Recognised_by_Xmodmap
- https://askubuntu.com/questions/254424/
-->
