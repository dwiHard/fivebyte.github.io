## Install Docker

## Install Docker di ubuntu 18.04

```sh
sudo apt update 
```

```sh
sudo apt-get install  curl apt-transport-https ca-certificates software-properties-common 
```

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

```sh
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 
```

```sh
sudo apt update
```

```sh
sudo apt install docker-ce 
```

```sh
sudo usermod -aG docker $USER
```

## Install Docker di kali linux 2020.2

```sh
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
```

```sh
echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
```

```sh
sudo apt-get update
```

```sh
sudo apt-get install docker-ce
```

```sh
sudo usermod -aG docker $USER
```

## Basic Command dan Docker Container
## Melihat versi docker

```sh
docker version
```

## Melihat docker image

```sh
docker image ls
```

## Download docker image

```sh
docker image pull <nama image>:<tag>
```

## Menghapus docker image

```sh
docker image rm <nama image>:<tag>
```

## Melihat semua container

```sh
docker container ls -a
```

## Membuat container

nama_container adalah nama yang akan digunakan untuk container
namaimage:tag adalah nama image yang akan digunakan untuk container

```sh
docker container create --name nama_container namaimage:tag
```

example:

```sh
docker container create --name contohredis redis:latest
```

or

```sh
docker run -d --name nama_container namaimage:tag
```

## Menjalankan container

```sh
docker container start nama_container/container_id
```

## Menghentikan container

```sh
docker container stop nama_container/container_id
```

## Menghapus container

```sh
docker container rm nama_container/container_id
```

## Menghapus paksa container

```sh
docker container rm -f nama_container/container_id
```

## Stop container melalui SIGTERM

```sh
docker container stop nama_container/container_id
```

## Stop container melalui SIGKILL

```sh
docker container kill nama_container/container_id
```

## Melihat log container

```sh
docker container logs nama_container/container_id
```

jika ingin melihat secara realtime

```sh
docker container logs -f nama_container/container_id
```

## Melihat history image

```sh
docker history nama_image/tag
```

## Masuk ke dalam container

```sh
docker container exec -it nama_container/container_id /bin/bash
```

## Melakukan port forwarding

```sh
docker container create --name contohredis --publish porthost:portcontainer image:tag
```

example:

```sh
docker container create --name contohnginx --publish 8080:80 nginx:latest
```

## Melihat port yang digunakan oleh container

```sh
docker container port nama_container/container_id
```

## Melihat IP address container

```sh
docker container inspect --format '{{ .NetworkSettings.IPAddress }}' nama_container/container_id
```

## Melihat container performa semua container

```sh
docker container stats
```

## Melihat detail config container

```sh
docker container inspect nama_container/container_id
```

## Melihat process yang berjalan di dalam container

```sh
docker container top nama_container/container_id
```

## Container resource limit

```sh
docker container create --name nama_container --publish porthost:portcontainer --memory 512m --cpus 0.5 image:tag
```

example:

```sh
docker container create --name smallnginx --publish 8080:80 --memory 100m --cpus 0.5 nginx:latest
```

## Menambahkan enviroment variable

```sh
docker container create --name nama_container --publish porthost:portcontainer --env image:tag
```

example:

```sh
docker container create --name contohmongo --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:latest
```

## Melakukan mounting bind

```sh
docker container create --name nama_container --mount "type=bind,source=hostpath,target=containerpath" image:tag
```

example:

```sh
docker container create --name contohmongo --publish 27017:27017 --mount "type=bind,source=/home/hard/Documents/docker/mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:latest
```

## Docker Volume
## Melihat volume

```sh
docker volume ls
```

## Membuat volume

```sh
docker volume create <nama volume>
```

## Menghapus volume

```sh
docker volume rm <nama volume>
```

## Menghubungkan volume ke container

```sh
docker container create --name nama_container --mount "type=volume,source=nama_volume,target=containerpath" image:tag
```

example:

```sh
docker volume create mongodata
```

```sh
docker container create --name contohmongo --publish 27017:27017 --mount "type=volume,source=mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:latest
```

example satu baris execute:

```sh
docker container run -d --name nginx -p 80:80 -v $(pwd)/html:/usr/share/nginx/html nginx:latest
```

## Backup volume

```sh
docker container create --name nama_container --mount "type=bind,source=pathhost,destination=pathhostbackup" --mount "type=volume,source=name_volume,destination=path_volume" image:tag
```

example:
buat volume dengan nama volumemongo

```sh
docker volume create volumemongo
```

buat container imgae nginx dengan nama nginxbackup

```sh
docker container create --name nginxbackup --mount "type=bind,source=/home/hard/docker/backupmongo,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" nginx:latest
```

jalankan container

```sh
docker container start nginxbackup
```

masuk ke dalam container

```sh
docker container exec -it nginxbackup /bin/bash
```

melakukan backup

```sh
tar cvf  /backup/backup.tar.gz /data
```

example satu baris execute:

```sh
docker container run --rm --name ubuntu --mount "type=bind,source=/home/hard/docker/backupmongo,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backup2.tar.gz /data
```

## Restore volume

```sh
docker container run --rm --name ubunturestore --mount "type=bind,source=pathhost,destination=pathhostbackup" --mount "type=volume,source=name_volume,destination=path_volume" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"
```

example:

```sh
docker volume create mongorestore
```

```sh
docker container run --rm --name ubunturestore --mount "type=bind,source=/home/hard/docker/backupmongo,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"
```

## Docker Network
## Melihat network

```sh
docker network ls
```

## Membuat network

```sh
docker network create --driver <driver> <nama network>
```

## Menghapus network

```sh
docker network rm <nama network>
```

## Menghubungkan container ke network

```sh
docker container create --name <nama_container> --network <nama network> image:tag
```

example:

```sh
docker network create --driver bridge mongonetwork
```

```sh
docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:4.4.18
```

mongodb adalah nama hostnya

```sh
docker container create --name mongoexpress --publish 8081:8081 --network mongonetwork --env ME_CONFIG_MONGODB_URL="mongodb://username:password@mongodb:27017" mongo-express:latest
```

## Menghapus container network

```sh
docker network disconnect <nama_network> <nama_container>
```

example:

```sh
docker network disconnect mongonetwork mongodb
```

untuk menghubungkan kembali:

```sh
docker network connect mongonetwork mongodb
```

## Inspect

untuk melihat detail dari image, container, volume, dan network

```sh
docker image inspect <nama_image>
```

```sh
docker container inspect <nama_container>
```

```sh
docker volume inspect <nama_volume>
```

```sh
docker network inspect <nama_network>
```

## Perintah Prune

menghapus semua container yang tidak digunakan

```sh
docker container prune
```

untuk menghapus semua image yang tidak digunakan

```sh
docker image prune
```

untuk menghapus semua volume yang tidak digunakan

```sh
docker volume prune
```

untuk menghapus semua network yang tidak digunakan

```sh
docker network prune
```

untuk menghapus semua yang tidak digunakan kecuali volume

```sh
docker system prune
```

## Push Image ke Docker Hub

```sh
docker login
```

melihat status login

```sh
cat ~/.docker/config.json
```

menambahkan tag

```sh
docker image tag <nama_image> <username_dockerhub>/<nama_image>:<tag>
```

example:

```sh
docker image tag nginx hardhard/nginx
```

```sh
docker image push <username_dockerhub>/<nama_image>:<tag>
```

example:

```sh
docker image push hardhard/nginx
```

menambahkan tag baru

```sh
docker image tag <username_dockerhub>/<nama_image_lama>:<tag_lama> <username_dockerhub>/<nama_image_baru>:<tag_baru>
```

example:

```sh
docker image tag hardhard/nginx:latest hardhard/nginx:testing
```

## Docker Swarm
## Inisialisasi Docker Swarm

```sh
docker swarm init
```

jika terjadi error seperti ini:

```
Error response from daemon: could not choose an IP address to advertise since this system has multiple addresses on interface enp0s3...
```

maka jalankan perintah ini:

```sh
docker swarm init --advertise-addr <ip_address>
```

## Docker Dockerfile

## Docker Service
## Membuat Service
```sh
docker service create --name <nama_service> --replicas <jumlah_replicas> --publish <port_host>:<port_container> <nama_image>:<tag>
```

example:

```sh
docker service create alpine ping 8.8.8.8
```

## Melihat list service

```sh
docker service ls
```

## Melakukan update service (scale up/down)

```sh
docker service update <id_container> --replicas <jumlah_replicas>
```

example:

```sh
docker service update nginx --replicas 5
```

## Docker build

```sh
docker build -t <nama_image> <path_dockerfile>
```

untuk display output

```sh
docker build -t <nama_image> <path_dockerfile> --progress=plain
```

tanpa cache

```sh
docker build -t <nama_image> <path_dockerfile> --no-cache
```

example:

```sh
docker build -t hard:latest /home/hard/docker/dockerfile
```

## Contoh Dockerfile

```dockerfile
FROM alpine:latest

RUN mkdir coba
RUN echo "Hello World" > coba/hello.txt
RUN cat coba/hello.txt
ADD coba/hello.txt coba/hello.txt

CMD cat coba/hello.txt
```
FROM adalah perintah untuk mendefinisikan image yang akan digunakan
ADD adalah perintah untuk memasukan file ke dalam image
RUN adalah perintah untuk menjalankan perintah di dalam image
CMD adalah perintah untuk menjalankan perintah di dalam container

## Configurasi Docker

## Otomatis start

```sh
sudo systemctl enable docker
```

## Memeriksa status docker

```sh
 sudo systemctl status docker
```

## Image docker untuk mirror Android

Untuk lebih lengkapnya bisa cek disini :<br>
https://hub.docker.com/r/pierlo1/scrcpy<br>
kebetulan di laptop saya menggunakan amd jadi saya menulisnya begini ```pierlo1/scrcpy:amd```<br>
sesuaikan dengan laptop ***amd***, ***intel***, / ***nvidia***.

```sh
docker run --rm -i -t --privileged \
    -v /dev/bus/usb:/dev/bus/usb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    pierlo1/scrcpy:amd
```

## Image docker web server

```sh
sudo docker run -dit --name hard-web  -p 8080:80 -v /home/user/website/:/usr/local/apache2/htdocs/ httpd:2.4
```

cek :

```sh
sudo docker ps
```

Edit file :

```sh
sudo vi /home/user/website/docker.html
```

```html
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

```sh
sudo docker stop hard-web
```

Untuk remove :

```sh
sudo docker rm hard-web
```

Untuk remove container

```sh
sudo docker image remove httpd:2.4
```

## Terima Kasih
