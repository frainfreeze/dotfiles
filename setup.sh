echo "Installing from apt..."

### tui & dev
sudo apt-get -y install tmux ranger links htop build-essential python3 python3-pip virtualbox

### media & office
sudo apt-get -y install chromium audacious ristretto vlc libreoffice-writer libreoffice-calc libreoffice-impress peek transmission

### misc & sys
sudo apt -y install rsync thunar-archive-plugin xarchiver xfce4-terminal synaptic curl wget p7zip-full unzip gparted

### fonts and spell checking
sudo apt -y install fonts-dejavu fonts-dejavu-extra fonts-droid-fallback fonts-freefont-ttf fonts-liberation fonts-noto-mono fonts-opensymbol ttf-bitstream-vera ttf-dejavu ttf-dejavu-core ttf-dejavu-extra ttf-mscorefonts-installer
sudo apt -y install aspell aspell-en hunspell hunspell-en-us mythes-en-us

sudo apt autoremove

echo "Altering sys using frain dots..."

#dots
cp -vaR dots/. ~

#programs
cd tmp 

## visual studio code from https://code.visualstudio.com/Download
sudo dpkg -i <code>.deb
sudo apt-get -y install -f

## papericons from https://snwh.org/paper/download
sudo dpkg -i paper*.deb
sudo apt-get -y install -f

## xfce theme from https://www.xfce-look.org/p/1016678/
tar zxf 90145-axiom.tar.gz
sudo cp -pr axis* /usr/share/themes/
rm -R axis*

cd ..

#bin and templates
cp -r bin ~/bin
cp -vaR Templates/. ~/Templates

#clean up
cd ..
rm -rf dotfiles
