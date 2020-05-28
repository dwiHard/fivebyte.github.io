# Membuat User Baru

adduser musa
usermod -aG sudo musa

# Copy SSH Key

su - musa
mkdir ~/.ssh
chmod 700 ~/.ssh
nano ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

exit

# ssh-copy-id -i .ssh/key-demo user@ip 

# Config SSH Server

# Ports 0-1023 = system or well-known ports.
# Ports 1024-49151 = user or registered ports.
# Ports 49152-65535 = dynamic / private ports

vim /etc/ssh/sshd_config

Port 50000
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no

systemctl restart ssh
systemctl status ssh

# Set Timezone

timedatectl set-timezone Asia/Jakarta
date

# Update System

apt update
apt upgrade -y
reboot

# Transfer File

scp crud.zip server:~/

# Install Apache

apt install apache2 -y

# Membuat Virtual Host

mkdir /var/www/defnex.com
nano /var/www/defnex.com/index.html

cd /etc/apache2/sites-available
nano defnex.com.conf

<VirtualHost *:80>
    ServerName defnex.com
    ServerAlias www.defnex.com
    DocumentRoot /var/www/defnex.com
    <Directory /var/www/defnex.com>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog /var/log/apache2/defnex.com_error.log
    CustomLog /var/log/apache2/defnex.com_access.log combined
</VirtualHost>

a2ensite defnex.com.conf
a2enmod rewrite
systemctl restart apache2
systemctl status apache2

# Install PHP 7.4

# Defaul PHP 7.2

apt show php

# https://launchpad.net/~ondrej/+archive/ubuntu/php

apt install software-properties-common -y
add-apt-repository ppa:ondrej/php

apt install libapache2-mod-php7.4 php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-gd php-imagick php7.4-cli php7.4-mbstring php7.4-zip php7.4-bcmath -y

php -v
php -m
apt search php7.4

nano /var/www/defnex.com/info.php

<?php phpinfo(); ?>

nano /etc/php/7.4/apache2/php.ini

upload_max_filesize = 10M
post_max_size = 10M

systemctl restart apache2

# Install composer

apt install curl php7.4-cli php7.4-mbstring git unzip -y
curl –sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install MariaDB 10.4

# Default MariaDB 10.1

apt show mariadb-server

# https://downloads.mariadb.org/mariadb/repositories/

apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sgp1.mirrors.digitalocean.com/mariadb/repo/10.4/ubuntu bionic main'

apt install mariadb-server -y

systemctl status mariadb

mysql_secure_installation

mysql -u root -p

CREATE DATABASE toko;
CREATE USER 'musa'@'localhost' IDENTIFIED BY 'rahasia';
GRANT ALL PRIVILEGES ON toko.* TO 'musa'@'localhost';
FLUSH PRIVILEGES;
exit


cd /home/musa
unzip crud.zip

mysql -u musa -p toko < crud/toko.sql

cp -v crud/* /var/www/defnex.com/
cd /var/www
rm defnex.com/index.html
chown -R musa:www-data defnex.com
chmod -R 775 defnex.com
ls -l

# Install SSL Let's Encrypt untuk Apache

# https://certbot.eff.org/all-instructions

add-apt-repository ppa:certbot/certbot
apt install certbot python3-certbot-apache -y

certbot --apache -d defnex.com -d www.defnex.com

# Install Nginx dan PHP-FPM

systemctl stop apache2
systemctl disable apache2
systemctl status apache2

apt install nginx -y
apt install php7.4-fpm php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-gd php-imagick php7.4-cli php7.4-mbstring php7.4-zip php7.4-bcmath -y

systemctl status php7.4-fpm

nano /etc/php/7.4/fpm/pool.d/www.conf

cd /etc/nginx/conf.d
nano defnex.com.conf

server {
    listen 80;
    server_name defnex.com www.defnex.com;
    root /var/www/defnex.com;
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

    access_log /var/log/nginx/defnex.com_access.log;
    error_log /var/log/nginx/defnex.com_error.log;
}

nginx -t
systemctl restart nginx
systemctl status nginx

nano /etc/php/7.4/fpm/php.ini

upload_max_filesize = 10M
post_max_size = 10M

# Install SSL Let's Encrypt untuk Nginx

apt install certbot python3-certbot-nginx -y

certbot --nginx -d defnex.com -d www.defnex.com

# Firewall iptables

# cloud firewall
# ufw
# firewalld
# iptables


apt install iptables-persistent -y

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A INPUT -p tcp --dport 50000 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -P INPUT DROP

netfilter-persistent save
netfilter-persistent reload

iptables -L

# iptables -P INPUT ACCEPT
# iptables -F
# iptables -L

# Backup

cd
mkdir -p backup/defnex.com/www
mkdir backup/defnex.com/db


nano mysqldump-toko.cnf

[mysqldump]
user=musa
password=rahasia

nano backup.sh

#!/bin/bash

rsync -av /var/www/defnex.com/ /root/backup/defnex.com/www --delete
mysqldump --defaults-extra-file=/root/mysqldump-toko.cnf toko | gzip > /root/backup/defnex.com/db/toko-$(date +%d%m%Y).sql.gz


chmod u+x backup.sh
./backup.sh

ls -l backup/defnex.com/www
ls -l backup/defnex.com/db

rm backup/defnex.com/www/*
rm backup/defnex.com/db/*


crontab -e

15 10 * * * /bin/bash /root/backup.sh


systemctl restart cron


# Format https://crontab.guru

ls -l backup/defnex.com/www
ls -l backup/defnex.com/db

