# Rangkuman Apache2 [![Website shields.io](https://img.shields.io/badge/codeigniter-v--3.x-orange)](http://shields.io/) [![Website shields.io](https://img.shields.io/badge/apache2----yellow)](http://shields.io/)
> Disusun oleh Hardiyanto


### Daftar Isi

* [Configure Apache2 untuk codeigniter](#configurasi-apache2-untuk-codeigniter)
    * [Install PHP](#install-php)
    * [Membuat 2 virtual host](#change-2-host-virtualhost-apache2)
    * [Membuat CA cloudflare](#configure-cloudflare-origin-ca-apache)
    * [Membuat ssl](#configure-apache2-dengan-ssl)
* [Problem Apache2](#problem-apache2)
    * [Apache2 eror](#apache2-eror-di-ubuntu-1804)
<br>
</br>

### Configure Apache2 untuk codeigniter

#### Install PHP
```
$ sudo su
```
```
# apt install libapache2-mod-php7.4 php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-gd php-imagick php7.4-cli php7.4-mbstring php7.4-zip php7.4-bcmath -y
```
#### Change 2 host virtualhost apache2
Buat Folder
```
$ sudo mkdir -p /var/www/hard.com/public_html
```
```
$ sudo mkdir -p /var/www/hard2.com/public_html
```
Grant permission
```
$ sudo chown -R $USER:$USER /var/www/hard.com/public_html
```
```
$ sudo chown -R $USER:$USER /var/www/hard2.com/public_html
```
```
$ sudo chmod -R 755 /var/www
```

salin domain ```000-default.conf```
```
$ sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/hard.com.conf
```
```
$ sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/hard2.com.conf
```
lalu open file ```hard.com.conf``` & ```hard2.com.conf``` rubah dan sesuikan :
```
# vi /etc/apache2/sites-available/hard.com.conf
```
```
<VirtualHost *:80> 
        ServerAdmin hard
        ServerName hard.com  
        DocumentRoot /var/www/hard.com/public_html/ 
</VirtualHost> 
```
Untuk Mengaktikan site
```
$ sudo a2ensite hard.com.conf
```
```
$ sudo a2ensite hard.com.conf
```
Untuk Mematikan site
```
$ sudo a2dissite 000-default.conf
```
Lalu
```
$ sudo systemctl restart apache2
```
```
$  sudo service apache2 restart
```

Set Hosts
```
$ sudo vi /etc/hosts
```
```
IP kamu       hard.com
IP kamu       hard2.com
```

#### Configure cloudflare origin ca apache
Buat folder
```
$ sudo mkdir -p /etc/cloudflare/
```
copy cert dan key
```
$ sudo vi /etc/cloudflare/hard.com.pem
```
pastekan  ***Origin Certificate*** 
```
$ sudo vi /etc/cloudflare/hard.com.key
```
pastekan ***Private Key***

#### Mengaktikan ssl
```
$ sudo a2enmod ssl
```
```
$ sudo service apache2 restart
```
#### Configure apache2 dengan ssl

```
# vi /etc/apache2/sites-available/hard.com.conf
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
```
$ sudo a2ensite hard.com.conf
```
Untuk Mematikan site
```
$ sudo a2dissite 000-default.conf
```
Lalu
```
$ sudo systemctl restart apache2
```
```
$  sudo service apache2 restart
```

Set Hosts
```
$ sudo vi /etc/hosts
```
```
IP kamu       hard.com
```

### Problem Apache2

#### Apache2 eror di Ubuntu 18.04

Cara dibawah ini mungkin dapat menghapus file Anda alangkah
 baiknya backup dahulu.
 ```
$ service apache2 status
```
● apache2.service - The Apache HTTP Server
   Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: 
  Drop-In: /lib/systemd/system/apache2.service.d
           └─apache2-systemd.conf
   Active: failed (Result: exit-code) since Wed 2020-05-27 17:00:24 WIB; 1h 59mi
  Process: 1002 ExecStart=/usr/sbin/apachectl start (code=exited, status=1/FAILU

Mei 27 17:00:20 hard systemd[1]: Starting The Apache HTTP Server...
Mei 27 17:00:24 hard apachectl[1002]: AH00558: apache2: Could not reliably deter
Mei 27 17:00:24 hard apachectl[1002]: (2)No such file or directory: AH02291: Can
Mei 27 17:00:24 hard apachectl[1002]: (2)No such file or directory: AH02291: Can
Mei 27 17:00:24 hard apachectl[1002]: AH00014: Configuration check failed
Mei 27 17:00:24 hard apachectl[1002]: Action 'start' failed.
Mei 27 17:00:24 hard apachectl[1002]: The Apache error log may have more informa
Mei 27 17:00:24 hard systemd[1]: apache2.service: Control process exited, code=e
Mei 27 17:00:24 hard systemd[1]: apache2.service: Failed with result 'exit-code'
Mei 27 17:00:24 hard systemd[1]: Failed to start The Apache HTTP Server.
```
$ systemctl  start apache2.service
```
Job for apache2.service failed because the control process exited with error code.
See "systemctl status apache2.service" and "journalctl -xe" for details.
```
$ sudo apt-get -o DPkg::Options::="--force-confmiss" --reinstall install apache2
```
```
$ sudo apt-get purge apache2
```
```
$ sudo apt-get install apache2
```
```
$ sudo service apache2 start
```
```
$ sudo service apache2 status
```

### Terima Kasih
