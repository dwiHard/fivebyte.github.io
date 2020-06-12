# Tips dan Trik Android
> di susun oleh Hardiyanto

### Daftar isi
* [Cara Connect Android ke Laptop dengan WI-FI atau USB] (#cara-connect-android-ke-laptop-dengan-wi-fi-atau-usb)
	* [Device Root] (#jika-device-kondisi-root)
	* [Device Non-Root] (#jika-device-kondisi-non-root)

* [Cara Mirror Smartphone ke laptop](#cara-mirror-smartphone-ke-laptop)


# Cara Connect Android ke Laptop dengan WI-FI atau USB
####jika device kondisi root<br>
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

##### jika device kondisi non-root</br>
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
