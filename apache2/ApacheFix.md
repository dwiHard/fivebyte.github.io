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
