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

# Software Updates 
 - choose fastest server
 
# Initial upgrade
sudo apt update 
sudo apt upgrade -y

============================================================================
# Gnome config
 - use 'gsettings list-recursively | grep bla'

# Changes pending
 - CAPS lock key behaviour - - Additional Layout options | CAPS lock behaviour | Make unmodified CAPS lock and additional Esc...
 - Automatic brightness disabled
 - keyboard brightness max
 - blank screen 10 mins
 - terminal shortcut T
 - close app shortcut Q

# Colour scheme
gsettings set org.gnome.gedit.preferences.editor scheme 'cobalt'

# Theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# Keyboard
#gsettings set org.gnome.desktop.input-sources xkb-options ['caps:escape_shifted_capslock']
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
gsettings set org.gnome.desktop.peripherals.keyboard delay 300

# Pointer
gsettings set org.gnome.desktop.interface locate-pointer true

# Weekday
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Titlebar
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'

# Night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 3700

# Battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Trackpad / mouse
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true # desktop uses mouse config for logitech

# Firefox
about:config
 - search for full-screen-api.warning.timeout and set the value from 3000 to 0
 - search for browser.ctrlTab.recentlyUsedOrder and set the value to false

=====================
# Software installs
=====================

# Build essentials
sudo apt install -y build-essential dkms linux-headers-$(uname -r)

# Restricted extras
sudo apt install -y ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi

# Install bits and pieces
sudo apt install -y vim vlc neofetch git htop stow synaptic curl mlocate iperf cifs-utils hardinfo tmux

# git SSH key
ssh-keygen -t rsa -b 4096 -C $(hostname) # or do via applet
 - import public key into github

====================
# laptop
====================
sudo apt install -y tlp gimp openvpn torbrowser-launcher blueman rclone rclone-browser telegram-desktop remmina firmware-misc-nonfre
 - others: exodus, syncient, signal-desktop, PlexAmp appimage from plex

====================
# desktop
====================
sudo apt install nvidia-detect sysfsutils openssh-server
sudo nvidia-detect
sudo apt install nvidia-driver
flatpak install -y com.leinardi.gwe # Nvidia Green with Envy

---------------------------------------------------------------------------------

# .dotfiles
git clone git@github.com:walchst/.dotfiles.git ~/.dotfiles
rm ~/.bashrc # conflicts with stow initially
stow -nvSt ~ alacritty bash git htop retroarch vim # error with README.MD, investigate how to exclude using *

# VIM specific
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 - open VIM and type :PluginInstall

# Configure Swappiness
sudo vim /etc/sysctl.conf
 - add the following to EOF and cat /proc/sys/vm/swappiness to confirm
vm.swappiness = 10

# keyboard Fn behaviour on Macbook
# https://help.ubuntu.com/community/AppleKeyboard#Change_Function_Key_behavior
echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
sudo reboot

====================
# desktop
====================
sudo apt install -y steam 

# fix nvidia libGL.so.1 fatal error failed to load steamui.so 
sudo apt install -y libgl1-nvidia-glvnd-glx:i386

# keyboard Fn behaviour for Logitech Wireless keyboard
- open Solaar and change Fn behaviour

# Emulation
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user -y flathub org.libretro.RetroArch
flatpak update --user org.libretro.RetroArch
sudo mkdir /mnt/roms
#sudo mount -t cifs -o username=walchst,uid=$(id -u),gid=$(id -g) //unraid/roms /mnt/roms
sudo vim /etc/fstab
# add the following
//unraid/roms /mnt/roms cifs username=roms,password=roms,vers=1.0,uid=1000,gid=1000 0 0
# remount
sudo mount -a # to mount without restart

# Bluetooth for XBox contollers
Add the following at the end of /etc/sysfs.conf
module/bluetooth/parameters/disable_ertm=1
 - restart required

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

========================
# Post clean-up
========================

# Clear out Gnome recommended software
sudo apt -y remove gnome-games libreoffice* rhythmbox cheese evolution transmission* xterm gnome-calendar gnome-contacts gnome-music gnome-todo gnome-sound-recorder gnome-maps totem*
sudo apt clean
sudo apt -y autoremove

========================================================

# Retroarch
Issue: Sound clipping, video jerky
Fix: Settings | Video | Syncronization | Sync to Exact Content Framerate )G-Sync, FreeSynd): On

Video: Vulkan

