## Linux Commands

## Fail2ban

install fail2ban

```sh
sudo apt install fail2ban
```

configure fail2ban

```sh
sudo systemctl enable fail2ban.service
```

buat file di /etc/fail2ban dengan nama jail.local

```bash
[sshd]
enable = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = 3600
ignoreip = 127.0.0.1
```

cek status fail2ban

```sh
fail2ban-client status
```

cek status fail2ban user

```sh
fail2ban-client status sshd
```

## Berjalan dilatar belakang dengan screen

buat nama session

```sh
screen -S <session_name>
```

buat lihat daftar session

```sh
screen -ls
```

masuk ke session

```sh
screen -r <id_session>
```

atau

```sh
screen -rd <id_session>
```

## cek linux header

```sh
apt-cache search linux-headers
```

## Connect Wifi with Commands

```sh
nmcli device wifi rescan
```

```sh
nmcli device wifi list
```

```sh
nmcli device connect <NamaSSID> password <DISINI PASSWORD>
```

## Clear Cache di Linux

Bersihkan hanya PageCache.

```sh
sudo sync; echo 1 > /proc/sys/vm/drop_caches
```

Bersihkan dentries and inodes.

```sh
sudo sync; echo 2 > /proc/sys/vm/drop_caches
```

Bersihakan PageCache, dentries and inodes.

```sh
sudo sync; echo 3 > /proc/sys/vm/drop_caches 
```

***Jalankan secara Otomatis***
Buat file dan di simpan dengan nama ```clearcache.sh``` :

```bash
#!/bin/bash
# Note, we are using "echo 3", but it is not recommended in production instead use "echo 1"
echo "echo 3 > /proc/sys/vm/drop_caches"
```

Kasih permission :

```sh
sudo chmod 755 clearcache.sh
```

```sh
sudo crontab -e
```

Tambahkan baris di bawah ini, simpan dan keluar untuk menjalankannya pukul 2 pagi setiap hari.

```bash
0  2  *  *  *  /path/to/clearcache.sh
```

## Menampilkan semua service yang berjalan / tidak

Menampilkan menggunakan ```service```

```sh
sudo service --status-all
```

Menampilkan  manggunakan ```systemctl```

```sh
sudo systemctl list-unit-files
```

```sh
sudo systemctl list-units --type service
```

Menampilkan menggunakan ```netstat```

```sh
sudo netstat -pnltu
```

Cara Lain Menggunakan tools :<br><br>
***systemd-cgtop***<br>

```sh
sudo systemd-cgtop
```

***chkservice***

```sh
sudo chkservice
```

## Cek Harddisk partitions


***fdisk***<br>
Fdisk adalah perintah yang paling umum digunakan untuk memeriksa partisi pada disk. Perintah fdisk dapat menampilkan partisi dan detail seperti tipe sistem file. Namun itu tidak melaporkan ukuran setiap partisi.

```sh
sudo fdisk -l
```

***parted***<br>
Parted adalah utilitas baris perintah lain untuk membuat daftar partisi dan memodifikasinya jika diperlukan.
Berikut adalah contoh yang mencantumkan detail partisi.

```sh
sudo parted -l
```

***df***<br>
Df bukan utilitas partisi, tetapi mencetak rincian tentang hanya sistem file yang dipasang. Daftar yang dihasilkan oleh df bahkan mencakup sistem file yang bukan partisi disk nyata.

```sh
df -h
```

Ingin menampilkan hanya sistem file yang dimulai dengan / dev

```sh
df -h | grep ^/dev
```

Untuk menampilkan partisi disk nyata bersama dengan tipe partisi, gunakan df seperti ini

```sh
df -h --output=source,fstype,size,used,avail,pcent,target -x tmpfs -x devtmpfs
```

***lsblk***<br>
Daftar semua blok penyimpanan, yang mencakup partisi disk dan drive optik. Rincian termasuk ukuran total partisi / blok dan titik pemasangan jika ada.
Tidak melaporkan ruang disk yang digunakan / kosong pada partisi.

```sh
lsblk
```

***blkid***<br>
Mencetak atribut perangkat blok (partisi dan media penyimpanan) seperti tipe uuid dan sistem file. Tidak melaporkan ruang di partisi.

```sh
sudo blkid
```

## Cek Capasitas Baterai

```sh
cat /sys/class/power_supply/BAT0/capacity
```

## Cek Kesehatan Baterai

```sh
sudo apt-get install smartmontools
```

```sh
sudo smartctl -a /dev/sda
```

```sh
sudo smartctl -a /dev/sda | grep "SMART overall-health self-assessment"
```

## Cara Memeriksa Available Network Interfaces, Associated IP Addresses, MAC Addresses, and Interface Speed on Linux

***IP command***<br>

```sh
sudo ip a
```

***ethtool Command***<br>

```sh
sudo ethtool eth0
```

Memeriksa Antarmuka Jaringan yang Tersedia di Linux Menggunakan Perintah IP

```sh
ip a |awk '/state UP/{print $2}'
```

Memeriksa Alamat IP Antarmuka Jaringan di Linux Menggunakan Perintah IP

```sh
ip -o a show | cut -d ' ' -f 2,7
```

or

```sh
ip a |grep -i inet | awk '{print $7, $2}'
```

Memeriksa Alamat MAC Kartu Antarmuka Jaringan di Linux Menggunakan Perintah IP

```sh
ip link show dev eth0 |awk '/link/{print $2}'
```

Memeriksa Kecepatan Port Antarmuka Jaringan di Linux Menggunakan Perintah ethtool

```sh
ethtool eth0 | grep "Speed:"
```

## Konfigurasi Linux

## Disable webcam.

cek list webcam

```sh
sudo lsmod | grep uvcvideo
```

```sh
sudo vi /etc/modprobe.d/blacklist-libnfc.conf 
```

```
blacklist uvcvideo
```

## Format FlashDisk Lewat Terminal

***Format FlashDisk Lewat Terminal***<br>
Cek dahulu letak flashdisk ada di device boot  mana :

```sh
sudo fdisk -l
```

Sebelum format unmount dulu semisal letak flashdisk saya di ```/dev/sdc1```:

```sh
sudo umount /dev/sdc1
```

Lalu format

```sh
sudo mkfs.vfat /dev/sdc1
```

## Remove snap dari ubuntu 18.04

Jalankan :

```sh
rm -rf ~/snap
```

```sh
sudo rm -rf /var/cache/snapd
```

```sh
sudo apt purge snapd
```

```sh
sudo apt-get update
```

jika ingin mengembalikan software yang diintall di snap menggunakan apt :

```sh
sudo apt-get install gnome-calculator gnome-characters gnome-logs gnome-system-monitor
```
## Remove snap dari ubuntu 22.04
jika ingin melihat list package yang diinstall di snap
```sh
snap list
```
menghentikan snap daemon
```sh
sudo systemctl disable snapd.service
```
```sh
sudo systemctl disable snapd.socket
```
```sh
sudo systemctl disable snapd.seeded.service
```
menghapus package list yang ada di snap
```sh
sudo snap remove firefox
```
```sh
sudo snap remove snap-store
```
```sh
sudo snap remove gtk-common-themes
```
```sh
sudo snap remove gnome-3-38-2004
```
```sh
sudo snap remove core18
```
```sh
sudo snap remove snapd-desktop-integration
```
purge snap
```sh
sudo apt autoremove --purge snapd
```
remove cache and folder snap
```sh
rm -rf ~/snap
```
```sh
sudo rm -rf /var/cache/snapd/
```
opsional jika mau reinstall firefox
buat file di lokasi path
```sh
sudo vim /etc/apt/preferences.d/firefox-no-snap
```
tambahkan script dibawah ini
```sh
Package: firefox*
Pin: release o=Ubuntu*
Pin-Priority: -1
```
Tambahkkan ppa dan lakukan installasi firefox
```sh
sudo add-apt-repository ppa:mozillateam/ppa
```
```sh
sudo apt update
```
```sh
sudo apt install firefox
```
## Set Default Nautilus

```sh
xdg-mime default nautilus.desktop inode/directory application/x-gnome-saved-search
```

## Cron Job

Untuk Arch Linux

```sh
pacman -Syu cronie
```

Perintah dibawah ini jika ingin mengaktifkan ketika boot dijalankan

```sh
systemctl enable --now cronie.service
```

Untuk mengecek status cron

```sh
systemctl status cronie.service
```

## IP Static

ubuntu 20.04

```sh
sudo vi  /etc/netplan/00-installer-config.yaml
```

edit seperti ini menyeseuaikan

```yaml
network:
   ethernets:
        enp0s3:
                dhcp4: no
                addresses: [192.168.xx.xx/24]
                gateway4: 192.168.xx.xx
                nameservers:
                        addresses: [8.8.8.8,192.168.xx.xx]

```

simpan lalu jalankan

```sh
sudo netplan try
```

command ini untuk testing

```sh
sudo netplan generate
```

command ini untuk generate config files

```sh
sudo netplan apply
```

command ini untuk apply config jika sudah tidak ada error jalankan command dibawah ini

```sh
reboot
```

## Change IP

```sh
sudo ifconfig eth0 192.168.xx.xx netmask 255.255.255.0
```

## Add Gateway

```sh
route add default gw 192.168.x.x eth0
```

## Remove Gateway

```sh
route delete default gw 192.168.xx.xx eth0
```

## Install OpenVpn Server

Cek Ip address

```sh
dig +short myip.opendns.com @resolver1.opendns.com
```

Install OpenVpn pada ubuntu

```sh
sudo apt install curl
```

```sh
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
```

```sh
sudo chmod +x openvpn-install.sh
```

```sh
sudo bash openvpn-install.sh
```

Cek ip dan port pada openvpn

```sh
sudo ss -tupln | grep openvpn
```

```sh
ip add
```

## Change bash to fish

```sh
sudo apt install fish
```

```sh
chsh -s /usr/bin/fish
```

untuk konfigurasi 

```sh
mkdir -p ~/.config/fish
```

```sh
touch ~/.config/fish/config.fish
```

## Config Fish

```sh
curl -L https://get.oh-my.fish | fish
```

```sh
curl -L https://get.oh-my.fish > install
```

```sh
fish install --path=~/.local/share/omf --config=~/.config/omf
```

Untuk lebih lengkapnya bisa dicek di link dibawah ini

```sh
https://github.com/oh-my-fish/oh-my-fish
```

## Export Inkscape to AI

Install

```sh
sudo curl 'https://langitketujuh.id/sh/l7-export' | sudo bash
```

```sh
sudo l7-export --install
```

## Edit Background grub

```sh
sudo vi /etc/default/grub
```

Tambahkan text dibawah ini

```
GRUB_BACKGROUND="/usr/share/backgrounds/sun.png"
```
```sh
sudo update-grub
```

cara pakai
langkah pertama cari id file
  - Masuk Inkscape
  - Object-> Object Properties

```sh
l7-export <nama-file.svg> <id-file>
```

## Buka Web Blokir

```sh
yay -S cloudflare-warp-bin
```

```sh
sudo systemctl start warp-svc
```

```sh
warp-cli register
```

```sh
warp-cli status
```

```sh
warp-cli connect
```

```sh
warp-cli enable-always-on
```

link referensi : https://developers.cloudflare.com/warp-client/get-started/linux/

## Linux Hostpot wifi

link referensi : https://github.com/lakinduakash/linux-wifi-hotspot

##### Downgrade linux-lts back to 5.10 on Arch Linux/Manjaro from 5.15

```sh
sudo vi /etc/pacman.conf
```

edit menjadi

```bash
IgnorePkg   = linux-lts
IgnorePkg   = linux-lts-headers
```

simpan lalu kelar dari text editor lalu jalankan:

```sh
sudo pacman -U https://archive.archlinux.org/packages/l/linux-lts/linux-lts-5.10.90-1-x86_64.pkg.tar.zst
```

```sh
sudo pacman -U https://archive.archlinux.org/packages/l/linux-lts-headers/linux-lts-5.10.90-1-x86_64.pkg.tar.zst
```

lalu reboot

## USB Mobile tidak tampil

https://wiki.archlinux.org/title/File_manager_functionality#Mounting

## Linux connect cloud

```sh
sudo pacman -S gnome-shell nautilus gnome-tweak-tool gn
```
```sh
gnome-control-center xdg-user-dirs gdm gvfs-google gvfs-goa
```

## Resize Video

Baris perintah di bawah ini akan membantu mengubah ukuran resolusi video dari 1920 X 1080 piksel menjadi 640 X 360 piksel.

```sh
ffmpeg -i <video_1920.mp4> -vf scale=640:360 <video_640.mp4> -hide_banner
```

Jika tampilan video perlu diubah, setdar dapat digunakan sebagai filter tambahan. Misalnya, dalam situasi di atas, jika Anda ingin mengubah rasio aspek dari 16:9 menjadi 4:3, berikut adalah perintahnya.

```sh
ffmpeg -i <video_1920.mp4> -vf scale=640:480,setdar=4:3 <video_640x480.mp4> -hide_banner
```
#### File Transfer dengan SCP

mengirimkan dari lokal ke server

```sh
scp namafile ubuntu@IPSERVER:/pathFolder
```

## Multi Window pada Server dengan Screen

menampilkan list screen

```sh
screen -ls
```

membuat session baru

```sh
screen -S <nama-session>
```

pindah window screen

```sh
screen -r <ID>
```

untuk pindah screen dengan shortcut<br>

```sh
Ctrl a n: move to next window
Ctrl a p: move to previous window
```

Kill a session from within it

```sh
Ctrl + a + k
```

New Windows Session from within screen

```sh
Ctrl + a + c
```

List all windows in a session

```sh
Ctrl + a + w
```

## SSH tanpa password

```sh
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
```

```sh
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

```sh
chmod 0600 ~/.ssh/authorized_keys
```

## Sharing Folder virtualbox di ubuntu server

```sh
sudo apt update
```

```sh
sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
```

```sh
sudo reboot
```

```sh
sudo mkdir /mnt/shared
```

```sh
sudo mount -t vboxsf <shared_folder_name> /mnt/shared
```

## Check Enable systemd service

```sh
sudo systemctl list-unit-files | grep enabled
```

## Configurasi Bahasa Pemograman di Linux

## Configure java version

untuk debian

```sh
sudo update-alternatives --config javac
```

untuk arch linux

```sh
archlinux-java status
```

```sh
sudo archlinux-java set java-18-openjdk
```

## Buat Project Maven

```sh
mvn -B archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4
```
https://maven.apache.org/guides/getting-started/

## Install Kotlin

```sh
curl -s https://get.sdkman.io | bash
```

```sh
source "/home/hard/.sdkman/bin/sdkman-init.sh"
```

```sh
sdk install kotlin
```

## JSON Satu Baris

```sh
cat <nama-file.json> | jq -c '.[]'  >> <output-file.json>
```

## Rename wlp2s0 to wlan0 in ubuntu

```sh
sudo vi /etc/default/grub
```

Edit Dari

```bash
GRUB_CMDLINE_LINUX=""
```

ke 

```bash
GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"
```

Simpan lalu keluar

```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## Arch Linux

## Install Arch

untuk install divirtualbox jenis partitionnya pilih dos<br>
cek Mode UEFI

```sh
ls /sys/firmware/efi/efivars/
```

Jika Tampil maka mode yang dipakai laptop adalah mode UEFI
Selanjutnya sambungkan laptop dengan connecting internet dibawah ini langkah untuk sambungkan ke internet

```sh
iwctl
```

untuk cek list wifi

```sh
device list
```

lihat detail wlan0

```sh
device wlan0 show
```

melakukan scan wifi

```sh
station wlan0 scan
```

menampilkan wifi

```sh
station wlan0 show
```

melihat nama wifi

```sh
station wlan0 get-networks
```

cara connect ke jaringan wifi

```sh
station wlan0 connect "Nama wifi"
```

melihat apakah sudah terkoneksi atau belum pakai perintah

```sh
device wlan0 show
```

selanjutnya jika sudah terkoneksi lalu cek partition
cek posisi partisi

```sh
fdisk -l
```

membuat partisi

```sh
cfdisk /dev/sda
```

membuat partisi untuk UEFI

```sh
mkfs.fat -F32 /dev/sda1
```

membuat partisi untuk home/root

```sh
mkfs.ext4 /dev/sda3
```

membuat partisi untuk swap

```sh
mkswap /dev/sda2
```

selanjutnya mount partisi home

```sh
mount /dev/sda3 /mnt
```

```sh
mkdir /mnt/efi
```

mount partisi UEFI

```sh
mount /dev/sda1 /mnt/efi
```

mount swapnya

```sh
swapon /dev/sda2
```

install software" yang dibutuhkan

```sh
pacstrap /mnt base linux linux-firmware net-tools networkmanager openssh vim
```

jika sudah selesai installnya selanjutnya buat fstab

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

melihat isi fstab/partisi

```sh
cat /mnt/etc/fstab
```

masuk ke archnya

```sh
arch-chroot /mnt
```

setting bahasa

```sh
vim /etc/locale.gen
```

hapus # sehingga menjadi

```bash
en_US.UTF-8 UTF-8
```

selanjutnya generate bahasa yang sudah dipilih

```sh
locale-gen
```

```bash
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

setting time zone

```sh
ls /usr/share/zoneinfo
```

```sh
ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
```

```sh
hwclock --systohc  --utc
```

membuat hostname

```sh
echo "hard" > /etc/hostname
```

membuat password untuk user root

```sh
passwd
```

install untuk kebutuhan boot jika non-UEFI tidak perlu install efibootmgr

```sh
pacman -S grub efibootmgr
```

jika menggunakan bios tidak perlu install efibootmgrnya

```sh
grub-install --efi-directory=/efi
```

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

jika divirtualbox

```sh
grub-install /dev/sda
```

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

```sh
exit
```

command reboot untuk install non-virtualbox

```sh
reboot
```

untuk install divirtualbox ketikkan command berikut

```sh
exit
```

```sh
shutdown -h now
```

untuk login usernya pakai root
setelah berhasil login cek upgrade terbaru dengan ketik command

```sh
pacman -Syyu
```

Lalukan ini jika tidak ada koneksi internet

```sh
sudo systemctl enable NetworkManager.service
```

```sh
sudo systemctl start NetworkManager.service
```

membuat user
Perintah ini tidak membuatkan directory otomatis

```sh
useradd <nama-user>
```

untuk mengatasi maka gunakan flag -m

```sh
useradd -m <nama-user>
```

“-G” untuk menentukan grup mana yang akan didaftarkan.

```sh
useradd -G wheel,storage,power -m NamaUser
```

```sh
passwd <nama-user>
```

```sh
pacman -S sudo
```

```sh
vim /etc/sudoers
```

cari perintah # %Wheel ALL=(ALL) ALL hilangkan tanda # sehingga

```bash
%wheel ALL=(ALL) ALL
```

## Install yay

```sh
sudo pacman -S --needed base-devel git
```

```sh
git clone https://aur.archlinux.org/yay.git
```

```sh
cd yay
```

```sh
makepkg -si
```

## Pacman dan Yay remove

hapus packages

```sh
sudo pacman -R <nama packages>
```

hapus tanpa dependency

```sh
sudo pacman -Rsdd <nama packages>
```

## Install AUR

```sh
sudo pacman -S git base-devel
```

tuliskan automasi di bawah ini di .bashrc

```sh
ayy() { git clone https://aur.archlinux.org/$1.git && cd $1 && makepkg --noconfirm -isc && cd .. && rm -rf $1 ;}
```

## Arch install ntfs support

```sh
sudo pacman -Syu 
```

```sh
sudo pacman -S ntfs-3g
```

## Troubleshooting Wifi

```sh
sudo pacman -S network-manager-applet
```

## Optimalkan SSD

## Aktikan TRIM dan kurangi WRITE

TRIM memastikan bahwa ketika sistem operasi ingin menulis di sektor yang sama, data lama akan dihapus sepenuhnya tanpa sampah. Ini berjalan pada minimal kernel linux 3.8 atau lebih baru, dan menggunakan ext4 atau filesystem yang mendukung TRIM lainnya.
https://wiki.archlinux.org/index.php/Solid_state_drive#TRIM
Pastikan SSD anda mendukung untuk memverifikasi dukungan TRIM, jalankan:

```sh
lsblk --discard
```

Dan periksa nilai-nilai DISC-GRAN (discard granularity) dan DISC-MAX (discard max bytes) kolom. Nilai bukan nol menunjukkan dukungan TRIM.
Atau, instal paket hdparm dan jalankan:

```sh
sudo hdparm -I /dev/sda | grep TRIM
```

jika mendukung maka lanjutkan

```sh
sudo vi /etc/fstab
```

## Add noatime to fstab

Tambahkan flag discard ke partisi root dan flag noatime ke masing-masing partisi yang berada di SSD.
Tambahkan juga

```bash
tmpfs   /tmp            tmpfs   defaults,noatime,mode=1777      0 0
tmpfs   /var/log        tmpfs   defaults,noatime,mode=0755      0 0
tmpfs   /var/spool      tmpfs   defaults,noatime,mode=1777      0 0
tmpfs   /var/tmp        tmpfs   defaults,noatime,mode=1777      0 0
```

```sh
sudo systemctl reboot
```

## Jalankan fstrim secara berkala
## Menggunakan cron

buat  cron mingguan /etc/cron.weekly/fstrim. Jika tidak, buat sendiri

```sh
sudo vi /etc/cron.weekly/fstrim
```

tambahkan

```bash
#!/bin/sh
# trim all mounted file systems which support it
/sbin/fstrim --all || true
```

## Menggunakan systemctl

```sh
sudo systemctl enable fstrim.timer
```

```sh
sudo systemctl start fstrim.service
```

```sh
sudo systemctl start fstrim.timer
```

## Kurangi penggunaan swap

```sh
sudo vi /etc/sysctl.conf
```

tambahkan (ubuntu dan debian)

```bash
vm.swappiness=1
vm.vfs_cache_pressure=50
```

```sh
sudo systemctl reboot
```

## Software Install
## Install Barcode to PC

```sh
sudo apt install libavahi-compat-libdnssd1 libnss-mdns avahi-daemon avahi-discover -y
```

lalu kunjungi https://barcodetopc.com/

## Install cfiles 

cfiles – Manajer File Terminal Cepat dengan Vim Keybindings

```sh
sudo apt-get install libncurses5-dev
```

```sh
make
```

```sh
sudo make install
```

## Problem di Linux

## Linux mengalami hang

Jalankan tekan bersamaan:

```sh
Ctrl+shift+alt+prntsrc+R+E+I+S+U+B
```

## Keyboard Tidak Terdeteksi test on Xubuntu 18.04

Jalankan:

```sh
sudo apt install xserver-xorg-input-all
```

## Problem Kali Linux

## Langkah pertama

```sh
sudo apt install apt-transport-https
```

```sh
sudo apt update
```

## Repository Kali Linux

cek ```/etc/apt/sources.list```

```
deb http://http.kali.org/kali kali-rolling main non-free contrib
```

```sh
sudo apt update
```

info lebih lengkap cek link dibawah ini https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/

## Date fix kali linux

```sh
timedatectl
```

```sh
timedatectl list-timezones | grep Asia
```

```sh
timedatectl set-timezone Asia/Jakarta
```

## Install wine kali linux

```sh
sudo dpkg --add-architecture i386
```

```sh
sudo apt-get update
```

```sh
sudo apt-get install wine32
```

Untuk Install Office :

```
WINEPREFIX=~/.wine/office2007 WINEARCH=win32 winecfg
```

```sh
sudo apt install winbind cabextract
```

```sh
wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
```

```sh
chmod +x winetricks
```

```sh
sudo cp winetricks /usr/local/bin/
```

```sh
sudo apt install zenity
```

```
WINEPREFIX=~/.wine/office2007 WINEARCH=win32 winetricks 
```

Configure didalamnya
1. Select the default wineprefix
2. Install a Windows DLL or component
3. msxml6, cek apakah msxml6 sudah terinstall atau jika belum tambahkan

```
WINEPREFIX=~/.wine/office2007 WINEARCH=win32 winetricks msxml6
```

untuk instal office 

```
WINEPREFIX=~/.wine/office2007 WINEARCH=win32 wine ./Microsoft-Office-Professional-2007.exe 
```

## Install Wine Ubuntu

```sh
apt-cache policy wine64
```

Sebelum Anda dapat menginstal Wine di Ubuntu 20.04, Anda harus mengaktifkan dukungan sistem 32-bit.

```sh
sudo dpkg --add-architecture i386
```

Anda sekarang dapat menginstal Wine di Ubuntu 20.04 dengan menjalankan perintah di bawah ini;

```sh
sudo apt update
```

```sh
sudo apt install wine64
```

Verifikasi Instalasi Anggur

```sh
wine --version
```

Reboot System

```sh
sudo systemctl reboot
```

## Install Disk Mounter

```sh
sudo apt-get install gnome-disk-utility
```

## Install zoom

donwnload file deb disini https://zoom.us/download?os=linux langkah selanjutnya:

```sh
sudo dpkg -i zoom_amd64.deb
```

langkah selanjutkan update repository

```sh
sudo vi /etc/apt/sources.list
```

```sh
sudo apt update
```

## Install TigerVNC di ubuntu

```sh
sudo apt-get install libfltk1.3-dev 
```

download file .deb di sini https://github.com/TigerVNC/tigervnc/releases lalu ketikan di terminal

```sh
sudo dpkg -i xtigervncviewer_1.12.0-1ubuntu1_amd64.deb 
```

```sh
xtigervncviewer
```

## Install Virtualbox di kali linux

```sh
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
```

```sh
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian buster contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
```

```sh
sudo apt update
```

```sh
sudo apt install -y dkms virtualbox virtualbox-ext-pack
```

Jalankan

```sh
virtualbox
```

info lebih https://www.kali.org/docs/virtualization/install-virtualbox-kali-host/

## Install Spotify

```sh
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
```
```sh 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
```
```sh
sudo apt-get update && sudo apt-get install spotify-client
```

## Install Scrcpy

```sh
sudo apt install scrcpy
```

## Install Postman
```sh
cd Downloads/
```

```sh
tar -xzf Postman-linux-x64-7.32.0.tar.gz
```

```sh
sudo mkdir -p /opt/apps/
```

```sh
sudo mv Postman /opt/apps/
```

```sh
sudo ln -s /opt/apps/Postman/Postman /usr/local/bin/postman
```

```sh
postman
```

```sh
sudo vim /usr/share/applications/postman.desktop
```

```bash
[Desktop Entry]
Type=Application
Name=Postman
Icon=/opt/apps/Postman/app/resources/app/assets/icon.png
Exec="/opt/apps/Postman/Postman"
Comment=Postman Desktop App
Categories=Development;Code;
```

## Install Libreoffice

Kunjungi link dibawah ini terus download filenya https://www.libreoffice.org/download/download/ jika sudah extrak file yang udah didownload tadi lalu masuk ke folder hasil extrakannya lalu ke folder DEBS

```sh
../libreoffice*/DEBS/
```

lalu masuk ke terminal arahkan path folder seperti path diatas atau didalam folder DEB jika sudah ketikan :

```sh
sudo dpkg -i *.deb
```

## Uninstall Libreoffice

```sh
sudo apt purge libreoffice7.0*
```

jika diatas tidak berhasil coba :

```sh
sudo dpkg --purge libreoffice*
```

## Install Inkscape

Saya disini pakai yang portable sebelumnya kunjungi link dibawah ini dan download file yang appimage https://inkscape.org/release/inkscape-dev/?latest=1
```sh
sudo vim /usr/share/applications/inkscape.desktop
```
```bash
[Desktop Entry]
Type=Application
Name=Inkscape
Icon=/home/hard/Downloads/Inkscape/inkscape.svg
Terminal=false
Exec=/home/hard/Inkscape/Inkscape-3bf5ae0-x86_64.AppImage
Comment=Inkscape 
Categories=Graphics;2DGraphics;RasterGraphics;GTK;
```

## Uninstall Inkscape

```sh
sudo apt purge inkscape
```

## Install Blender

Kunjungi link dibawah ini lalu download dan extrack https://docs.blender.org/manual/en/latest/getting_started/installing/linux.html hasil compress dipindahkan di **user/local/bin** lalu ketikan di terminal
```sh
sudo ln -s /usr/local/blender-2.93.4-linux-x64/blender /usr/local/bin/
```

jika blender tidak muncul dishortcut lalu kan dibawah ini : 

```sh
sudo cp blender.desktop /usr/share/applications/
```

lokasikan pathnya di folder yang aktif

## Error virtualbox
## Kernel driver not installed (rc=-1908)
```sh
sudo apt update
```

```sh
sudo apt install --reinstall linux-headers-$(uname -r) virtualbox-dkms dkms
```

```sh
sudo modprobe vboxdrv
```

## Virtualbox shared folder permission

untuk ubuntu

```sh
sudo adduser $USER vboxsf
```

untuk suse

```sh
sudo usermod --append --groups vboxsf $USER
```

untuk arch Masuk menu virtualbox cari
1. Device > Insert Guest Adittions CD Image...
2. Masuk ke directory hasil installan Guest tadi
```sh
sudo ./VBoxLinuxAdditions.run
```

```sh
sudo pacman -S linux-headers virtualbox-guest-utils
```

```sh
sudo systemctl enable vboxservice
```

lalu reboot

```sh
useradd -m -G vboxsf hard
```

```sh
sudo chown -R hard:users /media/sf_Public/
```

## Shortcuts Android Studio

```sh
sudo vim /usr/share/applications/android-studio.desktop
```

```bash
[Desktop Entry]
Type=Application
Name=Android Studio
Icon=/usr/local/android-studio/bin/studio.png
Terminal=false
Exec=mate-terminal -e "bash -c 'sudo bash /usr/local/android-studio/bin/studio.sh;'"
Comment=Android Studio Desktop App
Categories=Development;Code;
``` 

## Shortcuts Web Server Localhost

```sh
sudo vim /usr/share/applications/android-studio.desktop
```

```bash
[Desktop Entry]
Type=Application
Name=Localhost
Icon=/var/www/html/logo.png
Terminal=true
Exec=firefox http://localhost
Comment=Web Server Local
Categories=Development;Code;
```

## Install Telegram desktop

```sh
sudo apt-get install telegram-desktop
```

## Fix GNUStep

Problem :

```
The following packages have unmet dependencies:
 gnustep-base-runtime : Depends: gnustep-base-common (= 1.27.0-3) but 1.26.0-7 is to be installed
 libgnustep-base1.27 : Depends: gnustep-base-common (= 1.27.0-3) but 1.26.0-7 is to be installed
E: Broken packages
```

Perbaikan :

```sh
sudo apt-get autoclean
```

```sh
sudo apt-get -f install
```

```sh
sudo dpkg --configure -a
```

```sh
sudo apt-get -f install
```

```sh
sudo apt-get update
```

```sh
sudo apt-get upgrade
```

```sh
sudo apt-get full-upgrade
```

## Fix libpangox-1.0.so.0

problem :

```bash
anydesk: error while loading shared libraries: libpangox-1.0.so.0: cannot open shared object file: No such file or directory
```

Perbaikan :

```sh
sudo apt-get install -y libpangox-1.0-0
```

## Terima Kasih
