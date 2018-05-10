This was written for debian 9.
Download debian amd64 [here](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/)

## instalation
Using graphical install: 
- install lang: english, 
- location: other->europe->croatia,
- locale: en_US,
- keymap: /
- hostname, domain: default
- partition: guided - use entire disc (if in VM or single boot install)
- scheeme: seperate /home /var /temp
    
> finish partitioning

> radio button set on yes

>use network mirror: yes, Switzerland; deb.debian.org; blank proxy

>software selection: xfce, print server, standard sys utilities

> install grub to bootloader: yes (if in vm, or single boot)

> /dev/sda

## after install stuff
Login into your new os:
- xfce: use default config
- open terminal emulator (up left, applications)

- enter 'su' and press enter, enter your root password, (press 'y' and 'enter' when prompted)
    run following commands (after $ sign):
    
    $ nano /etc/apt/sources.list
        
        - delete or comment out with # line 3, deb cdrom:[Debian GNu/....
        - add 'contrib non-free' after each main
        - your screen should look like this https://i.imgur.com/jaWsWhY.png
        - pres crtl-x then y then enter
    
    ```
    $ apt update
    $ apt upgrade
    $ apt install sudo gksu synaptic apt-xapian-index policykit-1-gnome curl wget
    $ wget -O - https://pastebin.com/raw/6mc00yBj | bash
    $ usermod -aG sudo YOUR_USERNAME
    ```

- close terminal
- set wallpaper, lets make thing look less shit https://i.imgur.com/ZBDw1wZ.jpg
- reboot

- open new terminal, now you re going to work as user instad of root

## bloat (eye candy)
- if you re into windows 10 https://github.com/B00merang-Project/Windows-10
- else arc theme is quite cool too https://github.com/horst3180/arc-theme

- i ll use adapta for this config https://github.com/adapta-project/adapta-gtk-theme
run following commands:
    - sudo apt install  autoconf automake inkscape  libgdk-pixbuf2.0-dev  libglib2.0-dev  libsass0  libxml2-utils  pkg-config  sassc fonts-noto
    - sudo git clone https://github.com/adapta-project/adapta-gtk-theme.git
    - cd adapta-gtk-theme
    - sudo ./autogen.sh
    - sudo make
    - sudo make install
    
Once its done go to aplications menu > settings > appearance and select theme you want, for me its adapta-noko-eta

Then applications > settings > window manager: again adapta nokto

Aplications > settings > pannel, dropdown select panel 2 and remove it, select panel 1 again, row size: 20, lock panel uncheck and drag on bottom lock again, uncheck dont reserve space on borders

Under items tab add weather pannel, setup for your city, appearance - liquid dark, days in columns, scrolbox - only temperature

download "paper icons" for debian from https://snwh.org/paper/download
fire up terminal and do
- cd ~/Downloads
- sudo dpkg -i filname.deb (downloaded filename)
 
 go to settings > apearance > icons, select paper-mono-dark; fonts-noto sans ui
    
## development tools
1. graphical
 - visual studio code
    download .deb stable from https://code.visualstudio.com/
    -> cd ~/Downloads
    -> ls (to see files)
    -> sudo dpkg -i filename.deb (you can type fist few leters of filename and press tab to autocomplete)
    open it from menu - development tools -> extensions (5th button, box with box) 
        - search and install code runner, 
        - c/c++ from microsoft, 
        - c/c++ snippets from harsh (for autocomplete like visual studio), 
        - c++ intellisense from austing, 
        - plastic (theme, activate from file-preferences-themes)
        

2. console
-> sudo apt install terminator tmux mc links python-pip codeblocks
-> sudo pip install mpsyt

## virtualbox
Add backports to your sources.list
deb http://ftp.debian.org/debian stretch-backports main contrib non-free
sudo apt update
sudo apt install virtualbox

## also
- if you ar running in vm install virtual machine tools, in cas eof windows and wmware workstation it is open-vm-tools
- browser plugins: https://www.privacytools.io/#addons

## disk
cd media
sudo mkdir DiskLabel
sudo blkid
sudo umount /your/disk
sudo nano /etc/fstab #add disks using info from blkid
sudo mount -a


## other
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
