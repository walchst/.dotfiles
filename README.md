
# Set hostname, not req'd part of install
#sudo hostnamectl set-hostname debook

# Update sudoers
su
vi /etc/sudoers
# duplicate %sudo line, replace with username 

# Reduce boot time
sudo vi /etc/default/grub
 - set GRUB_TIMEOUT to 0:
sudo update-grub

# Enable disk write cache (if physical)
- manually made via Disks applet # not req'd on gaming PC, SSD?

============================================================================

# Firefox
about:config
 - search for full-screen-api.warning.timeout and set the value from 3000 to 0
 - search for browser.ctrlTab.recentlyUsedOrder and set the value to false

# git SSH key
ssh-keygen -t rsa -b 4096 -C $(hostname) # or do via applet
 - import public key into github

---------------------------------------------------------------------------------

# VIM specific
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 - open VIM and type :PluginInstall

====================
# desktop
====================

# Emulation
sudo mkdir /mnt/roms
#sudo mount -t cifs -o username=walchst,uid=$(id -u),gid=$(id -g) //unraid/roms /mnt/roms
sudo vim /etc/fstab
# add the following
//unraid/roms /mnt/roms cifs username=roms,password=roms,vers=1.0,uid=1000,gid=1000 0 0
# remount
sudo mount -a # to mount without restart

# Xbox Wireless Controller (xow)
sudo apt install -y cabextract libusb-1.0-0-dev 
cd /usr/local
sudo git clone https://github.com/medusalix/xow
cd xow/
sudo make BUILD=RELEASE
sudo make install
sudo systemctl enable xow
sudo systemctl start xow
# may need restart, to pair
sudo systemctl kill -s SIGUSR1 xow

# Post installing Dirt 4
sudo cp /mnt/data/steam/steamapps/common/DiRT 4/share/udev/99-fanatec-wheel-perms.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && sudo udevadm trigger

# Clear out Gnome recommended software
sudo apt -y remove gnome-games libreoffice* rhythmbox cheese evolution transmission* xterm gnome-calendar gnome-contacts gnome-music gnome-todo gnome-sound-recorder gnome-maps totem*

========================================================
