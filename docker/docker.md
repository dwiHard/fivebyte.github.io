# Docker di ubuntu 18.04
### Daftar Isi
* Install docker
* Memeriksa status docker

#### Install Docker di ubuntu 18.04
```
$  sudo apt update 
```
```
$  sudo apt-get install  curl apt-transport-https ca-certificates software-properties-common 
```
```
$  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
```
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 
```
```
$ sudo apt update
```
```
$ sudo apt install docker-ce 
```

#### Memerikasa status docker
```
 $ sudo systemctl status docker
```

##### Image docker untuk mirror Android

Untuk lebih lengkapnya bisa cek disini :<br>
https://hub.docker.com/r/pierlo1/scrcpy<br>
kebetulan di laptop saya menggunakan amd jadi saya menulisnya begini ```pierlo1/scrcpy:amd```<br>
sesuaikan dengan laptop ***amd***, ***intel***, / ***nvidia***.

```
docker run --rm -i -t --privileged \
    -v /dev/bus/usb:/dev/bus/usb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    pierlo1/scrcpy:amd
```
