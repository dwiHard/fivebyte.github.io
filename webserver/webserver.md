# Rangkuman Konfigurasi webserver di ubuntu :heavy_check_mark:
> Disusun oleh Hardiyanto

## Daftar Isi
* [Install Web Server Pada Arch Linux](#install-web-server-pada-arch-linux)
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
* [Install phpmyadmin](#install-phpmyadmin)
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

###Install Web Server Pada Arch Linux
install apache
```
sudo pacman -S apache 
```
menjalankan/mematikan service
```
sudo systemctl start httpd.service 
```
```
sudo systemctl stop httpd.service 
```
install mariadb
```
sudo pacman -S mariadb
```
Konfigurasi mariadb
```
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
```
```
sudo mysql_secure_installation
```
menjalankan/mematikan service
```
sudo systemctl start mariadb.service
```
```
sudo systemctl stop mariadb.service
```
install php
```
sudo pacman -S php php-apache php-cgi php-gd php-imap
```
konfigurasi php
```
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
```
sudo vim /etc/httpd/conf/httpd.conf
```
melihat list module
```
ls /etc/httpd/modules/ 
```

#### Membuat User Baru
```
adduser hard
```
```
usermod -aG sudo hard
```

## SSH Configure
#### Copy SSH Key
```
su - hard
```
```
sudo mkdir ~/.ssh
```
```
sudo chmod 700 ~/.ssh
```
```
sudo nano ~/.ssh/authorized_keys
```
```
sudo chmod 600 ~/.ssh/authorized_keys
```
```
sudo exit
```
#### Login Automatis ssh
Pastikan Anda sudah membuat ssh keygen jika belum ketikan :
```
ssh-keygen
```
Jika sudah langsung ketikkan :
```
ssh-copy-id user@ip 
```

#### Config SSH Server
Keterangan port : <br>
Ports 0-1023 = system or well-known ports. <br>
Ports 1024-49151 = user or registered ports. <br>
Ports 49152-65535 = dynamic / private ports. <br>

Untuk Konfigurasi ikuti cara berikut :
```
vim /etc/ssh/sshd_config
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
sudo systemctl restart ssh
```
```
sudo systemctl status ssh
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
timedatectl set-timezone Asia/Jakarta
date
````
## Update System
```
sudo apt update
```
```
sudo apt upgrade -y
```
```
sudo reboot
```
## Transfer File
```
scp crud.zip server:~/
```
## Install Apache
```
sudo apt install apache2 -y
```
#### Membuat Virtual Host
```
mkdir /var/www/hard.com
```
```
vim /var/www/hard.com/index.html
```
```
cd /etc/apache2/sites-available
```
```
sudo vi hard.com.conf
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
sudo a2ensite hard.com.conf
```
```
sudo a2enmod rewrite
```
```
sudo systemctl restart apache2
```
```
sudo systemctl status apache2
```

## Install PHP 7.4

```
sudo apt show php
```
https://launchpad.net/~ondrej/+archive/ubuntu/php

```
sudo apt install software-properties-common -y
```
```
sudo add-apt-repository ppa:ondrej/php
```
```
sudo apt install libapache2-mod-php7.4 php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-gd php-imagick php7.4-cli php7.4-mbstring php7.4-zip php7.4-bcmath -y
```
```
php -v
```
```
php -m
```
```
sudo apt search php7.4
```
```
sudo vi /var/www/hard.com/info.php
```
```
<?php phpinfo(); ?>
```

```
sudo vi /etc/php/7.4/apache2/php.ini
```
```
upload_max_filesize = 10M
post_max_size = 10M
```
```
sudo systemctl restart apache2
```

## Install phpmyadmin
```
sudo apt install -y apache2 mysql-server php libapache2-mod-php php-mysql -y 
```
```
sudo apt install phpmyadmin php-json php-curl php-mbstring php-zip
```
## Install composer

```
sudo apt install curl php7.4-cli php7.4-mbstring git unzip -y
```
```
curl –sS https://getcomposer.org/installer | php
```
```
sudo mv composer.phar /usr/local/bin/composer
```
Di Ubuntu 18.04 bisa juga langsung :
```
sudo apt update
```
```
sudo apt install composer
```

## Install MariaDB 10.4
Default MariaDB 10.1
```
sudo apt show mariadb-server
```
https://downloads.mariadb.org/mariadb/repositories/
```
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
```
```
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sgp1.mirrors.digitalocean.com/mariadb/repo/10.4/ubuntu bionic main'
```
```
sudo apt install mariadb-server -y
```
```
sudo systemctl status mariadb
```
```
sudo mysql_secure_installation
```
```
sudo mysql -u root -p
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
cd /home/hard
```
```
unzip crud.zip
```
```
sudo mysql -u musa -p toko < crud/toko.sql
```
```
cp -v crud/* /var/www/hard.com/
```
```
cd /var/www
```
```
sudo rm hard.com/index.html
```
```
sudo chown -R hard:www-data hard.com
```
```
sudo chmod -R 775 hard.com
```
```
sudo ls -l 
```

## Install SSL Let's Encrypt untuk Apache
 https://certbot.eff.org/all-instructions
```
sudo add-apt-repository ppa:certbot/certbot
```
```
sudo apt install certbot python3-certbot-apache -y
```
```
certbot --apache -d hard.com -d www.hard.com
```
## Install Nginx dan PHP-FPM
```
sudo systemctl stop apache2
```
```
sudo systemctl disable apache2
```
```
sudo systemctl status apache2
```
```
sudo apt install nginx -y
```
```
sudo apt install php7.4-fpm php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-gd php-imagick php7.4-cli php7.4-mbstring php7.4-zip php7.4-bcmath -y
```
```
sudo systemctl status php7.4-fpm
```
```
sudo vi /etc/php/7.4/fpm/pool.d/www.conf
```
```
sudo cd /etc/nginx/conf.d
```
```
sudo nano hard.com.conf
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
sudo nginx -t
```
```
sudo systemctl restart nginx
```
```
sudo systemctl status nginx
```
```
sudo vi /etc/php/7.4/fpm/php.ini
```
```
upload_max_filesize = 10M
post_max_size = 10M
```
## Install SSL Let's Encrypt untuk Nginx
```
sudo apt install certbot python3-certbot-nginx -y
```
```
sudo certbot --nginx -d hard.com -d www.hard.com
```
## Firewall iptables

* cloud firewall
* ufw
* firewalld
* iptables

```
sudo apt install iptables-persistent -y
```
```
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```
```
sudo iptables -A INPUT -p icmp -j ACCEPT
```
```
sudo iptables -A INPUT -p tcp --dport 50000 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
```
```
sudo iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
```
```
sudo iptables -A INPUT -p tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
```
```
sudo iptables -P INPUT DROP
```
```
sudo netfilter-persistent save
```
```
sudo netfilter-persistent reload
```
```
sudo iptables -L
```
```
sudo iptables -P INPUT ACCEPT
```
```
sudo iptables -F
```
```
sudo iptables -L
```
## Backup
```
cd
```
```
sudo mkdir -p backup/hard.com/www
```
```
sudo mkdir backup/hard.com/db
```

```
sudo vi mysqldump-toko.cnf
```
```
[mysqldump]
user=hard
password=rahasia
```
```
vi backup.sh
```
```
#!/bin/bash

rsync -av /var/www/defnex.com/ /root/backup/defnex.com/www --delete
mysqldump --defaults-extra-file=/root/mysqldump-toko.cnf toko | gzip > /root/backup/defnex.com/db/toko-$(date +%d%m%Y).sql.gz
```
```
sudo chmod u+x backup.sh
```
```
sudo ./backup.sh
```
```
ls -l backup/hard.com/www
```
```
ls -l backup/hard.com/db
```
```
rm backup/hard.com/www/*
```
```
rm backup/hard.com/db/*
```

```
crontab -e
```
```
15 10 * * * /bin/bash /root/backup.sh
```
```
sudo systemctl restart cron
```
 Format https://crontab.guru
```
ls -l backup/hard.com/www
```
```
ls -l backup/hard.com/db
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

