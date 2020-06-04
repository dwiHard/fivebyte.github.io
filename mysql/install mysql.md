# Install MySQL server di Ubuntu 18.04

### Daftar Isi
* [Install MySQL](#install-mysql)
* [Izinkan Remote akses](#izinkan-remote-akses)
* [Launch at reboot](#launch-at-reboot)
* [Configure interfaces](#configure-interfaces)
* [Start the mysql shell](#start-the-mysql-shell)
* [Set the root password](#set-the-root-password)
* [Buat User Baru](#buat-user-baru)



#### Install MySQL 
```
$ sudo apt-get update
```
```
$ sudo apt-get install mysql-server
```
```
$ sudo mysql_secure_installation utility
```
Utilitas ini meminta Anda untuk menentukan kata sandi root mysql dan opsi terkait keamanan lainnya, termasuk menghapus akses jarak jauh ke pengguna root dan mengatur kata sandi root.


#### Izinkan Remote akses
Jika Anda memiliki iptables yang diaktifkan dan ingin terhubung ke database MySQL dari komputer lain, Anda harus membuka port di firewall server Anda (port default adalah 3306). Anda tidak perlu melakukan ini jika aplikasi yang menggunakan MySQL berjalan di server yang sama.
```
$ sudo ufw enable
```
```
$ sudo ufw allow mysql
```
#### Start the MySQL service
```
$ sudo systemctl start mysql
```

#### Launch at reboot
```
$ sudo systemctl enable mysql
```

#### Configure interfaces
```
bind-address		= 127.0.0.1 ( The default. )
bind-address		= XXX.XXX.XXX.XXX ( The ip address of your Public Net interface. )
bind-address		= ZZZ.ZZZ.ZZZ.ZZZ ( The ip address of your Service Net interface. )
bind-address		= 0.0.0.0 ( All ip addresses. )
```

##### Start the mysql shell
```
$ mysql -u root -p
```

##### Set the root password
```
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```
Kemudian, jalankan FLUSH PRIVILEGES yang memberi tahu server untuk memuat ulang tabel dan menerapkan perubahan baru Anda:
```
mysql> FLUSH PRIVILEGES;
```

##### Buat User Baru 
```
mysql> CREATE USER 'hard'@'localhost' IDENTIFIED BY 'password';
```
Lalu, beri pengguna baru Anda hak istimewa yang sesuai. Misalnya, Anda bisa memberikan hak pengguna untuk semua tabel dalam database, serta kekuatan untuk menambah, mengubah, dan menghapus hak pengguna, dengan perintah ini:
```
mysql> GRANT ALL PRIVILEGES ON *.* TO 'hard'@'localhost' WITH GRANT OPTION;
```

