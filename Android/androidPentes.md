## Android Pentesting
> disusun oleh Hardiyanto

<div align="center">
  <a href="https://frida.re/">
    <h1>Frida</h1>
  </a>

<h3 align="center">README-Frida</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://frida.re/"><strong>Explore the docs Frida»</strong></a>
    <a href="https://codeshare.frida.re/"><strong>Explore the codeshare Frida»</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/Android/androidPentes.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My README</a>
  </p>
</div>

## Daftar Isi
* [Frida Installation](#frida-installation)
* [Setup Frida Server](#setup-frida-server)
* [Apktool Installation](#apktool-installation)
* [Decode APK](#decode-apk)
* [Check CPU Architecture](#check-cpu-architecture)

### Frida Installation
```bash
pip install frida-tools
```

### Setup Frida Server
Download file frida server dari link berikut dan tentukan dengan cpu architecture yang digunakan https://github.com/frida/frida/releases/
```bash
wget https://github.com/frida/frida/releases/download/16.0.17/frida-server-16.0.17-android-arm64.xz
```
```bash
xz -d frida-server-16.0.17-android-arm64.xz
```
perintah di atas perintah extrack akan meghilankan file compressnya, jika ingin mempertahakan file aslinya pakai perntah
```bash
xz -dk frida-server-16.0.17-android-arm64.xz
```
perintah untuk mengirimkan file hasil extrack tadi ke android menggunakan adb
```bash
adb push frida-server-16.0.17-android-arm64 /data/local/tmp/frida-server
```
```bash
su
```
```bash
chmod 777 frida-server
```
untuk menjalankan
```bash
./frida-server
```
untuk check service yang berjalan
```bash
frida-ps -Ua
```
untuk check aplikasi yang berjalan
```bash
frida-trace -U -N <package_name>
```

### Apktool Installation
link referensi https://ibotpeaches.github.io/Apktool/ atau https://github.com/iBotPeaches/Apktool
```bash
wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool
```
Download file dari link berikut https://bitbucket.org/iBotPeaches/apktool/downloads/
```bash
chmod +x apktool apktool-version.jar
```
```bash
sudo mv apktool apktool-version.jar /usr/local/bin
```
untuk menjalankan ketikan
```bash
apktool
```

### Decode APK
```bash
apktool d foo.jar
```
decode dengan nama folder
```bash
pktool d foo.apk -o bar
```

### Check CPU Architecture
```bash
adb shell getprop ro.product.cpu.abi
```

## Terima Kasih