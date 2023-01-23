# Docker di Linux
> Disusun oleh Hardiyanto

<div align="center">
  <a href="https://docs.docker.com/">
    <img src="https://github.com/dwiHard/five_byte.github.io/blob/master/images/docker.png" alt="Logo" width="140" height="100">
  </a>

<h3 align="center">README-Docker</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://docs.docker.com/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/docker/docker.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My README</a>
  </p>
</div>

### Daftar Isi
* [Basic Command](#basic-command)
  * [Melihat versi docker](#melihat-versi-docker)
  * [Melihat docker image](#melihat-docker-image)
  * [Download docker image](#download-docker-image)
  * [Menghapus docker image](#menghapus-docker-image)
  * [Melihat nama container](#melihat-nama-container)
  * [Melihat nama container](#melihat-nama-container)
  * [Membuat container](#membuat-container)
  * [Menjalankan container](#menjalankan-container)
  * [Menghentikan container](#menghentikan-container)
  * [Menghapus container](#menghapus-container)
  * [Melihat log container](#melihat-log-container)
  * [Masuk ke dalam container](#masuk-ke-dalam-container)
  * [Melakukan port forwarding](#melakukan-port-forwarding)
  * [Melihat container statistik](#melihat-container-statistik)
  * [Container resource limit](#container-resource-limit)
  * [Menambahkan enviroment variable](#menambahkan-enviroment-variable)
  * [Melakukan mounting bind](#melakukan-mounting-bind)
  * [Melihat volume](#melihat-volume)
  * [Membuat volume](#membuat-volume)
  * [Menghapus volume](#menghapus-volume)
  * [Menghubungkan volume ke container](#menghubungkan-volume-ke-container)
  * [Backup volume](#backup-volume)
  * [Restore volume](#restore-volume)
  * [Melihat network](#melihat-network)
  * [Membuat network](#membuat-network)
  * [Menghapus network](#menghapus-network)
  * [Menghubungkan container ke network](#menghubungkan-container-ke-network)
  * [Menghapus container network](#menghapus-container-network)
* [Install Docker](#install-docker)
	* [Install docker di Ubuntu 18.04](#install-docker-di-ubuntu-1804)
	* [Install Docker di kali linux 2020.2](#install-docker-di-kali-linux-20202)
* [Configurasi Docker](#configurasi-docker)
    * [Otomatis start](#otomatis-start)
	* [Memeriksa status docker](#memeriksa-status-docker)
* [Image](#image)
	* [Image docker untuk mirror Android](#image-docker-untuk-mirror-android)
	* [Image docker web server](#image-docker-web-server)

### Basic Command
#### Melihat versi docker
```
docker version
```
#### Melihat docker image
```
docker image ls
```
#### Download docker image
```
docker image pull <nama image>:<tag>
```

#### Menghapus docker image
```
docker image rm <nama image>:<tag>
```
#### Melihat nama container
```
docker container ls -a
```
#### Membuat container
nama_container adalah nama yang akan digunakan untuk container
namaimage:tag adalah nama image yang akan digunakan untuk container
```
docker container create --name nama_container namaimage:tag
```
example:
```
docker container create --name contohredis redis:latest
```
#### Menjalankan container
```
docker container start nama_container/container_id
```
#### Menghentikan container
```
docker container stop nama_container/container_id
```
#### Menghapus container
```
docker container rm nama_container/container_id
```
#### Melihat log container
```
docker container logs nama_container/container_id
```
jika ingin melihat secara realtime
```
docker container logs -f nama_container/container_id
```
#### Masuk ke dalam container
```
docker container exec -it nama_container/container_id /bin/bash
```
#### Melakukan port forwarding
```
docker container create --name contohredis --publish porthost:portcontainer image:tag
```
example:
```
docker container create --name contohnginx --publish 8080:80 nginx:latest
```
#### Melihat container statistik
```
docker container stats
```
#### Container resource limit
```
docker container create --name nama_container --publish porthost:portcontainer --memory 512m --cpus 0.5 image:tag
```
example:
```
docker container create --name smallnginx --publish 8080:80 --memory 100m --cpus 0.5 nginx:latest
```
#### Menambahkan enviroment variable
```
docker container create --name nama_container --publish porthost:portcontainer --env image:tag
```
example:
```
docker container create --name contohmongo --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:latest
```
#### Melakukan mounting bind
```
docker container create --name nama_container --mount "type=bind,source=hostpath,target=containerpath" image:tag
```
example:
```
docker container create --name contohmongo --publish 27017:27017 --mount "type=bind,source=/home/hard/Documents/docker/mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:latest
```

#### Melihat volume
```
docker volume ls
```
#### Membuat volume
```
docker volume create <nama volume>
```
#### Menghapus volume
```
docker volume rm <nama volume>
```
#### Menghubungkan volume ke container
```
docker container create --name nama_container --mount "type=volume,source=nama_volume,target=containerpath" image:tag
```
example:
```
docker volume create mongodata
```
```
docker container create --name contohmongo --publish 27017:27017 --mount "type=volume,source=mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:latest
```
#### Backup volume
```
docker container create --name nama_container --mount "type=bind,source=pathhost,destination=pathhostbackup" --mount "type=volume,source=name_volume,destination=path_volume" image:tag
```
example:
buat volume dengan nama volumemongo
```
docker volume create volumemongo
```
buat container imgae nginx dengan nama nginxbackup
```
docker container create --name nginxbackup --mount "type=bind,source=/home/hard/docker/backupmongo,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" nginx:latest
```
jalankan container
```
docker container start nginxbackup
```
masuk ke dalam container
```
docker container exec -it nginxbackup /bin/bash
```
melaukuan backup
```
tar cvf  /backup/backup.tar.gz /data
```

example satu baris execute:
```
docker container run --rm --name ubuntu --mount "type=bind,source=/home/hard/docker/backupmongo,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backup2.tar.gz /data
```
#### Restore volume
```
docker container run --rm --name ubunturestore --mount "type=bind,source=pathhost,destination=pathhostbackup" --mount "type=volume,source=name_volume,destination=path_volume" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"
```
example:
```
docker volume create mongorestore
```
```
docker container run --rm --name ubunturestore --mount "type=bind,source=/home/hard/docker/backupmongo,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"
```

#### Melihat network
```
docker network ls
```

#### Membuat network
```
docker network create --driver <driver> <nama network>
```
#### Menghapus network
```
docker network rm <nama network>
```
#### Menghubungkan container ke network
```
docker container create --name <nama_container> --network <nama network> image:tag
```
example:
```
docker network create --driver bridge mongonetwork
```
```
docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:4.4.18
```
mongodb adalah nama hostnya
```
docker container create --name mongoexpress --publish 8081:8081 --network mongonetwork --env ME_CONFIG_MONGODB_URL="mongodb://username:password@mongodb:27017" mongo-express:latest
```
#### Menghapus container network
```
docker network disconnect <nama_network> <nama_container>
```
example:
```
docker network disconnect mongonetwork mongodb
```
untuk menghubungkan kembali:
```
docker network connect mongonetwork mongodb
```
#### Inspect
untuk melihat detail dari image, container, volume, dan network
```
docker image inspect <nama_image>
```
```
docker container inspect <nama_container>
```
```
docker volume inspect <nama_volume>
```
```
docker network inspect <nama_network>
```
#### Perintah Prune
menghapus semua container yang tidak digunakan
```
docker container prune
```
untuk menghapus semua image yang tidak digunakan
```
docker image prune
```
untuk menghapus semua volume yang tidak digunakan
```
docker volume prune
```
untuk menghapus semua network yang tidak digunakan
```
docker network prune
```
untuk menghapus semua yang tidak digunakan kecuali volume
```
docker system prune
```
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
