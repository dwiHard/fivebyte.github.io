# Tips dan Triks Linux 
> Disusun oleh Hardiyanto

### Daftar isi
* [Linux Commands](#linux-commands)
    * [Cek Linux header](#cek-linux-header)
    * [Fail2ban](#fail2ban)
    * [Berjalan dilatar belakang dengan screen](#berjalan-dilatar-belakang-dengan-screen)
    * [Connect Wifi with Commands](#connect-wifi-with-commands)
    * [Clear Cache di Linux](#clear-cache-di-linux)
    * [Menampilkan semua service yang berjalan / tidak](#menampilkan-semua-service-yang-berjalan-tidak)
    * [Cek Harddisk partitions](#cek-harddisk-partitions)
    * [Cara Memeriksa Available Network Interfaces, Associated IP Addresses, MAC Addresses, and Interface Speed on Linux](#cara-memeriksa-available-network-interfaces-associated-ip-addresses-mac-addresses-and-interface-speed-on-linux)
* [Konfigurasi Linux](#konfigurasi-linux)
    * [Disable webcam](#disable-webcam)
    * [Format FlashDisk Lewat Terminal](#format-flashdisk-lewat-terminal)
    * [Remove snap dari ubuntu 18.04](#remove-snap-dari-ubuntu-1804)
    * [Install OpenVpn Server](#install-openvpn-server)
    * [Change bash to fish](#change-bash-to-fish)
    * [Config Fish](#config-fish)
    * [Export Inkscape to AI](#export-inkscape-to-ai)
* [Konfigurasi Bahasa Pemograman di Linux](#configurasi-bahasa-pemograman-di-linux)
    * [Configure Java](#configure-java-version)
    * [Install Kotlin](#install-kotlin)
* [Optimalkan SSD](#optimalkan-ssd)
	* [Aktikan TRIM dan kurangi WRITE](#aktikan-trim-dan-kurangi-write)
	* [Add noatime to fstab](#add-noatime-to-fstab)
	* [Kurangi penggunaan swap](#kurangi-penggunaan-swap)
	* [Jalankan fstrim secara berkala](#jalankan-fstrim-secara-berkala)
	* [Kurangi penggunaan swap](#kurangi-penggunaan-swap)
* [Problem di Linux](#problem-di-linux) 
    * [Linux Mengalami hang](#linux-mengalami-hang)
    * [Keyboard Tidak Terdeteksi test on Xubuntu 18.04](#keyboard-tidak-terdeteksi-test-on-xubuntu-1804)
* [Problem Kali Linux](#problem-kali-linux)
    * [Repository Kali Linux](#repository-kali-linux)
    * [Date fix kali linux](#date-fix-kali-linux)
    * [Install wine kali linux](#install-wine-kali-linux)
    * [Install Disk Mounter](#install-disk-mounter)
    * [Install Telegram desktop](#install-telegram-desktop)
    * [Install Virtualbox di kali linux](#install-virtualbox-di-kali-linux)
    * [Install Spotify](#install-spotify)
    * [Install Scrcpy](#install-scrcpy)
    * [Install Postman](#install-postman)
    * [Install Libreoffice](#install-libreoffice)
    * [Uninstall Libreoffice](#uninstall-libreoffice)
    * [Install Inkscape](#install-inkscape)
    * [Uninstall Inkscape](#uninstall-inkscape)
    * [Install Blender](#install-blender)
    * [Error virtualbox](#error-virtualbox)
    	* [Kernel driver not installed (rc=-1908)](#kernel-driver-not-installed-rc-1908)
    * [Shortcuts Android Studio](#shortcuts-android-studio)
    * [Shortcuts Web Server Localhost]($shortcuts-server-web-localhost)
    * [Fix GNUStep](#fix-gnustep)
    * [Fix libpangox-1.0.so.0](#fix-libpangox-10so0)
* [Kumpulan Konfigurasi](https://gitlab.com/dwiHard/LinuxAdministration/-/blob/master/LinuxConfigBackup/MyConfig.md#kumpulan-configuration)


### Linux Commands

#### Fail2ban
install fail2ban
```
$ sudo apt install fail2ban
```
configure fail2ban
```
$ sudo systemctl enable fail2ban.service
```
buat file di /etc/fail2ban dengan nama jail.local
```
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
```
# fail2ban-client status
```
cek status fail2ban user
```
# fail2ban-client status sshd
```

#### Berjalan dilatar belakang dengan screen
buat nama session
```
$ screen -S session_name
```
buat lihat daftar session
```
$ screen -ls
```
masuk ke session
```
$ screen -r id_session
```
atau
```
$ screen -rd id_session
```

#### cek linux header
```
$ apt-cache search linux-headers
```

#### Connect Wifi with Commands
```
$ nmcli device wifi rescan
```
```
$ nmcli device wifi list
```
```
$ nmcli device connect NamaSSID password DISINI PASSWORD
```

#### Clear Cache di Linux

Bersihkan hanya PageCache.
```
# sync; echo 1 > /proc/sys/vm/drop_caches
```

Bersihkan dentries and inodes.
```
# sync; echo 2 > /proc/sys/vm/drop_caches
```

Bersihakan PageCache, dentries and inodes.
```
# sync; echo 3 > /proc/sys/vm/drop_caches 
```

***Jalankan secara Otomatis***
Buat file dan di simpan dengan nama ```clearcache.sh``` :
```
#!/bin/bash
# Note, we are using "echo 3", but it is not recommended in production instead use "echo 1"
echo "echo 3 > /proc/sys/vm/drop_caches"
```
Kasih permission :
```
# chmod 755 clearcache.sh
```
```
# crontab -e
```
Tambahkan baris di bawah ini, simpan dan keluar untuk menjalankannya pukul 2 pagi setiap hari.
```
0  2  *  *  *  /path/to/clearcache.sh
```

#### Menampilkan semua service yang berjalan / tidak
Menampilkan menggunakan ```service```
```
$ sudo service --status-all
```

Menampilkan  manggunakan ```systemctl```
```
$ sudo systemctl list-unit-files
```
```
$ sudo systemctl list-units --type service
```

Menampilkan menggunakan ```netstat```
```
$ sudo netstat -pnltu
```
Cara Lain Menggunakan tools :<br><br>
***systemd-cgtop***<br>
```
$ sudo systemd-cgtop
```
***chkservice***
```
$ sudo chkservice
```

#### Cek Harddisk partitions


***fdisk***<br>
Fdisk adalah perintah yang paling umum digunakan untuk memeriksa partisi pada disk. Perintah fdisk dapat menampilkan partisi dan detail seperti tipe sistem file. Namun itu tidak melaporkan ukuran setiap partisi.
```
$ sudo fdisk -l
```

***parted***<br>
Parted adalah utilitas baris perintah lain untuk membuat daftar partisi dan memodifikasinya jika diperlukan.
Berikut adalah contoh yang mencantumkan detail partisi.
```
$ sudo parted -l
```

***df***<br>
Df bukan utilitas partisi, tetapi mencetak rincian tentang hanya sistem file yang dipasang. Daftar yang dihasilkan oleh df bahkan mencakup sistem file yang bukan partisi disk nyata.
```
$ df -h
```
Ingin menampilkan hanya sistem file yang dimulai dengan / dev
```
$ df -h | grep ^/dev
```
Untuk menampilkan partisi disk nyata bersama dengan tipe partisi, gunakan df seperti ini
```
$ df -h --output=source,fstype,size,used,avail,pcent,target -x tmpfs -x devtmpfs
```
***lsblk***<br>
Daftar semua blok penyimpanan, yang mencakup partisi disk dan drive optik. Rincian termasuk ukuran total partisi / blok dan titik pemasangan jika ada.
Tidak melaporkan ruang disk yang digunakan / kosong pada partisi.
```
$ lsblk
```
***blkid***<br>
Mencetak atribut perangkat blok (partisi dan media penyimpanan) seperti tipe uuid dan sistem file. Tidak melaporkan ruang di partisi.
```
$ sudo blkid
```

#### Cara Memeriksa Available Network Interfaces, Associated IP Addresses, MAC Addresses, and Interface Speed on Linux
***IP command***<br>
```
# ip a
```
***ethtool Command***<br>
```
# ethtool eth0
```
Memeriksa Antarmuka Jaringan yang Tersedia di Linux Menggunakan Perintah IP
```
$ ip a |awk '/state UP/{print $2}'
```
Memeriksa Alamat IP Antarmuka Jaringan di Linux Menggunakan Perintah IP
```
$ ip -o a show | cut -d ' ' -f 2,7
```
or
```
$ ip a |grep -i inet | awk '{print $7, $2}'
```
Memeriksa Alamat MAC Kartu Antarmuka Jaringan di Linux Menggunakan Perintah IP
```
$ ip link show dev eth0 |awk '/link/{print $2}'
```
Memeriksa Kecepatan Port Antarmuka Jaringan di Linux Menggunakan Perintah ethtool
```
$ ethtool eth0 | grep "Speed:"
```
### Konfigurasi Linux

#### Disable webcam.
cek list webcam
```
$ sudo lsmod | grep uvcvideo
```
```
$ vi /etc/modprobe.d/blacklist-libnfc.conf 
```

```
blacklist uvcvideo
```

#### Format FlashDisk Lewat Terminal
***Format FlashDisk Lewat Terminal***<br>
Cek dahulu letak flashdisk ada di device boot  mana :
```
$ sudo fdisk -l
```
Sebelum format unmount dulu semisal letak flashdisk saya di ```/dev/sdc1```:
```
$ sudo umount /dev/sdc1
```
Lalu format
```
$ sudo mkfs.vfat /dev/sdc1
```

#### Remove snap dari ubuntu 18.04

Jalankan :
```
 $ rm -rf ~/snap
```
```
$ sudo rm -rf /var/cache/snapd
```
```
$ sudo apt purge snapd
```
```
$ sudo apt-get update
```

jika ingin mengembalikan software yang diintall di snap menggunakan apt :
```
$ sudo apt-get install gnome-calculator gnome-characters gnome-logs gnome-system-monitor
```

#### Install OpenVpn Server

Cek Ip address
```
$ dig +short myip.opendns.com @resolver1.opendns.com
```
Install OpenVpn pada ubuntu
```
$ sudo apt install curl
```
```
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
```
```
# chmod +x openvpn-install.sh
```
```
$ sudo bash openvpn-install.sh
```
Cek ip dan port pada openvpn
```
$ sudo ss -tupln | grep openvpn
```
```
$ ip add
```
### Configurasi Bahasa Pemograman di Linux

##### Configure java version
```
$ sudo update-alternatives --config javac
```

#### Install Kotlin
```
$ curl -s https://get.sdkman.io | bash
```
```
$ source "/home/hard/.sdkman/bin/sdkman-init.sh"
```
```
$ sdk install kotlin
```

#### Change bash to fish
```
$ sudo apt install fish
```
```
$ chsh -s /usr/bin/fish
```
untuk konfigurasi 
```
$ mkdir -p ~/.config/fish
```
```
$ touch ~/.config/fish/config.fish
```

#### Config Fish
```
$ curl -L https://get.oh-my.fish | fish
```
```
$ curl -L https://get.oh-my.fish > install
```
```
$ fish install --path=~/.local/share/omf --config=~/.config/omf
```
Untuk lebih lengkapnya bisa dicek di link dibawah ini
```
https://github.com/oh-my-fish/oh-my-fish
```

#### Export Inkscape to AI
Install
```
$ sudo curl 'https://langitketujuh.id/sh/l7-export' | sudo bash
```
```
$ sudo l7-export --install
```
cara pakai
langkah pertama cari id file
```
- Masuk Inkscape
- Object-> Object Properties
```

```
$ l7-export namaFile.svg IdFile
```

### Optimalkan SSD

#### Aktikan TRIM dan kurangi WRITE
TRIM memastikan bahwa ketika sistem operasi ingin menulis di sektor yang sama, data lama akan dihapus sepenuhnya tanpa sampah. Ini berjalan pada minimal kernel linux 3.8 atau lebih baru, dan menggunakan ext4 atau filesystem yang mendukung TRIM lainnya.

https://wiki.archlinux.org/index.php/Solid_state_drive#TRIM

Pastikan SSD anda mendukung untuk memverifikasi dukungan TRIM, jalankan:
```
$ lsblk --discard
```
Dan periksa nilai-nilai DISC-GRAN (discard granularity) dan DISC-MAX (discard max bytes) kolom. Nilai bukan nol menunjukkan dukungan TRIM.

Atau, instal paket hdparm dan jalankan:
```
$ sudo hdparm -I /dev/sda | grep TRIM
```
jika mendukung maka lanjutkan
```
$ sudo vi /etc/fstab
```

#### Add noatime to fstab

Tambahkan flag discard ke partisi root dan flag noatime ke masing-masing partisi yang berada di SSD.

Tambahkan juga
```
tmpfs   /tmp            tmpfs   defaults,noatime,mode=1777      0 0
tmpfs   /var/log        tmpfs   defaults,noatime,mode=0755      0 0
tmpfs   /var/spool      tmpfs   defaults,noatime,mode=1777      0 0
tmpfs   /var/tmp        tmpfs   defaults,noatime,mode=1777      0 0
```
```
$ sudo systemctl reboot
```
#### Jalankan fstrim secara berkala
#### Menggunakan cron
buat  cron mingguan /etc/cron.weekly/fstrim. Jika tidak, buat sendiri

```
$ sudo vi /etc/cron.weekly/fstrim
```
tambahkan
```
#!/bin/sh
# trim all mounted file systems which support it
/sbin/fstrim --all || true
```
#### Menggunakan systemctl
```
$ sudo systemctl enable fstrim.timer
```
```
$ sudo systemctl start fstrim.service
```
```
$ sudo systemctl start fstrim.timer
```

#### Kurangi penggunaan swap
```
$ sudo vi /etc/sysctl.conf
```
tambahkan (ubuntu dan debian)
```
vm.swappiness=1
vm.vfs_cache_pressure=50
```
```
$ sudo systemctl reboot
```

### Problem di Linux

#### Linux mengalami hang
Jalankan tekan bersamaan:
```
Ctrl+shift+alt+prntsrc+R+E+I+S+U+B
```

#### Keyboard Tidak Terdeteksi test on Xubuntu 18.04

Jalankan:
```
$ sudo apt install xserver-xorg-input-all
```


### Problem Kali Linux

#### Repository Kali Linux

cek ```/etc/apt/sources.list```

```
$ deb http://http.kali.org/kali kali-rolling main non-free contrib
```
```
$ sudo apt update
```
info lebih lengkap cek link dibawah ini

https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/

#### Date fix kali linux
```
$ timedatectl
```
```
$ timedatectl list-timezones | grep Asia
```
```
$ timedatectl set-timezone Asia/Jakarta
```


#### Install wine kali linux
```
$ sudo dpkg --add-architecture i386
```
```
$ sudo apt-get update
```
```
$ sudo apt-get install wine32
```

Untuk Install Office :
```
$ WINEPREFIX=~/.wine/office2007 WINEARCH=win32 winecfg
```
```
$ sudo apt install winbind cabextract
```
```
$ wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
```
```
$ chmod +x winetricks
```
```
$ sudo cp winetricks /usr/local/bin/
```

```
$ sudo apt install zenity
```
```
$ WINEPREFIX=~/.wine/office2007 WINEARCH=win32 winetricks 
```
Configure didalamnya
```
Select the default wineprefix
Install a Windows DLL or component
msxml6
```

cek apakah msxml6 sudah terinstall atau belum
```
$ WINEPREFIX=~/.wine/office2007 WINEARCH=win32 winetricks msxml6
```
untuk instal office 
```
$ WINEPREFIX=~/.wine/office2007 WINEARCH=win32 wine ./Microsoft-Office-Professional-2007.exe 
```

#### Install Disk Mounter
```
$ sudo apt-get install gnome-disk-utility
```

#### Install Virtualbox di kali linux
```
$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
```
```
$ echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian buster contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
```
```
$ sudo apt update
```
```
$ sudo apt install -y dkms virtualbox virtualbox-ext-pack
```
Jalankan
```
$ virtualbox
```
info lebih
https://www.kali.org/docs/virtualization/install-virtualbox-kali-host/

#### Install Spotify
```
$ curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
$ echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
```
```
$ sudo apt-get update && sudo apt-get install spotify-client
```

#### Install Scrcpy

```
$ sudo apt install scrcpy
```

##### Install Postman
```
$ cd Downloads/
```
```
$ tar -xzf Postman-linux-x64-7.32.0.tar.gz
```
```
$ sudo mkdir -p /opt/apps/
```
```
$ sudo mv Postman /opt/apps/
```
```
$ sudo ln -s /opt/apps/Postman/Postman /usr/local/bin/postman
```
```
$ postman
```
```
$ sudo vim /usr/share/applications/postman.desktop
```
```
[Desktop Entry]
Type=Application
Name=Postman
Icon=/opt/apps/Postman/app/resources/app/assets/icon.png
Exec="/opt/apps/Postman/Postman"
Comment=Postman Desktop App
Categories=Development;Code;
```
#### Install Libreoffice
Kunjungi link dibawah ini terus download filenya
```
https://www.libreoffice.org/download/download/
```
jika sudah extrak file yang udah didownload tadi lalu masuk ke folder hasil extrakannya lalu ke folder DEBS
```
../libreoffice*/DEBS/
```
lalu masuk ke terminal arahkan path folder seperti path diatas atau didalam folder DEB jika sudah ketikan :
```
$ sudo dpkg -i *.deb
```

#### Uninstall Libreoffice
```
$ sudo apt purge libreoffice7.0*
```
jika diatas tidak berhasil coba :
```
$ sudo dpkg --purge libreoffice*
```

#### Install Inkscape
Saya disini pakai yang portable sebelumnya kunjungi link dibawah ini dan download file yang appimage
```
https://inkscape.org/release/inkscape-dev/?latest=1
```
```
$ sudo vim /usr/share/applications/inkscape.desktop
```
```
[Desktop Entry]
Type=Application
Name=Inkscape
Icon=/home/hard/Downloads/Inkscape/inkscape.svg
Terminal=false
Exec=mate-terminal -e "bash -c 'cd Downloads/Inkscape/ && ./Inkscape-c4e8f9e-x86_64.AppImage;'"
Comment=Inkscape 
Categories=Graphics;2DGraphics;RasterGraphics;GTK;

```
#### Uninstall Inkscape
```
$ sudo apt purge inkscape
```

#### Install Blender
Kunjungi link dibawah ini lalu download dan extrack
```
https://docs.blender.org/manual/en/latest/getting_started/installing/linux.html
```
hasil compress dipindahkan di **user/local/bin** lalu ketikan di terminal
```
$ sudo ln -s /usr/local/blender-2.93.4-linux-x64/blender /usr/local/bin/
```
jika blender tidak muncul dishortcut lalu kan dibawah ini : 
```
$ sudo cp blender.desktop /usr/share/applications/
```
lokasikan pathnya di folder yang aktif

#### Error virtualbox
#### Kernel driver not installed (rc=-1908)
```
$ sudo apt update
```
```
$ sudo apt install --reinstall linux-headers-$(uname -r) virtualbox-dkms dkms
```
```
$ sudo modprobe vboxdrv
```

#### Shortcuts Android Studio

```
$ sudo vim /usr/share/applications/android-studio.desktop
```
```
[Desktop Entry]
Type=Application
Name=Android Studio
Icon=/usr/local/android-studio/bin/studio.png
Terminal=false
Exec=mate-terminal -e "bash -c 'sudo bash /usr/local/android-studio/bin/studio.sh;'"
Comment=Android Studio Desktop App
Categories=Development;Code;
``` 

#### Shortcuts Web Server Localhost
```
$ sudo vim /usr/share/applications/android-studio.desktop
```
```
[Desktop Entry]
Type=Application
Name=Localhost
Icon=/var/www/html/logo.png
Terminal=true
Exec=firefox http://localhost
Comment=Web Server Local
Categories=Development;Code;
```

#### Install Telegram desktop
```
$ sudo apt-get install telegram-desktop
```

#### Fix GNUStep
Problem :
```
The following packages have unmet dependencies:
 gnustep-base-runtime : Depends: gnustep-base-common (= 1.27.0-3) but 1.26.0-7 is to be installed
 libgnustep-base1.27 : Depends: gnustep-base-common (= 1.27.0-3) but 1.26.0-7 is to be installed
E: Broken packages
```
Perbaikan :
```
$ sudo apt-get autoclean
$ sudo apt-get -f install
$ sudo dpkg --configure -a
$ sudo apt-get -f install
```
```
$ sudo apt-get update
$ sudo apt-get upgrade
```
```
$ sudo apt-get full-upgrade
```

#### Fix libpangox-1.0.so.0
problem :
```
anydesk: error while loading shared libraries: libpangox-1.0.so.0: cannot open shared object file: No such file or directory
```
Perbaikan :
```
$ sudo apt-get install -y libpangox-1.0-0
```

### Terima Kasih
