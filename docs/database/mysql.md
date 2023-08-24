## Install MySQL 

```sh
sudo apt-get update
```

```sh
sudo apt-get install mysql-server
```

```sh
sudo mysql_secure_installation utility
```

Utilitas ini meminta Anda untuk menentukan kata sandi root mysql dan opsi terkait keamanan lainnya, termasuk menghapus akses jarak jauh ke pengguna root dan mengatur kata sandi root.

## Setup MySQL

```sh
sudo mysql -u root
```

ketikan ini di mysql server

```sql
USE mysql;
```

```sql
UPDATE user SET plugin='mysql_native_password' WHERE User='root';
```

Jika ingin menambahkan password ikuti langkah dibawah, jika tidak lompati langkah dibawah ini langsung Flush Privileges

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'new-password';
```

```sql
FLUSH PRIVILEGES;
```

ketikan ini di command line

```sh
sudo service mysql restart
```

## Izinkan Remote akses

Jika Anda memiliki iptables yang diaktifkan dan ingin terhubung ke database MySQL dari komputer lain, Anda harus membuka port di firewall server Anda (port default adalah 3306). Anda tidak perlu melakukan ini jika aplikasi yang menggunakan MySQL berjalan di server yang sama.

```sh
sudo ufw enable
```

```sh
sudo ufw allow mysql
```

## Start the MySQL service

```sh
sudo systemctl start mysql
```

## Launch at reboot

```sh
sudo systemctl enable mysql
```

## Configure interfaces

```
bind-address		= 127.0.0.1 ( The default. )
bind-address		= XXX.XXX.XXX.XXX ( The ip address of your Public Net interface. )
bind-address		= ZZZ.ZZZ.ZZZ.ZZZ ( The ip address of your Service Net interface. )
bind-address		= 0.0.0.0 ( All ip addresses. )
```

## Start the mysql shell

```sh
mysql -u root -p
```

## Error MySQL

Coba jalankan dibawah ini

```sh
sudo chown mysql:mysql -R /var/log/mysql
```

```sh
sudo chmod -R u+rwx /etc/mysql/
```

```sh
sudo chown -R mysql.mysql /etc/mysql/
```

## ERROR 1055 (42000)

```
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'data_siswa.siswa.nama_siswa' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
```

ketikan ini di mysql servernya

```sql
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY','')); 
```

## ERROR Hak Akses

```sql
SHOW GRANTS FOR 'user'@'172.0.0.1';
```

## Uninstall MySQL

## Re-install MySQL Server

Berikut langkahnya : <br>

```sh 
sudo apt-get purge mysql-server mysql-common mysql-client 
```

```sh 
sudo apt-get install mysql-client mysql-server mysql-common
````

## Configure MySQL

## Show user

```sql
SELECT user FROM user.mysql;
```

## Show Hak Akses
```sql
SHOW GRANTS FOR 'coba'@'localhost';
```

## Set the root password

ketikan ini di dalam mysql server

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

Kemudian, jalankan FLUSH PRIVILEGES yang memberi tahu server untuk memuat ulang tabel dan menerapkan perubahan baru Anda:

```sql
FLUSH PRIVILEGES;
```

## Allow IP Address

edit file **sudo nvim /etc/mysql/my.cnf**

```sql
[mysqld]
bind-address = 0.0.0.0
```

masuk ke mysql server lalu jalankan perintah

```sql
CREATE USER 'hard'@'192.168.x.x' IDENTIFIED BY 'password';
```

```sql
GRANT ALL PRIVILEGES ON `java`.* TO `hard`@`192.168.x.x` WITH GRANT OPTION;
```

## Buat User Baru

ketika ini di my sql server

```sql
CREATE USER 'hard'@'localhost' IDENTIFIED BY 'password';
```

## Hak Akses user

ketikan ini di my sql server

```sql
GRANT ALL PRIVILEGES ON NAMA_DATABASE . NAMA_TABEL  TO 'hard'@'localhost' WITH GRANT OPTION;
```

## Cabut Hak Akses

ketikan ini di mysql server

```sql
REVOKE  ALL PRIVILEGES ON NAMA_DATABASE . NAMA_TABEL FROM 'coba'@'localhost';
```

## Option Hak Akses

```ALL PRIVILEGES```- seperti yang kita lihat sebelumnya, ini akan memungkinkan pengguna MySQL akses penuh ke database yang ditunjuk (atau jika tidak ada database yang dipilih, akses global di seluruh sistem).<br>
```CREATE```- memungkinkan mereka untuk membuat tabel atau database baru.<br>
```DROP``` - memungkinkan mereka untuk menghapus tabel atau database.<br>
```DELETE``` - memungkinkan mereka untuk menghapus baris dari tabel.<br>
```INSERT``` - memungkinkan mereka untuk memasukkan baris ke dalam tabel.<br>
```SELECT``` - memungkinkan mereka untuk menggunakan perintah SELECT untuk membaca database.<br>
```UPDATE``` - memungkinkan mereka untuk memperbarui baris tabel.<br>
```GRANT OPTION``` - memungkinkan mereka untuk memberikan atau menghapus hak pengguna lain.<br>

## Melihat Detail User
ketikan ini di mysql server

```sql
SELECT * FROM mysql.user;
```

```sql
SELECT host, user, password FROM mysql.user;
```

```sql
DESC mysql.user;
```

## Hapus User

```sql
drop user coba@localhost;
```

## Reload

ketikan ini di mysql server

```sql
FLUSH PRIVILEGES;
```

## Reset the MySQL/MariaDB Root Password

Untuk set root :

```sh
sudo mysqladmin --user=root password "newpassword"
```

Untuk reset password :

```sh
sudo mysqladmin --user=root --password=oldpassword password "newpassword"
```

## Show Variable password

```sql
SHOW VARIABLES LIKE 'validate_password%';
```

## Show Status Connection

```sql
SHOW status WHERE `variable_name` = 'Threads_connected';
```

or

```sql
SHOW processlist;
```

## Basic MySQL

## Buat Tabel

```sql
CREATE TABLE `data` (
	`id_dataSpasial` INT(11) NOT NULL AUTO_INCREMENT,
	`batas_wilayah` VARCHAR(20),
	`data_kejadian` VARCHAR(20),
	PRIMARY KEY (`id_data`)
);
```

## Melihat Source Code

```sql
SHOW CREATE TABLE nama_table \G
```

## Untuk Melihat Struktur Tabel

```sql
DESC NamaTabel;
```

## Select Distinct

```sql
SELECT DISTINCT select_list
FROM table_name;
```

## Hapus Tabel

```sql
DROP TABLE namaTabel;
```

## Hapus FOREIGN KEY

```sql
ALTER TABLE NamaTabelSekarang
DROP FOREIGN KEY FK_NamaField; 
```

## Hapus FOREIGN KEY (constraint)

```sql
ALTER TABLE NamaTabelSekarang
DROP CONSTRAINT FK_NamaField; 
```

## Insert tabel

```sql
INSERT INTO nama_tabel (column1, column2, column3,...)
VALUES (value1, value2, value3,...)
```

## Update tabel

```sql
UPDATE table_name
SET column1=value, column2=value2,...
WHERE some_column=some_value 
```

## Delete data

```sql
DELETE FROM nama_tabel WHERE column = value
```

Misalkan :

```sql
DELETE FROM coba WHERE id = 1
```

## Alter Table on FOREIGN KEY

```sql
ALTER TABLE NamaTabelSekarang
ADD FOREIGN KEY (NamaField) 
REFERENCES NamaTabelKunci(NamaField); 
```

## Alter Table on FOREIGN KEY (constraint)

```sql
ALTER TABLE NamaTabelSekarang
ADD CONSTRAINT FK_NamaField
FOREIGN KEY (NamaField) REFERENCES NamaTabelKunci(NamaField); 
```

## Limit Data

```sql
SELECT * FROM nama_tabel LIMIT 30
```

## BruteForce phpmyadmin

```sh
curl https://raw.githubusercontent.com/safflower/phpmyadmin-authentication-bruteforce/master/main.py > main.py
```

```sh
python3 main.py -url http://example.com/pma/ -user root -dict password.txt
```

Bisa dilihat link dibawah ini :
https://github.com/safflower/phpmyadmin-authentication-bruteforce

## Backup MySQL

```sh
mysqldump -u USERNAME -p PASSWORD NAMA_DATABASE --ignore-table=NAMA_TABEL > backup_database.sql
```


## Terima Kasih
