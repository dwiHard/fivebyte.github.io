## Linux PHP Security

## Cek PHP Module 

```sh
php -m
```

Saya menyarankan Anda menggunakan PHP dengan modul yang dikurangi untuk kinerja dan keamanan.

```sh
sudo rm /etc/php.d/sqlite3.ini
```

Atau

```sh
sudo mv /etc/php.d/sqlite3.ini /etc/php.d/sqlite3.disable
```

Jika ingin compile dan reinstall 

```sh
./configure --with-libdir=lib64 --with-gd --with-mysql --prefix=/usr --exec-prefix=/usr \
--bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share \
--includedir=/usr/include --libexecdir=/usr/libexec --localstatedir=/var \
--sharedstatedir=/usr/com --mandir=/usr/share/man --infodir=/usr/share/info \
--cache-file=../config.cache --with-config-file-path=/etc \
--with-config-file-scan-dir=/etc/php.d  --enable-fastcgi \
--enable-force-cgi-redirect
```

lihat https://www.php.net/manual/en/install.unix.php

## Batasi Kebocoran Informasi PHP

Edit dan jalankan :
pastikan ```expose_php=Off``` Jika belum cari di :<br>

```sh
vi /etc/php/7.3/apache2/php.ini
```

## Catat Semua Kesalahan PHP

Jangan memaparkan pesan kesalahan PHP ke semua pengunjung situs. Edit :

```sh
vi /etc/php/7.3/apache2/php.ini
```

```
display_errors=Off
```

Pastikan Anda mencatat semua kesalahan php ke file log:

```
log_errors=On
error_log=/var/log/httpd/php_scripts_error.log
```

## Mengunggah File

Edit :

```sh
vi /etc/php/7.3/apache2/php.ini
```

disable alasan keamanan

```
file_uploads=Off
```

Jika Menbutuhkan file upload beri batasan 

```
file_uploads=On
```

```
upload_max_filesize=1M
```

## Nonaktifkan Eksekusi Kode Jarak Jauh

Nonaktifkan permintaan file sebagai fopen panggilan dengan yang berikut ini :

```sh
vi /etc/php/7.3/apache2/php.ini
```

```
allow_url_fopen=Off
```

Saya juga merekomendasikan untuk menonaktifkan allow_url_include untuk alasan keamanan:

```
allow_url_include=Off
```

## Aktifkan SQL Safe Mode

Jika ingin mengakftikan :

```sh
vi /etc/php/7.3/apache2/php.ini
```

```
sql.safe_mode=On
```

Jika Anda mengatur sql.safe_mode, Anda perlu mengatur yang berikut ini juga:

```
mysqli.default_host = "192.168.1.252"
mysqli.default_port = "3306"
mysqli.default_user = "userNameHere"
mysqli.default_pw = "PasswordHere"
```

Jika dinyalakan, mysql_connect () dan mysql_pconnect () mengabaikan argumen apa pun yang diberikan kepada mereka. Harap dicatat bahwa Anda mungkin harus membuat beberapa perubahan pada kode Anda. Aplikasi pihak ketiga dan sumber terbuka seperti WordPress, dan lainnya mungkin tidak berfungsi sama sekali ketika sql.safe_mode diaktifkan. Saya juga menyarankan Anda mematikan magic_quotes_gpc untuk semua instalasi php 5.3.x karena penyaringannya tidak efektif dan tidak terlalu kuat.
mysql_escape_string () dan fungsi penyaringan kustom memiliki tujuan yang lebih baik.

```
magic_quotes_gpc=Off
```

## Control POST Size

Metode permintaan HTTP POST digunakan ketika klien (browser atau pengguna) perlu mengirim data ke server web Apache sebagai bagian dari permintaan, seperti ketika mengunggah file atau mengirimkan formulir yang sudah diisi.Penyerang dapat mencoba mengirim permintaan POST yang terlalu besar untuk memakan sumber daya sistem Anda. Anda dapat membatasi permintaan POST ukuran maksimum yang akan diproses PHP.

```sh
vi /etc/php/7.3/apache2/php.ini
```

```
post_max_size=1K
```

1K menetapkan ukuran maksimal data posting yang diizinkan oleh aplikasi php. Pengaturan ini juga memengaruhi unggahan file. Untuk mengunggah file besar, nilai ini harus lebih besar dari upload_max_filesize. Saya juga menyarankan agar Anda membatasi metode yang tersedia menggunakan server web Apache. Edit, httpd.conf :

```
<directory /var/www/html>
    <limitExcept GET POST>
        Order allow,deny
    </limitExcept>
## Add rest of the config goes here... ##
</directory>
```

## Resource Control / DoS Control

Anda dapat mengatur waktu eksekusi maksimum dari setiap skrip php, dalam detik. Opsi rekomendasi lainnya adalah mengatur jumlah waktu maksimum setiap skrip dapat menghabiskan data permintaan parsing, dan jumlah maksimum memori yang dapat digunakan skrip.

```
max_execution_time =  30
max_input_time = 30
memory_limit = 40M
```

## Instal Suhosin Advanced Protection System untuk PHP

Suhosin adalah sistem perlindungan canggih untuk instalasi PHP. Itu dirancang untuk melindungi server dan pengguna dari kekurangan yang dikenal dan tidak dikenal dalam aplikasi PHP dan inti PHP.


## Menonaktifkan Fungsi PHP Berbahaya

PHP memiliki banyak fungsi yang dapat digunakan untuk memecahkan server Anda jika tidak digunakan dengan benar.

```
disable_functions =exec,passthru,shell_exec,system,proc_open,popen,curl_exec,curl_multi_exec,parse_ini_file,show_source
```

## PHP Fastcgi / CGI – cgi.force_redirect Directive

PHP bekerja dengan FastCGI. Fascgi mengurangi jejak memori server web Anda, tetapi masih memberi Anda kecepatan dan kekuatan seluruh bahasa PHP. Arahan konfigurasi cgi.force_redirect mencegah siapa pun untuk memanggil PHP secara langsung dengan URL seperti http://www.cyberciti.biz/cgi-bin/php/hackerdir/backdoor.php. Aktifkan cgi.force_redirect untuk alasan keamanan.

```
cgi.force_redirect=On
```

## PHP User and Group ID

mod_fastcgi adalah cgi-module untuk server web Apache. Itu dapat terhubung ke server FASTCGI eksternal. Anda harus memastikan php dijalankan sebagai pengguna non-root. Jika PHP dieksekusi sebagai root atau UID di bawah 100, ia dapat mengakses dan / atau memanipulasi file sistem.


## Linux PHP Error

PHP module gd: Missing - Only an issue if you want to play with captchas

```sh
sudo apt-get install vim apache2 php7.3
```

```sh
sudo apt-get install mariadb-server mariadb-client php7.3-mysql php7.3-gd 
```

```sh
sudo  apt-get install git
```

## Configure Apache2 untuk codeigniter

## Problem Install Codeigniter 4

```
Creating a "codeigniter4/appstarter" project at "./app"
Installing codeigniter4/appstarter (v4.1.1)
  - Installing codeigniter4/appstarter (v4.1.1): Extracting archive
Created project in /var/www/html/codeigniter/app
Loading composer repositories with package information
Updating dependencies
Your requirements could not be resolved to an installable set of packages.

  Problem 1
    - codeigniter4/framework[4.0.0, ..., v4.1.1] require ext-intl * -> it is missing from your system. Install or enable PHP's intl extension.
    - Root composer.json requires codeigniter4/framework ^4 -> satisfiable by codeigniter4/framework[4.0.0, ..., v4.1.1].

    ..............
```

Fix

```sh
sudo apt install php-intl
```

```sh
composer install
```

## Install PHP

```sh
sudo apt install libapache2-mod-php7.4 php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-gd php-imagick php7.4-cli php7.4-mbstring php7.4-zip php7.4-bcmath -y
```

## Change 2 host virtualhost apache2

Buat Folder

```sh
sudo mkdir -p /var/www/hard.com/public_html
```

```sh
sudo mkdir -p /var/www/hard2.com/public_html
```

Grant permission

```sh
sudo chown -R $USER:$USER /var/www/hard.com/public_html
```

```sh
sudo chown -R $USER:$USER /var/www/hard2.com/public_html
```

```sh
sudo chmod -R 755 /var/www
```

salin domain ```000-default.conf```

```sh
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/hard.com.conf
```

```sh
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/hard2.com.conf
```

lalu open file ```hard.com.conf``` & ```hard2.com.conf``` rubah dan sesuikan :

```sh
sudo vi /etc/apache2/sites-available/hard.com.conf
```

```
<VirtualHost *:80> 
        ServerAdmin hard
        ServerName hard.com  
        DocumentRoot /var/www/hard.com/public_html/ 
</VirtualHost> 
```

Untuk Mengaktikan site

```sh
sudo a2ensite hard.com.conf
```

```sh
sudo a2ensite hard.com.conf
```

Untuk Mematikan site

```sh
sudo a2dissite 000-default.conf
```

Lalu

```sh
sudo systemctl restart apache2
```

```sh
 sudo service apache2 restart
```

Set Hosts

```sh
sudo vi /etc/hosts
```

```
IP kamu       hard.com
IP kamu       hard2.com
```

## Redirect Http to Https

```sh
sudo a2enmod rewrite
```

```sh
sudo a2enmod ssl
```

Edit file

```sh
/etc/apache2/sites-available/000-default.conf
```

```
<VirtualHost *:80>
    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}
</VirtualHost>

<VirtualHost *:443>
    SSLEngine on
    SSLCertificateFile    <path to your crt file>
    SSLCertificateKeyFile   <path to your private key file>

    # Rest of your site config
    # ...
</VirtualHost>
```

Atau bisa juga tambahkan file di root dir dengan nama ```.htaccess```

```
RewriteEngine on
RewriteCond %{HTTPS} off
RewriteRule ^(.*) https://%{HTTP_HOST}/$1
```

Langkah terakhir adalah

```sh
sudo service apache2 restart
```

## Configure cloudflare origin ca apache

Buat folder

```sh
sudo mkdir -p /etc/cloudflare/
```

copy cert dan key

```sh
sudo vi /etc/cloudflare/hard.com.pem
```

pastekan  ***Origin Certificate*** 

```sh
sudo vi /etc/cloudflare/hard.com.key
```

pastekan ***Private Key***

## Mengaktikan ssl

```sh
sudo a2enmod ssl
```

```sh
sudo service apache2 restart
```

## Configure apache2 dengan ssl

```sh
sudo vi /etc/apache2/sites-available/hard.com.conf
```

```
<VirtualHost *:80> 
        ServerAdmin hard  
        ServerName hard.com  
        DocumentRoot /var/www/hard.com/public_html/ 
</VirtualHost> 
 
 
<IfModule mod_ssl.c> 
<VirtualHost IP_Publik:443> 
 
    ServerAdmin hard  
    ServerName "hard" 
    ServerAlias hard.com
    DocumentRoot /var/www/hard.com/public_html/
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    SSLEngine on
    SSLCertificateFile /etc/cloudflare/hard.com.pem
    SSLCertificateKeyFile /etc/cloudflare/hard.com.key

</VirtualHost>
</IfModule>
```

Untuk Mengaktikan site

```sh
sudo a2ensite hard.com.conf
```

Untuk Mematikan site

```sh
sudo a2dissite 000-default.conf
```

Lalu

```sh
sudo systemctl restart apache2
```

```sh
 sudo service apache2 restart
```

Set Hosts

```sh
sudo vi /etc/hosts
```

```
IP kamu       hard.com
```

## Configure Apache2 untuk laravel
## Intall PHP7.4

```sh
sudo apt update && sudo apt upgrade
```

```sh
sudo apt install software-properties-common
```

```sh
sudo add-apt-repository ppa:ondrej/php
```

```sh
sudo apt update
```

```sh
sudo apt install libapache2-mod-php7.4 php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-gd php-imagick php7.4-cli php7.4-mbstring php7.4-zip php7.4-bcmath -y
```

edit apache2.conf

```sh
sudo vi /etc/apache2/apache2.conf 
```

```sh
sudo a2enmod rewrite
```

```sh
sudo service apache2 restart
```

## Downgrade PHP8.1 to PHP7.4

```sh
sudo update-alternatives --config php
```

## Htaccess laravel

```
<IfModule mod_rewrite.c>
# That was ONLY to protect you from 500 errors
# if your server did not have mod_rewrite enabled

RewriteEngine On
# RewriteBase /
# NOT needed unless you're using mod_alias to redirect

RewriteCond %{REQUEST_URI} !/public
RewriteRule ^(.*)$ public/$1 [L]
# Direct all requests to /public folder

</IfModule>
```

## Problem Apache2

## Apache2 error log

```sh
sudo apachectl configtest
```

```
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
(2)No such file or directory: AH02291: Cannot access directory '/var/log/apache2/' for main error log
(2)No such file or directory: AH02291: Cannot access directory '/var/log/apache2/' for error log of vhost defined at /etc/apache2/sites-enabled/000-default.conf:1
AH00014: Configuration check failed
Action 'configtest' failed.
The Apache error log may have more information.
```

```sh
sudo mkdir -p /var/log/apache2/
```

```sh
sudo chmod -R 744 /var/log/apache2/
```

```sh
sudo systemctl restart apache2
```

## Apache2 error module mpm_event

```
Considering conflict mpm_event for mpm_prefork:
ERROR: Module mpm_event is enabled - cannot proceed due to conflicts. It needs to be disabled first!
Considering conflict mpm_worker for mpm_prefork:
ERROR: Could not enable dependency mpm_prefork for php7.3, aborting
```

fix :

```sh
sudo a2dismod mpm_event
```

```sh
sudo a2enmod mpm_prefork
```

```sh
sudo systemctl restart apache2
```

```sh
php -v
```

samakan dengan versi phpnya

```sh
sudo a2enmod php7.3
```

## Dom missing
Error Message

```
the requested PHP extension dom is missing from your system.
```

fixing

```sh
sudo apt-get install php-xml
```

## PHP extension curl is missing

Error message

```
the requested PHP extension curl is missing from your system
```

```sh
sudo apt-get install php-curl
```

## Terima Kasih
