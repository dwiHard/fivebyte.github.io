# Configurasi Apache2 untuk Codeigniter 
[![Website shields.io](https://img.shields.io/badge/codeigniter-v--3.x-orange)](http://shields.io/) [![Website shields.io](https://img.shields.io/badge/apache2----yellow)](http://shields.io/)


### Daftar Isi
* [Membuat 2 virtual host](#change-2-host-virtualhost-apache2)
* [Membuat CA cloudflare](#configure-cloudflare-origin-ca-apache)
* [Membuat ssl](#configure-apache2-dengan-ssl)

## Change 2 host virtualhost apache2
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

## Configure cloudflare origin ca apache
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
pastekan *** Private Key ***

#### Mengaktikan ssl
```
$ sudo a2enmod ssl
```
```
$ sudo service apache2 restart
```
## Configure apache2 dengan ssl

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
<VirtualHost 45.64.99.168:443> 
 
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

