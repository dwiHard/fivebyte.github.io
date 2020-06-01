# Menampilkan semua service yang berjalan / tidak

menampilkan menggunakan ```service```
```
$ sudo service --status-all
```

menampilkan  manggunakan ```systemctl```
```
$ sudo systemctl list-unit-files
```
```
$ sudo systemctl list-units --type service
```

menampilkan menggunakan ```netstat```
```
$ sudo netstat -pnltu
```

***systemd-cgtop***<br>
menunjukkan grup kontrol teratas dengan penggunaan sumber dayanya seperti tugas, CPU, Memori, Input, dan Output.
```
$ sudo systemd-cgtop
```
***chkservice***
```
$ sudo chkservice
```


