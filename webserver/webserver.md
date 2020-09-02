# Rangkuman Konfigurasi webserver di ubuntu :heavy_check_mark:
> Disusun oleh Hardiyanto

## Daftar Isi
* [Membuat User Baru](#membuat-user-baru)
* [SSH Configure](#ssh-configure)
    * [Copy SSH key](#copy-ssh-key)
    * [Login  SSH Automatis](#login-automatis-ssh)
    * [Config SSH Server](#config-ssh-server)
    * [Config SSH Login](#config-ssh-login)
* [Set Timezone](#set-timezone)
* [Update System](#update-system)
* [Transfer File](#transfer-file)
* [Install Apache](#install-apache)
    * [Membuat Virtual Host](#membuat-virtual-host)
* [Install PHP 7.4](#install-php-74)
* [Install composer](#install-composer)
* [Install MariaDB 10.4](#install-mariadb-104)
* [Install SSL Let's Encrypt untuk Apache](#install-ssl-lets-encrypt-untuk-apache)
* [Install Nginx dan PHP-FPM](#install-nginx-dan-php-fpm)
* [Install SSL Let's Encrypt untuk Nginx](#install-ssl-lets-encrypt-untuk-nginx)
* [Firewall iptables](#firewall-iptables)
* [Backup](#backup)
* [Problem Server](#problem-server)
    * [Troubleshooting: Too Many Redirects](#troubleshooting-too-many-redirects)
    1. [Cek Using cURL for Redirect Loops](#cek-using-curl-for-redirect-loops)
    2. [Redirects in the .htaccess File](#redirects-in-the-htaccess-file)

***Keterangan***<br>
$  -->  Sebagai user biasa <br> 
\#  -->  Sebagai super user / root

#### Membuat User Baru
```
$ adduser hard
```
```
$ usermod -aG sudo hard
```

## SSH Configure
#### Copy SSH Key
```
$ su - hard
```
```
# mkdir ~/.ssh
```
```
# chmod 700 ~/.ssh
```
```
# nano ~/.ssh/authorized_keys
```
```
# chmod 600 ~/.ssh/authorized_keys
```
```
# exit
```
#### Login Automatis ssh
Pastikan Anda sudah membuat ssh keygen jika belum ketikan :
```
$ ssh-keygen
```
Jika sudah langsung ketikkan :
```
$ ssh-copy-id user@ip 
```

#### Config SSH Server
Keterangan port : <br>
Ports 0-1023 = system or well-known ports. <br>
Ports 1024-49151 = user or registered ports. <br>
Ports 49152-65535 = dynamic / private ports. <br>

Untuk Konfigurasi ikuti cara berikut :
```
$ vim /etc/ssh/sshd_config
```
Rubah seperti ini
```
Port 50000
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
```
keluar dari text editor
```
# systemctl restart ssh
```
```
# systemctl status ssh
```

#### Config SSH Login 
```
Host NamaServer
	Hostname HostServer
	User UserServer
	port portServer
	identityFile ~/.ssh/id_rsa_tes
```

## Set Timezone
```
$ timedatectl set-timezone Asia/Jakarta
date
````
## Update System
```
# apt update
```
```
# apt upgrade -y
```
```
# reboot
```
## Transfer File
```
$ scp crud.zip server:~/
```
## Install Apache
```
# apt install apache2 -y
```
#### Membuat Virtual Host
```
$ mkdir /var/www/hard.com
```
```
$ vim /var/www/hard.com/index.html
```
```
$ cd /etc/apache2/sites-available
```
```
# vi hard.com.conf
```

```
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
```
# a2ensite hard.com.conf
```
```
# a2enmod rewrite
```
```
# systemctl restart apache2
```
```
# systemctl status apache2
```

## Install PHP 7.4

```
# apt show php
```
https://launchpad.net/~ondrej/+archive/ubuntu/php

```
# apt install software-properties-common -y
```
```
# add-apt-repository ppa:ondrej/php
```
```
# apt install libapache2-mod-php7.4 php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-gd php-imagick php7.4-cli php7.4-mbstring php7.4-zip php7.4-bcmath -y
```
```
$ php -v
```
```
$ php -m
```
```
# apt search php7.4
```
```
# vi /var/www/hard.com/info.php
```
```
<?php phpinfo(); ?>
```

```
# vi /etc/php/7.4/apache2/php.ini
```
```
upload_max_filesize = 10M
post_max_size = 10M
```
```
# systemctl restart apache2
```
## Install composer

```
# apt install curl php7.4-cli php7.4-mbstring git unzip -y
```
```
$ curl –sS https://getcomposer.org/installer | php
```
```
# mv composer.phar /usr/local/bin/composer
```
Di Ubuntu 18.04 bisa juga langsung :
```
$ sudo apt update
```
```
$ sudo apt install composer
```

## Install MariaDB 10.4
Default MariaDB 10.1
```
# apt show mariadb-server
```
https://downloads.mariadb.org/mariadb/repositories/
```
# apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
```
```
# add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sgp1.mirrors.digitalocean.com/mariadb/repo/10.4/ubuntu bionic main'
```
```
# apt install mariadb-server -y
```
```
# systemctl status mariadb
```
```
# mysql_secure_installation
```
```
# mysql -u root -p
```

```
mysql> CREATE DATABASE toko;
```
```
mysql> CREATE USER 'hard'@'localhost' IDENTIFIED BY 'rahasia';
```
```
mysql> GRANT ALL PRIVILEGES ON toko.* TO 'musa'@'localhost';
```
```
mysql> FLUSH PRIVILEGES;
```
```
mysql> exit
```

```
$ cd /home/hard
```
```
$ unzip crud.zip
```
```
# mysql -u musa -p toko < crud/toko.sql
```
```
$ cp -v crud/* /var/www/hard.com/
```
```
$ cd /var/www
```
```
# rm hard.com/index.html
```
```
# chown -R hard:www-data hard.com
```
```
# chmod -R 775 hard.com
```
```
# ls -l 
```

## Install SSL Let's Encrypt untuk Apache
 https://certbot.eff.org/all-instructions
```
# add-apt-repository ppa:certbot/certbot
```
```
# apt install certbot python3-certbot-apache -y
```
```
$ certbot --apache -d hard.com -d www.hard.com
```
## Install Nginx dan PHP-FPM
```
# systemctl stop apache2
```
```
# systemctl disable apache2
```
```
# systemctl status apache2
```
```
# apt install nginx -y
```
```
# apt install php7.4-fpm php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-gd php-imagick php7.4-cli php7.4-mbstring php7.4-zip php7.4-bcmath -y
```
```
# systemctl status php7.4-fpm
```
```
# vi /etc/php/7.4/fpm/pool.d/www.conf
```
```
# cd /etc/nginx/conf.d
```
```
# nano hard.com.conf
```
```
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
```
# nginx -t
```
```
# systemctl restart nginx
```
```
# systemctl status nginx
```
```
# vi /etc/php/7.4/fpm/php.ini
```
```
upload_max_filesize = 10M
post_max_size = 10M
```
## Install SSL Let's Encrypt untuk Nginx
```
# apt install certbot python3-certbot-nginx -y
```
```
# certbot --nginx -d hard.com -d www.hard.com
```
## Firewall iptables

* cloud firewall
* ufw
* firewalld
* iptables

```
# apt install iptables-persistent -y
```
```
# iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```
```
# iptables -A INPUT -p icmp -j ACCEPT
```
```
# iptables -A INPUT -p tcp --dport 50000 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
```
```
# iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
```
```
# iptables -A INPUT -p tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
```
```
# iptables -P INPUT DROP
```
```
# netfilter-persistent save
```
```
# netfilter-persistent reload
```
```
# iptables -L
```
```
# iptables -P INPUT ACCEPT
```
```
# iptables -F
```
```
# iptables -L
```
## Backup
```
# cd
```
```
# mkdir -p backup/hard.com/www
```
```
# mkdir backup/hard.com/db
```

```
# vi mysqldump-toko.cnf
```
```
[mysqldump]
user=hard
password=rahasia
```
```
$ vi backup.sh
```
```
#!/bin/bash

rsync -av /var/www/defnex.com/ /root/backup/defnex.com/www --delete
mysqldump --defaults-extra-file=/root/mysqldump-toko.cnf toko | gzip > /root/backup/defnex.com/db/toko-$(date +%d%m%Y).sql.gz
```
```
# chmod u+x backup.sh
```
```
# ./backup.sh
```
```
$ ls -l backup/hard.com/www
```
```
$ ls -l backup/hard.com/db
```
```
$ rm backup/hard.com/www/*
```
```
$ rm backup/hard.com/db/*
```

```
$ crontab -e
```
```
15 10 * * * /bin/bash /root/backup.sh
```
```
# systemctl restart cron
```
 Format https://crontab.guru
```
$ ls -l backup/hard.com/www
```
```
$ ls -l backup/hard.com/db
```

#### Problem Server
#### Troubleshooting: Too Many Redirects

#### Cek Using cURL for Redirect Loops
```
vi redirects.sh
```
```
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
```
chmod +x redirects.sh
```

#### Redirects in the .htaccess File

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

# Terimakasih
Silahkan sesuaikan tidak harus sama persis :blush:

