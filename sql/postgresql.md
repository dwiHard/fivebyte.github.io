## PostgreSQL
> disusun oleh Hardiyanto

<div align="center">
  <a href="https://www.postgresql.org/docs/">
    <img src="https://github.com/dwiHard/five_byte.github.io/blob/master/images/postgresql.png" alt="Logo" width="140" height="130">
  </a>

<h3 align="center">README-Postgresql</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://www.postgresql.org/docs/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/sql/postgresql.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My READMe</a>
  </p>
</div>

### Daftar Isi
* [Install Postgresql](#install-postgresql)
* [Quick Start](#quick-start)
* [Menampilkan semua database](#menampilkan-semua-database)
* [Membuat database](#membuat-database)
* [Masuk ke database](#masuk-ke-database)
* [Menghapus database](#menghapus-database)

#### Install Postgresql
untuk ubuntu
```
sudo apt-get update
```
```
sudo apt-get install postgresql postgresql-contrib
```
untuk menjalankan service postgresql
```
sudo systemctl start postgresql.service
```
untuk masuk ke postgresql
```
sudo -i -u postgres
```
install melalui docker
```
docker image pull postgres
```
install pgadmin
```
docker image pull fenglc/pgadmin4
```

#### Quick Start
Untuk membuat container postgresql
```
docker container create --name postgress --publish 5432:5432 --env POSTGRES_USER=username --env POSTGRES_PASSWORD=password --env POSTGRES_DB=belajar_psql postgres
```
jalankan container
```
docker container start postgress
```
masuk ke postgresql
```
docker exec -it postgress bash
```
menjalankan postgresql
```
psql --user <username> --password --db <nama_db>
```

#### Menampilkan semua database
```
\l
```
#### Membuat database
```
CREATE DATABASE test1;
```

#### Masuk ke database
```
\c test1;
```
#### Menghapus database
```
DROP DATABASE IF EXISTS test1;
```
