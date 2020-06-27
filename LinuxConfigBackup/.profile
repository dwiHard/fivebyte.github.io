# Untuk masuk ke webserver
web() {
	cd /var/www/html/sigeodamkar/
	vi .
}

# Aktifkan service apache2 dan mysql
on() {
    sudo service apache2 start
    sudo service mysql start
}

# Mematikan service apache2 dan mysql
off() {
    sudo service apache2 stop
    sudo service mysql stop
}

# Memeriksa ststus apache2 dan mysql
stat() {
    sudo service apache2 status
    sudo service mysql status
}

# Error apache2
asu(){
    sudo apt purge apache2 -y
    sudo apt install apache2 -y
    sudo a2dismod mpm_event
    sudo a2enmod mpm_prefork
    sudo a2enmod php7.3
    sudo systemctl restart apache2
}