# Tips dan Triks Linux 
> Disusun oleh Hardiyanto

### Daftar isi
* [Disable webcam](#disable-webcam)
* [Optimalkan SSD](#optimalkan-ssd)
	* [Aktikan TRIM dan kurangi WRITE](#aktifkan-trim-dan-kurangi-write)
	* [Add noatime to fstab](#add-noatime-to-fstab)
	* [Kurangi penggunaan swap](#kurangi-penggunaan-swap)
	* [Jalankan fstrim secara berkala](#jalankan-fstrim-secara-berkala)
	* [Kurangi penggunaan swap](#kurangi-penggunaan-swap)
* [Repository Kali Linux](#repository-kali-Linux)
* [Date fix kali linux](#date-fix-kali-linux)
* [Install Virtualbox di kali linux](#install-virtualbox-di-kali-linux)
* [Error virtualbox](#error-virtualbox)
	* [Kernel driver not installed (rc=-1908)](#kernel-driver-not installed-rc1908)
* [cek linux header](#cek-linux-header)



#### Disable webcam.
cek list webcam
```
sudo lsmod | grep uvcvideo
```
```
vi /etc/modprobe.d/blacklist-libnfc.conf 
```

```
blacklist uvcvideo
```

#### Optimalkan SSD

#### Aktikan TRIM dan kurangi WRITE
TRIM memastikan bahwa ketika sistem operasi ingin menulis di sektor yang sama, data lama akan dihapus sepenuhnya tanpa sampah. Ini berjalan pada minimal kernel linux 3.8 atau lebih baru, dan menggunakan ext4 atau filesystem yang mendukung TRIM lainnya.

https://wiki.archlinux.org/index.php/Solid_state_drive#TRIM

Pastikan SSD anda mendukung untuk memverifikasi dukungan TRIM, jalankan:
```
lsblk --discard
```
Dan periksa nilai-nilai DISC-GRAN (discard granularity) dan DISC-MAX (discard max bytes) kolom. Nilai bukan nol menunjukkan dukungan TRIM.

Atau, instal paket hdparm dan jalankan:
```
sudo hdparm -I /dev/sda | grep TRIM
```
jika mendukung maka lanjutkan
```
sudo vi /etc/fstab
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
sudo systemctl reboot
```
#### Jalankan fstrim secara berkala
#### Menggunakan cron
buat  cron mingguan /etc/cron.weekly/fstrim. Jika tidak, buat sendiri

```
sudo vi /etc/cron.weekly/fstrim
```
tambahkan
```
#!/bin/sh
# trim all mounted file systems which support it
/sbin/fstrim --all || true
```
#### Menggunakan systemctl
```
sudo systemctl enable fstrim.timer
```
```
sudo systemctl start fstrim.service
```
```
sudo systemctl start fstrim.timer
```

#### Kurangi penggunaan swap
```
sudo nano /etc/sysctl.conf
```
tambahkan (ubuntu dan debian)
```
vm.swappiness=1
vm.vfs_cache_pressure=50
```
```
sudo systemctl reboot
```


#### Repository Kali Linux

cek ```/etc/apt/sources.list```

```
deb http://http.kali.org/kali kali-rolling main non-free contrib
```
```
sudo apt update
```
info lebih lengkap cek link dibawah ini

https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/

#### Date fix kali linux
```
sudo apt-get install ntpdate
```
```
sudo systemctl restart ntp
```
```
systemctl status ntp
```
```
timedatectl list-timezones | grep Asia
```
```
timedatectl set-timezone Asia/Jakarta
```
```
timedatectl set-ntp true
```

Jika Muncul pesan ```Failed to set ntp: NTP not supported``` maka jalankan

#### Install Virtualbox di kali linux
```
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
```
```
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian buster contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
```
```
sudo apt update
```
```
sudo apt install -y dkms virtualbox virtualbox-ext-pack
```
Jalankan
```
virtualbox
```
info lebih
https://www.kali.org/docs/virtualization/install-virtualbox-kali-host/


#### Error virtualbox
#### Kernel driver not installed (rc=-1908)
```
sudo apt update
```
```
sudo apt install --reinstall linux-headers-$(uname -r) virtualbox-dkms dkms
```
```
sudo modprobe vboxdrv
```



#### cek linux header
```
apt-cache search linux-headers
```

