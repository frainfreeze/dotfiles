# Tom's Dotfiles
My setup instructions, configuration files and scripts for Debian and FreeBSD.

Quick navigation:
- [Debian GUI](#debian-gui)
- [debian text](#debian-text)
- [FreeBSD](#freebsd)
- [Keyboard setup](#keyboard-setup)

## [Debian GUI](debian-gui)
![desktop screenshot](https://i.imgur.com/DfCRIMi.png)

This was written for debian 9.
Download debian amd64 [here](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/)

### instalation
Using graphical install: 
```
- install lang: english, 
- location: other->europe->croatia,
- locale: en_US,
- keymap: /
- hostname, domain: default
- partition: guided - use entire disc (if in VM or single boot install)
- scheeme: seperate /home /var /temp
    
> finish partitioning
> radio button set on yes
> use network mirror: yes, Switzerland; deb.debian.org; blank proxy
> software selection: xfce, print server, standard sys utilities
> install grub to bootloader: yes (if in vm, or single boot)
> /dev/sda
```

### after install
Login into your new os:
- xfce: use default config
- open terminal emulator (up left, applications)
- type 'su' and press enter, enter your root password, (press 'y' and 'enter' when prompted)
    and run following commands (after $ sign):
    ```
    $ nano /etc/apt/sources.list    
        - delete or comment out with # line 3, deb cdrom:[Debian GNu/....
        - add 'contrib non-free' after each main
        - your screen should look something like this https://i.imgur.com/jaWsWhY.png
        - pres crtl-x then y then enter
        
    $ apt update && apt upgrade
    $ apt install sudo gksu synaptic apt-xapian-index policykit-1-gnome curl wget
    $ wget -O - https://pastebin.com/raw/6mc00yBj | bash
    $ usermod -aG sudo YOUR_USERNAME
    $ reboot
    ```
- open new terminal, now you re going to work as user instad of root

### bloat (eye candy)
- if you re into windows 10 https://github.com/B00merang-Project/Windows-10
- else arc theme is quite cool too https://github.com/horst3180/arc-theme
- i ll use adapta for this config https://github.com/adapta-project/adapta-gtk-theme
- download papericons from here https://snwh.org/paper/download
- run following commands:
```
sudo apt install  autoconf automake inkscape  libgdk-pixbuf2.0-dev sassc inkscape libglib2.0-dev  libsass0  libxml2-utils  pkg-config  sassc fonts-noto
sudo git clone https://github.com/adapta-project/adapta-gtk-theme.git
cd adapta-gtk-theme
sudo ./autogen.sh
sudo make
sudo make install
sudo cd /usr/share/images/desktop-base
sudo wget -O background.png https://i.imgur.com/8ipvBl7.png
cd ~/Downloads
sudo dpkg -i paperIcons.deb
```

Once its done:
```
- go to aplications menu > settings > appearance and select theme you want, for me its adapta-noko-eta
- then applications > settings > window manager: again adapta nokto
- aplications > settings > pannel, dropdown select panel 2 and remove it, select panel 1 again, row size: 20, lock panel uncheck and drag on bottom lock again, uncheck dont reserve space on borders
- under items tab add weather pannel, setup for your city, appearance - liquid dark, days in columns, scrolbox - only temperature
- settings > apearance > icons, select paper-mono-dark; fonts-noto sans ui
- right click on desktop > desktop settings > click on wallpaper, set color to solid color, black
```

### development tools
1. graphical
 - visual studio code
    ```
    run wget -O - https://pastebin.com/raw/DaEWqrj8 | bash
    then  open vscode and install following extensions: 
        - code runner, 
        - c/c++ from microsoft, 
        - code spell checker
        - markdown preview enhanced
        - python
 - jetbrains CLion

2. vim & tmux

### virtualbox
Add backports to your sources.list
```
deb http://ftp.debian.org/debian stretch-backports main contrib non-free
sudo apt update
sudo apt install virtualbox
```

### misc
- if you are running in vm install virtual machine tools, in case of windows and wmware workstation it is open-vm-tools
- browser plugins: https://www.privacytools.io/#addons

### disk
```
$ cd /media
$ sudo mkdir DiskLabel
$ sudo blkid
$ sudo umount /your/disk
$ sudo nano /etc/fstab #add disks using info from blkid
$ sudo mount -a
```

### other
```
$ localectl status
System Locale: LANG=en_US.UTF-8
               LANGUAGE=en_US:en
    VC Keymap: n/a
   X11 Layout: hr
    X11 Model: pc105

$ setxkbmap -query
rules:      evdev
model:      pc104
layout:     us
variant:    hbs
```
```
https://pastebin.com/raw/6mc00yBj
sudo apt -y install build-essential debian-keyring mousepad network-manager network-manager-gnome p7zip unzip policykit-1-gnome p7zip-full aspell aspell-en hunspell hunspell-en-us mythes-en-us ristretto rsync thunar-archive-plugin fonts-dejavu fonts-dejavu-extra fonts-droid-fallback fonts-freefont-ttf fonts-liberation fonts-noto-mono fonts-opensymbol libreoffice-writer libreoffice-calc libreoffice-impress ttf-bitstream-vera ttf-dejavu ttf-dejavu-core ttf-dejavu-extra ttf-freefont ttf-liberation ttf-mscorefonts-installer ufw vlc xarchiver xfce4-clipman xfce4-panel-dev xfce4-power-manager xfce4-screenshooter xfce4-taskmanager xfce4-terminal xfce4-xkb-plugin xserver-xorg-input-synaptics git chromium chromium-l10n
```

## Debian text
![console screenshot](https://i.imgur.com/1KwYS5y.png)

1. Install debian
```bash
     $ nano /etc/apt/sources.list    
        - delete or comment out with # line 3, deb cdrom:[Debian GNu/....
        - add 'contrib non-free' after each main
        - your screen should look something like this https://i.imgur.com/jaWsWhY.png
        - pres crtl-x then y then enter
        
    $ apt update && apt upgrade
    $ apt install sudo && usermod -aG sudo YOUR_USERNAME
    $ reboot
```

2. Setting up console resolution
  - apt install hwinfo
  - hwinfo --framebuffer //to see available resolutions
  - sudo nano /etc/default/grub
```
    GRUB_GFXMODE=1024x768 //enter one of available resolutions
    GRUB_GFXPAYLOAD="keep"
    GRUB_CMDLINE_LINUX="nomodeset"
```
  - sudo update-grub
  - sudo reboot

3. Setting up Development enviroment
 - `apt install build-essential python3 python3-pip tmux git curl wget links rsync ranger p7zip-full htop`

## FreeBSD
-add me-


## Keyboard setup
![](https://www.bug.hr/img/kupili-smo-jeftinu-mehanicku-tipkovnicu-iz-kine-je-li-se-isplatilo_gduZkX.png)
Docs: 
- http://pascal.tsu.ru/en/xkb/setup.html
- https://www.charvolant.org/doug/xkb/html/
- https://superuser.com/questions/290115/
- http://rlog.rgtti.com/2014/05/01/how-to-modify-a-keyboard-layout-in-linux/
- http://wiki.linuxquestions.org/wiki/List_of_Keysyms_Recognised_by_Xmodmap
- https://askubuntu.com/questions/254424/

My keyboards:
- HP KB-0316 (HR) - fav keyboard, I use default Croatian layout for Debian
- Modecom MC-800G (US with UK enter) - custom layout, .Xmodmap
- METOO Black - (US ANSI) - custom layout .Xmodmap
```
xmodmap ~/.Xmodmap
```


