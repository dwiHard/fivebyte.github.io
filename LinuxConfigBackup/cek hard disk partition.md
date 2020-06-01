# Cek hard disk partitions

#### fdisk
Fdisk adalah perintah yang paling umum digunakan untuk memeriksa partisi pada disk. Perintah fdisk dapat menampilkan partisi dan detail seperti tipe sistem file. Namun itu tidak melaporkan ukuran setiap partisi.
```
$ sudo fdisk -l
```

#### parted

Parted adalah utilitas baris perintah lain untuk membuat daftar partisi dan memodifikasinya jika diperlukan.
Berikut adalah contoh yang mencantumkan detail partisi.
```
$ sudo parted -l
```

#### df
Df bukan utilitas partisi, tetapi mencetak rincian tentang hanya sistem file yang dipasang. Daftar yang dihasilkan oleh df bahkan mencakup sistem file yang bukan partisi disk nyata.
```
$ df -h
```
Ingin menampilkan hanya sistem file yang dimulai dengan / dev
```
$ df -h | grep ^/dev
```
Untuk menampilkan partisi disk nyata bersama dengan tipe partisi, gunakan df seperti ini
```
$ df -h --output=source,fstype,size,used,avail,pcent,target -x tmpfs -x devtmpfs
```
#### lsblk

Daftar semua blok penyimpanan, yang mencakup partisi disk dan drive optik. Rincian termasuk ukuran total partisi / blok dan titik pemasangan jika ada.
Tidak melaporkan ruang disk yang digunakan / kosong pada partisi.
```
$ lsblk
```
#### blkid

Mencetak atribut perangkat blok (partisi dan media penyimpanan) seperti tipe uuid dan sistem file. Tidak melaporkan ruang di partisi.
```
$ sudo blkid
```


##### Sekian dan Terima Kasih
