# Set hostname
sudo hostnamectl set-hostname popbook

# Initial upgrade
sudo apt update 
sudo apt upgrade -y

# Enable disk write cache
- manually made via Disks applet # not req'd on gaming PC, SSD?

# Packages for any build
sudo apt install -y gnome-tweaks vim ubuntu-restricted-extras ubuntu-restricted-addons vlc neofetch git htop stow synaptic curl ranger alacritty mlocate iperf cifs-utils

# git SSH key
ssh-keygen -t rsa -b 4096 -C "walchst@gmail.com" # or do via applet

# .dotfiles
cd ~
git clone git@github.com:walchst/.dotfiles.git
cd .dotfiles
stow -nvSt ~ * # had to rm ~.bashrc

# VIM specific
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 - open VIM and type :PluginInstall

============================================================================
# Gnome config

# Changes pending
 - CAPS lock key behaviour - - Additional Layout options | CAPS lock behaviour | Make unmodified CAPS lock and additional Esc...
 - Automatic brightness?
 - keyboard brightness?

# Disable indenting - possibly remove, using alacritty
#gsettings set org.gnome.gedit.preferences.editor auto-indent false
# Colour scheme
#gsettings set org.gnome.gedit.preferences.editor scheme 'cobalt'

# Theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# Keyboard
#gsettings set org.gnome.desktop.input-sources xkb-options ['caps:escape_shifted_capslock']
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
gsettings set org.gnome.desktop.peripherals.keyboard delay 300

# Pointer
gsettings set org.gnome.desktop.interface locate-pointer true

# Trackpad
org.gnome.desktop.peripherals.touchpad natural-scroll true

# Weekday
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Titlebar
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'

# Night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 3700

# Battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Power settings for display
 - Settings, Power automatic brightness: disable
 - Settings, Power, blank screen: 10 mins

# Disable High DPI daemon
gsettings set com.system76.hidpi enable false

# Extensions for consideration
gnome-extensions disable pop-shell@system76.com
gnome-extensions disable desktop-icons@csoriano

# Firefox
about:config
Search for full-screen-api.warning.timeout and set the value from 3000 to 0
Search for browser.ctrlTab.recentlyUsedOrder and set the value to false

============================================================================

====================
# laptop
====================
sudo apt install -y gimp openvpn torbrowser-launcher blueman rclone rclone-browser telegram-desktop signal-desktop remmina
 - exodus, syncient, PlexAmp appimage from plex

# Plexamp
 - download manually - create shortcut to appimage file?

# keyboard Fn behaviour on Macbook
# https://help.ubuntu.com/community/AppleKeyboard#Change_Function_Key_behavior
echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
sudo reboot

====================
# Gaming
====================
sudo apt install -y steam sysfsutils openssh-server

# keyboard Fn behaviour for Logitech Wireless keyboard
- open Solaar and change Fn behaviour

# Emulation
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user -y flathub org.libretro.RetroArch
flatpak update --user org.libretro.RetroArch
sudo mkdir /mnt/roms
sudo mount –t cifs –o username=walchst //unraid/roms /mnt/roms

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

========================================================
bash history in case

sudo apt search synclient
synclient
synclient -l
synclient -v
synclient CoastingSpeed=60
syndaemon
synclient
snap
systemd
synclient
synclient VertScrollDelta=20 HorizScrollDelta=20
synclient
synclient VertScrollDelta=-20 HorizScrollDelta=20
synclient VertScrollDelta=-120 HorizScrollDelta=120
synclient VertScrollDelta=-320 HorizScrollDelta=320
sudo apt search gir1.2-clutter-1.0
sudo apt install gir1.2-clutter-1.0
sudo apt remove gir1.2-clutter-1.0
sudo apt search openvpn
openvpn
lspci -knn | grep Net -A3; lsusb
dmesg | grep -i blue
uname -r
snap list
apt serch tlp
sudo apt search tlp
sudo apt install tlp
sudo apt search remmina
snap search remmina
snap list
sudo apt search tor
sudo apt search tor-browser
sudo apt search tor | grep browser
sudo apt search tor
sudo apt search torbrow
sudo apt install torbrowser-launcher
sudo apt search exodus
guesture
gesture
sudo apt search gesture
sudo gpasswd -a $USER input 
sudo apt search libinput-g
sudo apt-get install xdotool wmctrl
sudo apt-get install libinput-tools
git clone https://github.com/bulletmark/libinput-gestures.git
sudo apt install git
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures/
sudo make install 
libinput-gestures-setup autostart
libinput-gestures-setup start
cd .config/
pactl list | grep -Pzo '.*bluez_card(.*\n)*'
pactl set-port-latency-offset bluez_card.08_DF_1F_53_AE_C0 speaker-output 50000
pactl
pactl list | grep -Pzo '.*bluez_card(.*\n)*'
pactl set-port-latency-offset bluez_card.08_DF_1F_53_AE_C0 headphone-output 50000
sudo service bluetooth restart
pactl list | grep -Pzo '.*bluez_card(.*\n)*'
sudo apt install blueman
pactl set-port-latency-offset bluez_card.08_DF_1F_53_AE_C0 headphone-output 0
sudo service bluetooth restart
screenfetch
sudo apt install screenfetch
screenfetch
htop
sudo apt search libinput
pactl list | grep -Pzo '.*bluez_card(.*\n)*'
sudo apt search pulse
htop
exit
shell
.
bash
zsh
sudo apt install zsh zsh-syntax-highlighting
wget https://github.com/ChrisTitusTech/zsh/raw/master/.zshrc -O ~/.zshrc
mkdir -p "$HOME/.zsh"
wget https://github.com/ChrisTitusTech/zsh/raw/master/.zsh/aliasrc -O ~/.zsh/aliasrc
zsh

=========================================================================================

bash history from gaming pc
bla blab lab
bla blab lab

sudo apt install gnome-tweaks
sudo apt update
sudo apt install steam
sudo apt install -y steam
sudo apt install xboxdrv
xboxdrv
sudo apt install -y vim
sudo vim /etc/modprobe.d/blacklist.conf 
sudo apt install sysfsutils 
sudo vim /etc/sysfs.conf 
sudo systemctl enable xboxdrv.service
xboxdrv
lsusb
sudo apt search bluetooth
sudo apt search bluetooth | more
/etc/init.d/bluetooth status
sudo systemctl enable xboxdrv.service
sudo vim /etc/sysfs.conf 
reboot
sudo apt install -y vlc
top
screenfetch
popfetch
sudo apt install screenfetch
screenfetch 
uname -a
cat /proc/sys/vm/swappiness 
sudo apt install -y ubuntu-restricted-extras ubuntu-restricted-addons 
zsh
sudo apt install -y zsh
zsh
sudo apt install -y python3 python3-gi python3-pyudev python3-evdev gettext meson appstream-util desktop-file-utils 
git
git clone https://github.com/berarma/oversteer.git
cd oversteer/
ls
meson build
ninja -C build
ninja -C build run
cd ~/.local/share
ls
reboot
htop
sudo apt install -y htop
htop
ps
top
cd ~
ls
cd .local/
ls
cd share/
dir
cd Steam/
ls
cd userdata/
ls
cd ..
cd userdata/
dir
cd 444766927/
ls
cd 421020/remote/
ls
cd \
cd "/home/walchst/.steam/debian-installation/steamapps/common/DiRT 4/share/udev"
ls
ls -a
sudo cp 99-fanatec-wheel-perms.rules /etc/udev/rules.d/
ls /etc/udev/rules.d/
sudo udevadm control --reload-rules && sudo udevadm trigger 
cd ~
ls
cat .bash_history 
sudo apt search solaar
ifconfig
cd ~
ls
pwd
git clone https://github.com/medusalix/xow.git
cd xow/
ls
cat README.md 
zsh
sudo apt search libusb-1.0.0-dev
sudo apt search libusb-1.0.0
sudo apt install libusb-1.0.0-dev
sudo apt install libusb-1.0-0-dev
sudo apt install libusb-1.0-0
ls
make BUILD=RELEASE
ls | grep xow
sudo make install
sudo systemctl start xow.service 
.xow
./xow 
sudo ./xow 
restart
ls
cd xow/
ls
./xow 
sudo systemctl enable xboxdrv.service
sudo vim /etc/sysfs.conf 


