## Install Web Server Pada Arch Linux

install apache

```sh
sudo pacman -S apache 
```

menjalankan/mematikan service

```sh
sudo systemctl start httpd.service 
```

```sh
sudo systemctl stop httpd.service 
```

install mariadb

```sh
sudo pacman -S mariadb
```

Konfigurasi mariadb

```sh
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
```

```sh
sudo mysql_secure_installation
```

menjalankan/mematikan service

```sh
sudo systemctl start mariadb.service
```

```sh
sudo systemctl stop mariadb.service
```

install php

```sh
sudo pacman -S php php-apache php-cgi php-gd php-imap
```

konfigurasi php

```sh
sudo vim /etc/php/php.ini
```

untuk menampilkan error

```
display_errors = on
```

hapus komentar dan edit seperti ini

```
date.timezone = Asia/Jakarta
```

konfigurasi hhtpd

```sh
sudo vim /etc/httpd/conf/httpd.conf
```

melihat list module

```sh
ls /etc/httpd/modules/ 
```

cek status konfigurasi apache server 

```sh
sudo apachectl configtest
```

## Membuat User Baru

```sh
adduser hard
```

```sh
usermod -aG sudo hard
```

## SSH Configure
## Copy SSH Key

```sh
su - hard
```

```sh
sudo mkdir ~/.ssh
```

```sh
sudo chmod 700 ~/.ssh
```

```sh
sudo nano ~/.ssh/authorized_keys
```

```sh
sudo chmod 600 ~/.ssh/authorized_keys
```

```sh
sudo exit
```

## Login Automatis ssh

Pastikan Anda sudah membuat ssh keygen jika belum ketikan :

```sh
ssh-keygen
```

Jika sudah langsung ketikkan :

```sh
ssh-copy-id user@ip 
```

## Config SSH Server

Keterangan port : <br>
Ports 0-1023 = system or well-known ports. <br>
Ports 1024-49151 = user or registered ports. <br>
Ports 49152-65535 = dynamic / private ports. <br>

Untuk Konfigurasi ikuti cara berikut :

```sh
vim /etc/ssh/sshd_config
```

Rubah seperti ini

```bash
Port 50000
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
```

keluar dari text editor

```sh
sudo systemctl restart ssh
```

```sh
sudo systemctl status ssh
```

## Config SSH Login 

```bash
Host NamaServer
	Hostname HostServer
	User UserServer
	port portServer
	identityFile ~/.ssh/id_rsa_tes
```

## Set Timezone

```sh
timedatectl set-timezone Asia/Jakarta
```

```sh
date
````

## Update System

```sh
sudo apt update
```

```sh
sudo apt upgrade -y
```

```sh
sudo reboot
```

## Transfer File

```sh
scp crud.zip server:~/
```

## Install Apache

```sh
sudo apt install apache2 -y
```

## Membuat Virtual Host

```sh
mkdir /var/www/hard.com
```

```sh
vim /var/www/hard.com/index.html
```

```sh
cd /etc/apache2/sites-available
```

```sh
sudo vi hard.com.conf
```

```bash
<VirtualHost *:80>
    ServerName hard.com
    ServerAlias www.hard.com
    DocumentRoot /var/www/hard.com
    <Directory /var/www/hard.com>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog /var/log/apache2/hard.com_error.log
    CustomLog /var/log/apache2/hard.com_access.log combined
</VirtualHost>
```

```sh
sudo a2ensite hard.com.conf
```

```sh
sudo a2enmod rewrite
```

```sh
sudo systemctl restart apache2
```

```sh
sudo systemctl status apache2
```

## Install PHP 7.4

```sh
sudo apt show php
```

https://launchpad.net/~ondrej/+archive/ubuntu/php

```sh
sudo apt install software-properties-common -y
```

```sh
sudo add-apt-repository ppa:ondrej/php
```

```sh
sudo apt install libapache2-mod-php7.4 php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-gd php-imagick php7.4-cli php7.4-mbstring php7.4-zip php7.4-bcmath -y
```

```sh
php -v
```

```sh
php -m
```

```sh
sudo apt search php7.4
```

```sh
sudo vi /var/www/hard.com/info.php
```

```bash
<?php phpinfo(); ?>
```

```sh
sudo vi /etc/php/7.4/apache2/php.ini
```

```bash
upload_max_filesize = 10M
post_max_size = 10M
```

```sh
sudo systemctl restart apache2
```

## Install phpmyadmin

```sh
sudo apt install -y apache2 mysql-server php libapache2-mod-php php-mysql -y 
```

```sh
sudo apt install phpmyadmin php-json php-curl php-mbstring php-zip
```

## Install composer

```sh
sudo apt install curl php7.4-cli php7.4-mbstring git unzip -y
```

```sh
curl –sS https://getcomposer.org/installer | php
```

```sh
sudo mv composer.phar /usr/local/bin/composer
```

Di Ubuntu 18.04 bisa juga langsung :

```sh
sudo apt update
```

```sh
sudo apt install composer
```
Composer on docker

```sh
docker pull composer:<tags>
```
Cara Penggunaan

```sh
docker run --rm --interactive --tty \
  --volume $PWD:/app \
  composer <command>
```

Dicontoh ini saya akan menggunakan composer untuk install laravel
```sh
docker run --rm --interactive --tty \
  --volume $PWD:/app \
  composer:<tags> create-project laravel/laravel <nama-project>
```
## Install MariaDB 10.4

Default MariaDB 10.1

```sh
sudo apt show mariadb-server
```

https://downloads.mariadb.org/mariadb/repositories/

```sh
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
```

```sh
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sgp1.mirrors.digitalocean.com/mariadb/repo/10.4/ubuntu bionic main'
```

```sh
sudo apt install mariadb-server -y
```

```sh
sudo systemctl status mariadb
```

```sh
sudo mysql_secure_installation
```

```sh
sudo mysql -u root -p
```

```sql
mysql> CREATE DATABASE toko;
```

```sql
mysql> CREATE USER 'hard'@'localhost' IDENTIFIED BY 'rahasia';
```

```sql
mysql> GRANT ALL PRIVILEGES ON toko.* TO 'musa'@'localhost';
```

```sql
mysql> FLUSH PRIVILEGES;
```

```sql
mysql> exit
```

```sh
cd /home/hard
```

```sh
unzip crud.zip
```

```sh
sudo mysql -u musa -p toko < crud/toko.sql
```

```sh
cp -v crud/* /var/www/hard.com/
```

```sh
cd /var/www
```

```sh
sudo rm hard.com/index.html
```

```sh
sudo chown -R hard:www-data hard.com
```

```sh
sudo chmod -R 775 hard.com
```

```sh
sudo ls -l 
```

## Install SSL Let's Encrypt untuk Apache
https://certbot.eff.org/all-instructions

```sh
sudo add-apt-repository ppa:certbot/certbot
```

```sh
sudo apt install certbot python3-certbot-apache -y
```

```sh
certbot --apache -d hard.com -d www.hard.com
```

jika command diatas tidak bisa dijalankan maka ikuti command dibawah ini
Checking Your Apache Virtual Host Configuration

```sh
sudo vi /etc/apache2/sites-available/your_domain.conf
```

edit

```bash
ServerName your_domain;
SeverAlias www.your_domain
```

```sh
sudo apache2ctl configtest
```

```sh
sudo systemctl reload apache2
```

izinkan firefall

```sh
sudo ufw status
```

```sh
sudo ufw allow 'Apache Full'
```

```sh
sudo ufw delete allow 'Apache'
```

```sh
sudo ufw status
```

Mendapatkan  SSL Certificate

```sh
sudo certbot --apache --register-unsafely-without-email 
```

Menverifikasi pembaruan certbot
karena Let’s Encrypt berlaku selama 10 hari maka lakukan pembaruan otomatis lankahnya seperti dibawah ini

```sh
sudo systemctl status certbot.timer
```

```sh
sudo certbot renew --dry-run
```

## Install Nginx dan PHP-FPM

```sh
sudo systemctl stop apache2
```

```sh
sudo systemctl disable apache2
```

```sh
sudo systemctl status apache2
```

```sh
sudo apt install nginx -y
```

```sh
sudo apt install php7.4-fpm php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-gd php-imagick php7.4-cli php7.4-mbstring php7.4-zip php7.4-bcmath -y
```

```sh
sudo systemctl status php7.4-fpm
```

```sh
sudo vi /etc/php/7.4/fpm/pool.d/www.conf
```

```sh
sudo cd /etc/nginx/conf.d
```

```sh
sudo nano hard.com.conf
```

```bash
server {
    listen 80;
    server_name hard.com www.hard.com;
    root /var/www/hard.com;
    index index.php index.html index.htm;

    location / {
      try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
      try_files $fastcgi_script_name =404;
      include fastcgi_params;
      fastcgi_pass    unix:/run/php/php7.4-fpm.sock;
      fastcgi_index   index.php;
      fastcgi_param DOCUMENT_ROOT    $realpath_root;
      fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name; 
    }

    access_log /var/log/nginx/hard.com_access.log;
    error_log /var/log/nginx/hard.com_error.log;
}
```

```sh
sudo nginx -t
```

```sh
sudo systemctl restart nginx
```

```sh
sudo systemctl status nginx
```

```sh
sudo vi /etc/php/7.4/fpm/php.ini
```

```bash
upload_max_filesize = 10M
post_max_size = 10M
```

## Install SSL Let's Encrypt untuk Nginx

```sh
sudo apt install certbot python3-certbot-nginx -y
```

```sh
sudo certbot --nginx -d hard.com -d www.hard.com
```

## Firewall iptables

* cloud firewall
* ufw
* firewalld
* iptables

```sh
sudo apt install iptables-persistent -y
```

```sh
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```

```sh
sudo iptables -A INPUT -p icmp -j ACCEPT
```

```sh
sudo iptables -A INPUT -p tcp --dport 50000 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
```

```sh
sudo iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
```

```sh
sudo iptables -A INPUT -p tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
```

```sh
sudo iptables -P INPUT DROP
```

```sh
sudo netfilter-persistent save
```

```sh
sudo netfilter-persistent reload
```

```sh
sudo iptables -L
```

```sh
sudo iptables -P INPUT ACCEPT
```

```sh
sudo iptables -F
```

```sh
sudo iptables -L
```

## Backup

```sh
sudo mkdir -p backup/hard.com/www
```

```sh
sudo mkdir backup/hard.com/db
```

```sh
sudo vi mysqldump-toko.cnf
```

```bash
[mysqldump]
user=hard
password=rahasia
```

```bash
vi backup.sh
```

```bash
#!/bin/bash

rsync -av /var/www/defnex.com/ /root/backup/defnex.com/www --delete
mysqldump --defaults-extra-file=/root/mysqldump-toko.cnf toko | gzip > /root/backup/defnex.com/db/toko-$(date +%d%m%Y).sql.gz
```

```sh
sudo chmod u+x backup.sh
```

```sh
sudo ./backup.sh
```

```sh
ls -l backup/hard.com/www
```

```sh
ls -l backup/hard.com/db
```

```sh
rm backup/hard.com/www/*
```

```sh
rm backup/hard.com/db/*
```

```sh
crontab -e
```

```bash
15 10 * * * /bin/bash /root/backup.sh
```

```sh
sudo systemctl restart cron
```

 Format https://crontab.guru

```sh
ls -l backup/hard.com/www
```

```sh
ls -l backup/hard.com/db
```

## Problem Server
## Troubleshooting: Too Many Redirects

## Cek Using cURL for Redirect Loops

```sh
vi redirects.sh
```

```bash
#!/bin/bash
echo
for domain in $@; do
echo --------------------
echo $domain
echo --------------------
curl -sILk $domain | egrep 'HTTP|Loc' | sed 's/Loc/ -> Loc/g'
echo
done
```

```sh
chmod +x redirects.sh
```

## Redirects in the .htaccess File

1. Force HTTPS

```
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
```
2. Force HTTPS: When Behind a Load Balancer or Proxy (CloudFlare/Incapsula/Sucuri/etc.)

```
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteCond %{HTTP:X-Forwarded-Proto} =http
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
```

3. Force non-www

```
RewriteEngine On
RewriteCond %{HTTP_HOST} ^www\. [NC] RewriteRule (.*) http://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
```

4. Force www

```
RewriteEngine On
RewriteCond %{HTTP_HOST} !^www\. [NC] RewriteRule (.*) http://www.%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
```

5. For Codeigniter

```
<IfModule mod_rewrite.c>
RewriteEngine On

RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php/$1 [L]
</IfModule>
```


pilih dan sesuaikan dengan kebutuhan<br>

## Terimakasih
Silahkan sesuaikan tidak harus sama persis :blush:

