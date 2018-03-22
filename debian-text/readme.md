1. [Install debian](https://github.com/frainfreeze/dotfiles/tree/master/debian#instalation)
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
 - vim so/4237817
