## Basic Open Search

Get data root

```
GET /
```

Buat data index

```
PUT /my-first-index
```

Menambahkan data dengan id 1

```
PUT /my-first-index/_doc/1
{
  "name": "Hardiyanto"
}
```

Mendapatkan data berdasarkan id

```
GET /my-first-index/_doc/1
```

Hapus data 

```
DELETE /my-first-index/_doc/1
```

Hapus data index

```
DELETE /my-first-index
```

## Terima Kasih