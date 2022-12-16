<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="https://github.com/dwiHard/five_byte.github.io/blob/master/images/linux-22621.png" alt="Logo" width="140" height="100">
  </a>

<h3 align="center">README-Linux</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/README.md"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/Tips/linux.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/LinuxConfigBackup/MyConfig.md">Awesome Konfiguration</a>
  </p>
</div>


### Daftar isi
* [Basic Open Search](#basic-open-search)



#### Basic Open Search
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

### Terima Kasih