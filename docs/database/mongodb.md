## Mongo Installation Docker

menggunakan docker compose

```yaml
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

```sh
docker-compose up -d
```

untuk masuk ke container mongo

```sh
docker exec -it <nama_container> mongosh
```

untuk masuk menggunakan username dan password

```sh
docker exec -it <nama_container> mongosh -u root -p
```

## Basic Command CLI Cheatsheet

melihat database yang ada

```sh
show dbs
```

masuk ke database

```sh
use <nama_database>
```

melihat database yang aktif

```sh
db
```

menghapus database

```sh
db.dropDatabase()
```

membuat collection

```sh
db.createCollection("<nama_collection>")
```

melihat collection yang ada

```sh
show collections
```

melihat data yang ada di collection

```sh
db.<nama_collection>.find()
```

melihat data yang ada di collection dengan format json

```sh
db.<nama_collection>.find().pretty()
```

melihat data yang ada di collection dengan limit

```sh
db.<nama_collection>.find().limit(10)
```

menghitung jumlah data yang ada di collection

```sh
db.<nama_collection>.count()
```

mencaari data dengan query

```sh
db.<nama_collection>.find({<field>:<value>})
```

## Terima Kasih