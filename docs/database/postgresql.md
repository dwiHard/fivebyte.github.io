## Install Postgresql

untuk ubuntu

```sh
sudo apt-get update
```

```sh
sudo apt-get install postgresql postgresql-contrib
```

untuk menjalankan service postgresql

```sh
sudo systemctl start postgresql.service
```

untuk masuk ke postgresql

```sh
sudo -i -u postgres
```

install melalui docker

```sh
docker image pull postgres
```

install pgadmin

```sh
docker image pull fenglc/pgadmin4
```

## Quick Start

Untuk membuat container postgresql

```sh
docker container create --name postgress --publish 5432:5432 --env POSTGRES_USER=username --env POSTGRES_PASSWORD=password --env POSTGRES_DB=belajar_psql postgres
```

jalankan container

```sh
docker container start postgress
```

masuk ke postgresql

```sh
docker exec -it postgress bash
```

menjalankan postgresql

```sh
psql --user <username> --password --db <nama_db>
```

## Menampilkan semua database

```postgresql
\l
```

## Membuat database

```postgresql
CREATE DATABASE test1;
```

## Masuk ke database

```postgresql
\c test1;
```

## Menghapus database

```postgresql
DROP DATABASE IF EXISTS test1;
```
