# Configuration MySQL Server :blush:
```$ sudo mysql_secure_installation ```</br>
```$ sudo mysql ```</br>

Buat user root dan passwordnya:</br>
 ```mysql>  ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';```</br>

Kemudian, jalankan FLUSH PRIVILEGES yang memberi tahu server untuk memuat ulang tabel dan menerapkan perubahan baru:</br>
```mysql>  FLUSH PRIVILEGES;```</br>
```mysql> exit;```</br>

Referensi: </br>
[https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04]
