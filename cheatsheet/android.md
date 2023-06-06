# Tips dan Trik Android
> di susun oleh Hardiyanto

### Daftar isi
* [Cara Connect Android ke Laptop dengan WI-FI atau USB](#cara-connect-android-ke-laptop-dengan-wi-fi-atau-usb)
	* [Device Root](#jika-device-kondisi-root)
	* [Device Non-Root](#jika-device-kondisi-non-root)
* [Cara Mirror Smartphone ke laptop](#cara-mirror-smartphone-ke-laptop)
* [Ubuntu in Termux](#ubuntu-in-termux)
* [Build Web Server](#bulid-web-server)
    * [Persiapan](#persiapan)
    * [Problem](#problem)
* [Android Studio Plugin](#)
    * [Plugin Android Drawable Importer](#plugin-android-drawable-importer)
* [Program Android](#)
    * [Desain menggunakan card view](https://gitlab.com/dwiHard/LinuxAdministration/-/blob/master/Android/CardView.md)
    * [Remove Action Bar](https://gitlab.com/dwiHard/LinuxAdministration/-/blob/master/Android/RemoveActionBar.md)
* [Check health EMMC](#check-health-emmc)
* [Problem ADB Android](#problem-adb-android)
    * [ADB Device Unauthorized](#adb-device-unauthorized)

# Cara Connect Android ke Laptop dengan WI-FI atau USB
#### Jika device kondisi root<br>
Masuk ke terminal :
```
su
setprop service.adb.tcp.port 5555
stop adbd
start adbd
```

jika ingin disable

```
setprop service.adb.tcp.port -1
stop adb
start adb
```

##### Jika device kondisi non-root</br>
colokkan kabel USB dahulu

```
adb tcpip 5555
```
jika hanya menggunakan kabel usb cukup sampai disini aja. Cara berikutnya untuk menghubungkan dengan WI-FI

```
adb connect ip:5555
```

# Cara Mirror Smartphone ke laptop
pastikan device sudah terhubung dengan laptop jika belum bisa diikuti dulu cara sebelumnya. untuk mengecek apakah sudah terhubung atau belum bisa cek :
```
adb devices
```
install scrpy ikuti link dibawah ini <br>
https://github.com/Genymobile/scrcpy

```
scrcpy
```

#### Ubuntu in Termux
```
apt-get update && apt-get upgrade -y
```
```
apt-get install wget proot git -y
```
```
git clone https://github.com/MFDGaming/ubuntu-in-termux.git
```
```
cd ubuntu-in-termux
```
```
chmod +x ubuntu.sh
```
```
./ubuntu.sh -y
```
Setiap mau jalan kan ubuntu silakhkan ketik
```
./startubuntu.sh
```

### Build Web Server

#### Persiapan
Install web server :
```
# apt install apache2
```
Install database :
```
# apt install mysql-server
```
#### Problem

```
AH00557: apache2: apr_sockaddr_info_get() failed for localhost
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.0.1. Set the 'ServerName' directive globally to suppress this message
(13)Permission denied: AH00072: make_sock: could not bind to address [::]:80
(13)Permission denied: AH00072: make_sock: could not bind to address 0.0.0.0:80
no listening sockets available, shutting down
AH00015: Unable to open logs
Action 'start' failed.
The Apache error log may have more information.
 *
```
Jalankan :
```
# vi /etc/apache2/apache2.conf
```
Tambahkan dan simpan :
```
 ServerName 127.0.0.1
```

Lalu edit juga di bagian :
```
 vi /etc/hosts
```
```
 ServerName 127.0.0.1
```

#### Plugin Android Drawable Importer
download file yang ada di link dibawah ini untuk android studio versi arctic fox
```
https://gitlab.com/dwiHard/LinuxAdministration/-/blob/master/Android/File/ADI-hack-0.8.zip
```
lalu buka android studio
```
file->setting->plugins->setting->install plugin from disk
```

#### Check Health EMMC
```
Method to check EMMC’s Health 

Check at /sys/class/mmchost/mmc0/mmc0:0001/lifetime via any root explorer 

0x01 0x01 = 100%-90%
0x01 0x02 = 90-80%
0x01 0x03 = 80-70%
0x01 0x04 = 70-60%
0x01 0x05 = 60-50℅
0x01 0x06 = 50℅-40℅
0x01 0x07 = 40℅-30℅
0x01 0x08 = 30℅-20℅
0x01 0x09 = 30℅-20℅
0x01 0x0A = 20℅-10℅
0x0b 0x0b = Dead AF 
```
Atau download apk
https://github.com/dwiHard/five_byte.github.io/blob/master/Android/File/Disk%20Health%20Checker.apk

### Problem ADB Android
#### ADB Device Unauthorized
masuk folder /data/misc/adb lalu buat ssh key lalu masukkan ke /data/misc/adb/adb_keys

## Terima Kasih
