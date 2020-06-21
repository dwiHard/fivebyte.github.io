# Tips dan Trik Android
> di susun oleh Hardiyanto

### Daftar isi
* [Cara Connect Android ke Laptop dengan WI-FI atau USB](#cara-connect-android-ke-laptop-dengan-wi-fi-atau-usb)
	* [Device Root](#jika-device-kondisi-root)
	* [Device Non-Root](#jika-device-kondisi-non-root)
* [Cara Mirror Smartphone ke laptop](#cara-mirror-smartphone-ke-laptop)
* [Build Web Server](#bulid-web-server)
    * [Persiapan](#persiapan)
    * [Problem](#problem)


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

