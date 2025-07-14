---
outline: deep
---

## Apa itu docker?
Docker adalah sebuah platform sumber terbuka (open-source) yang digunakan untuk mengembangkan, mengirimkan, dan menjalankan aplikasi menggunakan kontainer. Kontainer memungkinkan developer untuk mengemas aplikasi beserta semua bagian yang dibutuhkan (perpustakaan, dependensi, dan pengaturan) menjadi satu unit terisolasi.

## Docker Cheat Sheet for Beginners and Advanced Users
Lembar contekan ini menyediakan referensi cepat untuk perintah-perintah Docker yang umum, yang mencakup instalasi, operasi dasar, manajemen siklus hidup kontainer, konfigurasi, manajemen volume, jaringan, pencatatan log, debugging, dan manajemen image. Lembar ini mencakup perintah untuk pemula dan pengguna tingkat lanjut.

### Install Docker di ubuntu 18.04

::: code-group
```sh[manual]
sudo apt update 

sudo apt-get install  curl apt-transport-https ca-certificates software-properties-common 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 

sudo apt update

sudo apt install docker-ce 
```

```sh[automatic]
curl -sSL https://get.docker.com/ | sh
```
:::

```sh
sudo usermod -aG docker $USER
```

### Install Docker di kali linux 2020.2

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

## Docker Basic
### Melihat versi docker

```sh
docker version
```

### Menampilan informasi tentang docker


```sh
docker info
```

### Melihat docker image

::: code-group

```sh [command 1]
docker image ls
```


```sh [command 2]
docker images

```
:::

### Melihat history image

::: code-group
```sh [command]
docker history <nama image/tag>
```

```sh [contoh]
docker history alpine:3.18.4
```
:::

### Download docker image di Docker Hub

::: code-group

```sh [command]
docker pull <nama image>:<tag>
```


```sh [contoh]
docker pull alpine:3.18.4
```
:::

### Melihat daftar container berjalan

::: code-group

```sh [command 1]
docker ps
```


```sh [command 2]
docker container ls
```
:::

### Melihat semua daftar container (Termasuk yang berhenti)

::: code-group

```sh [command 1]
docker ps -a
```

```sh [command 2]
docker container ls -a
```
:::


### Membuat dan menjalankan container baru dari image 

::: code-group
```sh [command]
docker run <options> --name <nama container> <nama image:tag>
```

```sh [contoh 1]
docker run -it --name myServer alpine:3.18.4
```
```sh [contoh 2]
docker run -d --name myNginx -p 80:80 nginx:alpine3.18-slim
```
:::

## Docker Container Lifecycle

### Menjalankan container

::: code-group
```sh [command]
docker start <nama container/container id>
```

```sh [contoh]
docker start myNginx
```
:::

### Menghentikan container

::: code-group
```sh [command]
docker stop <nama container/container id>
```

```sh [contoh]
docker stop myNginx
```
:::

### Menghentikan container (Gracefully)

::: code-group
```sh [command]
docker stop <nama container/ container id>
```

```sh [contoh]
docker stop myNginx
```
:::

### Menghentikan container dengan paksa (Forcefully)

::: code-group
```sh [command]
docker kill <nama container/container id>
```

```sh [contoh]
docker kill myNginx
```
:::

### Restart container

::: code-group
```sh [command]
docker restart <nama container/ container id>
```

```sh [contoh]
docker restart myNginx
```
:::

### Menghapus container

::: code-group
```sh [command]
docker rm <nama container/container id>
```

```sh [contoh]
docker rm myNginx
```
:::

## Docker Configurasi
### Melakukan port forwarding

::: code-group
```sh [command]
docker run -d --name <nama container> --publish <port host>:<port container> <image>:<tag>
```

```sh [contoh]
docker run -d --name myNginx --publish 80:80 nginx:alpine3.18-slim
```
:::

#### Melihat port: yang digunakan oleh container

::: code-group
```sh
docker port <nama container/container id>
```

```sh [contoh]
docker port myNginx
```
:::

### Melihat detail config container

::: code-group
```sh [command]
docker inspect <nama container/container id>
```

```sh [contoh]
docker inspect myNginx
```
:::

### Melihat IP address container

::: code-group
```sh [command]
docker inspect --format '{{ .NetworkSettings.IPAddress }}' <nama container/container id>
```

```sh [contoh]
docker inspect --format '{{ .NetworkSettings.IPAddress }}' myNginx
```
:::

### Melihat process yang berjalan di dalam container

::: code-group
```sh [command]
docker top <nama container/container id>
```

```sh [contoh]
docker top myNginx
```
:::

### Container resource limit

::: code-group
```sh [command]
docker run -d --name <nama_container> --memory 512m --cpus 0.5 <image>:<tag>
```

```sh [contoh]
docker run -d --name myNginx --memory 512m --cpus 0.5 nginx:mainline.alpine3.18-slim
```
:::

### Menambahkan enviroment variable

::: code-group
```sh [command]
docker run -d --name <nama_container> --env <image>:<tag>
```

```sh [contoh]
docker run -d --name myMongo --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:latest
```
:::

## Docker Volume
### Melihat daftar volume

```sh
docker volume ls
```

### Membuat volume

```sh
docker volume create <nama volume>
```

### Menghapus volume

```sh
docker volume rm <nama volume>
```

### Menghubungkan volume ke container

membuat volume baru

```sh
docker volume create mongodata
```

::: code-group
```sh [command]
docker run -d --name <nama_container> --mount "type=volume,source=nama_volume,target=containerpath" <image>:<tag>
```

```sh [contoh 1] 
docker run -d --name myMongo --publish 27017:27017 --mount "type=volume,source=mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:latest
```

```sh [contoh 2]
docker run -d --name myNginx -p 80:80 -v $(pwd)/html:/usr/share/nginx/html nginx:latest
```
:::

### Melakukan mounting bind

::: code-group
```sh [command]
docker run -d --name <nama_container> --mount "type=bind,source=hostpath,target=containerpath" <image>:<tag>
```

```sh [contoh]
docker run -d --name myMongo --publish 27017:27017 --mount "type=bind,source=/home/hard/Documents/docker/mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:latest
```
:::

### Backup volume

```sh
docker run -d --name <nama_container> --mount "type=bind,source=pathhost,destination=pathhostbackup" --mount "type=volume,source=name_volume,destination=path_volume" <image>:<tag>
```

langkah-langkah pencadangan volume:
buat volume dengan nama volumemongo

```sh
docker volume create volumemongo
```

buat container imgae nginx dengan nama nginxbackup

```sh
docker run -d --name nginxbackup --mount "type=bind,source=/home/hard/docker/backupmongo,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" nginx:latest
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
docker run --rm --name ubuntu --mount "type=bind,source=/home/hard/docker/backupmongo,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backup2.tar.gz /data
```

### Restore volume

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
### Melihat network

```sh
docker network ls
```

### Membuat network

```sh
docker network create --driver <driver> <nama network>
```

### Menghapus network

```sh
docker network rm <nama network>
```

### Menghubungkan container ke network

membuat network baru
```sh
docker network create --driver bridge mongonetwork
```

::: code-group
```sh [command]
docker run -d --name <nama_container> --network <nama network> image:tag
```

```sh [membuat mongodb]
docker run -d --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=username --env MONGO_INITDB_ROOT_PASSWORD=password mongo:4.4.18
```

```sh [menghubungkan mongodb dengan mongoexpress]
docker run -d --name mongoexpress --publish 8081:8081 --network mongonetwork --env ME_CONFIG_MONGODB_URL="mongodb://username:password@mongodb:27017" mongo-express:latest
```
:::

### Menghapus container network

::: code-group
```sh [command]
docker network disconnect <nama_network> <nama_container>
```

```sh [contoh]
docker network disconnect mongonetwork myMongo
```
:::

untuk menghubungkan kembali:

::: code-group
```sh [command]
docker network connect <nama_network> <nama_container>
```

```sh [contoh]
docker network connect mongonetwork myMongo
```
:::

### Inspect

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

## Logs dan Debugging
### Melihat log container

::: code-group
```sh [command]
docker logs <nama container/container id>
```

```sh [contoh]
docker logs myNginx
```
:::

jika ingin melihat secara realtime

::: code-group
```sh [command]
docker logs -f nama_container/container_id
```

```sh [contoh]
docker logs -f myNginx
```
:::

### Melihat realtime penggunaan resource

:::code-group
```sh [command]
docker stats <nama container/container id>
```

```sh [contoh]
docker stats myNginx
```
:::

### Masuk ke dalam container yg berjalan (interactive shell)

:::code-group
```sh [command]
docker exec -it <nama container/container id> bash or sh or etc
```

```sh [contoh]
docker exec -it myNginx sh
```
:::


## Docker Cleanup 
### Perintah Prune

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

::: code-group
```sh [command]
docker image tag <nama_image> <username_dockerhub>/<nama_image>:<tag>
```

```sh [contoh]
docker image tag nginx hardhard/nginx
```
:::

push image ke docker hub

::: code-group
```sh [command]
docker image push <username_dockerhub>/<nama_image>:<tag>
```

```sh [contoh]
docker image push hardhard/nginx
```
:::

menambahkan tag baru

:::code-group
```sh [command]
docker image tag <username_dockerhub>/<nama_image_lama>:<tag_lama> <username_dockerhub>/<nama_image_baru>:<tag_baru>
```

```sh [contoh]
docker image tag hardhard/nginx:latest hardhard/nginx:testing
```
:::

## Docker Swarm
### Inisialisasi Docker Swarm

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
### Membuat Service

::: code-group
```sh [command]
docker service create --name <nama_service> --replicas <jumlah_replicas> --publish <port_host>:<port_container> <nama_image>:<tag>
```

```sh [contoh]
docker service create alpine ping 8.8.8.8
```
:::

### Melihat list service

```sh
docker service ls
```

### Melakukan update service (scale up/down)

::: code-group
```sh [command]
docker service update <id_container> --replicas <jumlah_replicas>
```

```sh [contoh]
docker service update nginx --replicas 5
```
:::

## Docker build

```sh
docker build -t <nama_image> <path_dockerfile>
```

untuk display output

```sh
docker build -t <nama_image> <path_dockerfile> --progress=plain
```

tanpa cache

::: code-group
```sh [command]
docker build -t <nama_image> <path_dockerfile> --no-cache
```

```sh [contoh]
docker build -t hard:latest /home/hard/docker/dockerfile --no-cache
```
:::

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

### Image docker: untuk mirror Android

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

### Image docker: web server

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
