# Tom's Dotfiles
![desktop screenshot](http://i.imgur.com/OPQUMzA.png)

This was written for debian 9.
Download debian amd64 netinst [here](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/)

### installation
```
Using graphical install: 
- install lang: english
- locale: en_US
- partition: guided - use entire disc
- scheme: seperate /home /var /temp
- use network mirror: yes, Switzerland; deb.debian.org; blank proxy
- software selection: standard sys utilities. xfce & print server
```

### after install
```bash
# as superuser:
nano /etc/apt/sources.list    
    # - delete or comment out deb cdrom:[Debian GNu/....
    # - add 'contrib non-free' after each main
apt-get update && apt-get upgrade
apt-get install sudo gksu synaptic apt-xapian-index policykit-1-gnome curl wget git p7zip-full 
wget -O - https://pastebin.com/raw/6mc00yBj | bash # skip if no gui
usermod -aG sudo YOUR_USERNAME
reboot
```

### bloat (eye candy)
```bash 
# as user:
cd ~/Downloads

# Download papericons from https://snwh.org/paper/download
sudo dpkg -i paper*.deb
sudo apt-get install -f

# Download Axis theme https://www.xfce-look.org/p/1016678/
tar zxf 95158-axis-xfwm.tar.gz 
sudo cp -pr axis* /usr/share/themes/
rm -R axis*
```

### basic software
1. gui

```bash
# Download visual studio code from https://code.visualstudio.com/Download
sudo dpkg -i <code>.deb
sudo apt-get install -f

# get firefox and extract in home/bin/firefox 
# https://www.mozilla.org/en-US/firefox/developer/
# browser plugins: https://www.privacytools.io/#addons

sudo apt install chromium
```

2. tui & dev

```bash
sudo apt-get install tmux ranger links htop build-essential python3 python3-pip
```

3. misc

`sudo apt install rsync ristretto thunar-archive-plugin libreoffice-writer vlc xarchiver xfce4-panel-dev `

### Other
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
- virtual machines

```
# vmware player
# dl from https://my.vmware.com/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/
cd ~/Downloads/
chmod +x VMware-Player<ver>.bundle
sudo ./VMware-Player<ver>.bundle

# vbox
sudo apt install virtualbox
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


