# Docker di Linux
> Disusun oleh Hardiyanto
### Daftar Isi
* [Install Docker](#install-docker)
	* [Install docker di Ubuntu 18.04](#install-docker-di-ubuntu-1804)
	* [Install Docker di kali linux 2020.2](#install-docker-di-kali-linux-20202)
* [Configurasi Docker](#configurasi-docker)
    * [Otomatis start](#otomatis-start)
	* [Memeriksa status docker](#memeriksa-status-docker)
* [Image](#image)
	* [Image docker untuk mirror Android](#image-docker-untuk-mirror-android)
	* [Image docker web server](#image-docker-web-server)


### Install Docker

#### Install Docker di ubuntu 18.04

```
sudo apt update 
```
```
sudo apt-get install  curl apt-transport-https ca-certificates software-properties-common 
```
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 
```
```
sudo apt update
```
```
sudo apt install docker-ce 
```
```
sudo usermod -aG docker $USER
```

#### Install Docker di kali linux 2020.2

```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
```
```
echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
```
```
sudo apt-get update
```
```
sudo apt-get install docker-ce
```
```
sudo usermod -aG docker $USER
```

### Configurasi Docker

#### Otomatis start

```
sudo systemctl enable docker
```

#### Memeriksa status docker

```
 sudo systemctl status docker
```

#### Image docker untuk mirror Android

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

#### Image docker web server
```
sudo docker run -dit --name hard-web  -p 8080:80 -v /home/user/website/:/usr/local/apache2/htdocs/ httpd:2.4
```

cek :
```
sudo docker ps
```

Edit file :
```
sudo vi /home/user/website/docker.html
```
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Learn Docker at hard.com</title>
</head>
<body>
    <h1>Learn Docker With Us</h1>   
</body>
</html>
```

Untuk Stop docker :
```
sudo docker stop hard-web
```
Untuk remove :
```
sudo docker rm hard-web
```
Untuk remove container
```
sudo docker image remove httpd:2.4
```

### Sekian dan Terima Kasih
