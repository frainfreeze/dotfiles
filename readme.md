# Tom's Dotfiles
![desktop screenshot](http://i.imgur.com/OPQUMzA.png)

This was written for debian 9.
Download debian amd64 netinst [here](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/)

### installation
```
Using graphical install: 
- install lang: english
- location: other->europe->croatia
- locale: en_US
- partition: guided - use entire disc
- scheme: seperate /home /var /temp
- use network mirror: yes, Switzerland; deb.debian.org; blank proxy
- software selection: standard sys utilities. xfce & print server optional
```

### after install
Login into your new os:
If xfce: use default config
Run following as superuser:
```
$ nano /etc/apt/sources.list    
    - delete or comment out deb cdrom:[Debian GNu/....
    - add 'contrib non-free' after each main
$ apt-get update && apt-get upgrade
$ apt-get install sudo gksu synaptic apt-xapian-index policykit-1-gnome curl wget
$ wget -O - https://pastebin.com/raw/6mc00yBj | bash # skip if no gui
$ usermod -aG sudo YOUR_USERNAME
$ reboot
```
- open new terminal, now you re going to work as user instad of root

### bloat (eye candy)
I use [Arc](https://github.com/horst3180/arc-theme) and [Adapta](https://github.com/adapta-project/adapta-gtk-theme) elements plus [papericons](https://snwh.org/paper/download).

Once those are installed::
```
- applications menu > settings > appearance > style: Adapta-Eta, icons: Paper, fonts: Noto Sans UI 10
- applications menu > settings > window manager: Adapta-nokto
- applications menu > settings > pannel: remove panel 2, panel 1: row size: 20, uncheck "don't reserve space on borders"
- applications menu > settings > pannel > items: Whisker menu, window buttons, separator, workspace switcher, pulse plugin, clock, notification area, action buttons
```

### development tools
1. gui
 - visual studio code
 - jetbrains CLion

2. tui
- vim
- tmux


### misc
- tui tools: `apt install build-essential python3 python3-pip tmux git curl wget links rsync ranger p7zip-full htop`
- disks
```bash
    $ cd /media
    $ sudo mkdir DiskLabel
    $ sudo blkid
    $ sudo umount /your/disk
    $ sudo nano /etc/fstab #add disks using info from blkid
    $ sudo mount -a
```
- setting up console resolution
```bash
    $ apt install hwinfo
    $ hwinfo --framebuffer //to see available resolutions
    $ sudo nano /etc/default/grub
        GRUB_GFXMODE=1024x768 //enter one of available resolutions
        GRUB_GFXPAYLOAD="keep"
        GRUB_CMDLINE_LINUX="nomodeset"
    $ sudo update-grub
    $ sudo reboot
```
- if you are running in vm install virtual machine tools, in case of windows host and wmware workstation it is open-vm-tools
- browser plugins: https://www.privacytools.io/#addons

**https://pastebin.com/raw/6mc00yBj**
```bash
sudo apt -y install build-essential debian-keyring mousepad network-manager network-manager-gnome p7zip unzip policykit-1-gnome p7zip-full aspell aspell-en hunspell hunspell-en-us mythes-en-us ristretto rsync thunar-archive-plugin fonts-dejavu fonts-dejavu-extra fonts-droid-fallback fonts-freefont-ttf fonts-liberation fonts-noto-mono fonts-opensymbol libreoffice-writer libreoffice-calc libreoffice-impress ttf-bitstream-vera ttf-dejavu ttf-dejavu-core ttf-dejavu-extra ttf-freefont ttf-liberation ttf-mscorefonts-installer ufw vlc xarchiver xfce4-clipman xfce4-panel-dev xfce4-power-manager xfce4-screenshooter xfce4-taskmanager xfce4-terminal xfce4-xkb-plugin xserver-xorg-input-synaptics git chromium chromium-l10n
```

## Keyboard setup
![](https://www.bug.hr/img/kupili-smo-jeftinu-mehanicku-tipkovnicu-iz-kine-je-li-se-isplatilo_gduZkX.png)

My keyboards:
- HP KB-0316 (HR) - For use with default Croatian layout
- Modecom MC-800G (US with UK enter) - custom layout, .Xmodmap
- METOO Black - (US ANSI) - custom layout .Xmodmap

<!--
Keyboard docs: 
- http://pascal.tsu.ru/en/xkb/setup.html
- https://www.charvolant.org/doug/xkb/html/
- https://superuser.com/questions/290115/
- http://rlog.rgtti.com/2014/05/01/how-to-modify-a-keyboard-layout-in-linux/
- http://wiki.linuxquestions.org/wiki/List_of_Keysyms_Recognised_by_Xmodmap
- https://askubuntu.com/questions/254424/
-->


