## MongoDB Cheatsheet
> disusun oleh Hardiyanto

<div align="center">
  <a href="https://www.mongodb.com/">
    <h1>Frida</h1>
  </a>

<h3 align="center">README-MongoDB</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://www.mongodb.com/docs"><strong>Explore the docs mongodb»</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/cheatsheet/mongodb.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My README</a>
  </p>
</div>

## Daftar Isi
* [Mongo Installation Docker](#mongo-installation-docker)
* [Basic Command CLI Cheatsheet](#basic-command-cli-cheatsheet)


### Mongo Installation Docker
menggunakan docker compose
```
version: "3.5"

services:
  mongo:
    container_name: mongo
    image: mongo
    ports:
      - 27017:27017
    command: mongod
```
untuk menjalankan
```
docker-compose up -d
```
untuk masuk ke container mongo
```
docker exec -it <nama_container> mongosh
```
untuk masuk menggunakan username dan password
```
docker exec -it <nama_container> mongosh -u root -p
```

### Basic Command CLI Cheatsheet 
melihat database yang ada
```
show dbs
```
masuk ke database
```
use <nama_database>
```
melihat database yang aktif
```
db
```
menghapus database
```
db.dropDatabase()
```
membuat collection
```
db.createCollection("<nama_collection>")
```
melihat collection yang ada
```
show collections
```
melihat data yang ada di collection
```
db.<nama_collection>.find()
```
melihat data yang ada di collection dengan format json
```
db.<nama_collection>.find().pretty()
```
melihat data yang ada di collection dengan limit
```
db.<nama_collection>.find().limit(10)
```
menghitung jumlah data yang ada di collection
```
db.<nama_collection>.count()
```
mencaari data dengan query
```
db.<nama_collection>.find({<field>:<value>})
```


## Terima Kasih