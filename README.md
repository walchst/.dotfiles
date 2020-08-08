# Initial upgrade

sudo apt update
sudo apt upgrade

# Packages for any build
sudo apt install -y gnome-tweaks vim ubuntu-restricted-extras ubuntu-restricted-addons vlc screenfetch git htop stow synaptic curl ranger

# git SSH key
ssh-keygen -t rsa -b 4096 -C "walchst@gmail.com"
ssh -T git@github.com

# .dotfiles
cd ~
git clone git@github.com:walchst/.dotfiles.git
cd .dotfiles
stow -nvSt ~ bash vim

# VIM specific
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 - open VIM and type :PluginInstall

====================
# laptop
====================
sudo apt install -y gimp openvpn tlp torbrowser-launcher blueman rclone rclone-browser telegram-desktop signal-desktop
 - exodus, syncient, PlexAmp appimage from plex

====================
# Gaming
====================
sudo apt install -y steam solaar sysfsutils openssh-server

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user -y flathub org.libretro.RetroArch
flatpak update --user org.libretro.RetroArch

Add the following at the end of /etc/sysfs.conf
module/bluetooth/parameters/disable_ertm=1
? xboxdrv

# Post installing Dirt 4
sudo cp ~/.steam/debian-installation/steamapps/common/DiRT 4/share/udev/99-fanatec-wheel-perms.rules /etc/udev/rules.d/
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
ls
cat /etc/libinput-gestures.conf 
sudo apt install gnome-software gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
snap list
snap remove gimp,remmina,telegram-desktop
snap remove gimp remmina telegram-desktop
flatpak
flatpack
flatpak
sudo atp search flatpak
sudo apt search flatpak
flatpak
sudo flatpak
locate
search
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak
sudo apt update
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak
ls
cd \bin
cd\
cd ls
dir
flatpal
flatpak
sudo apt search flatpak
sudo apt search flatpak | grep installed
flatpak
flat
flatpak 
flatpak search a
flatpal
flatpak
flatpak search telegram
flat install telegram
flatpak search telegram
flatpak search "telegram desktop"
flatpak search telegram desktop
flatpak search "Telegram desktop" org.telegram
flatpak list
flatpak -help
flatpak search remmina
flatpak install remmina
flatpak search telegram 
flatpak install telegram
flatpak install "telegram desktop"
flatpak search telegram 
flatpak install org.telegram
flatpak search gimp
flatpak install gimp
snap remove snap-store
snap
sudo vim /etc/modprobe.d/alsa-base.conf 
sudo apt update
sudo apt list --upgradable 
dmesg | grep -i blue
uname -a
sudo apt search gnome-software-packagekit-plugin
sudo apt search gnome-software-packagekit
sudo apt search gnome-software-packa
sudo apt search gnome-software-
htop
sudo apt install htop
htop
sudo vim /etc/modprobe.d/alsa-base.conf 
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


