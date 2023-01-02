# Apache Zookeeper
> disusun oleh Hardiyanto

<div align="center">
  <a href="https://zookeeper.apache.org/">
    <img src="https://github.com/dwiHard/five_byte.github.io/blob/master/images/zookeeper.png" alt="Logo" width="150" height="120">
  </a>

<h3 align="center">README-Zookeeper</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://zookeeper.apache.org/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/apache/apacheZookeeper.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My README</a>
  </p>
</div>

### Daftar Isi
* [Install dan Configure Zookeeper](#install-dan-configure-zookeeper)
* [Menjalankan Zookeeper](#menjalankan-zookeeper)
* [Zookeeper di Systemd](#zookeeper-di-systemd)

### Install dan Configure Zookeeper
Kunjungi link https://zookeeper.apache.org/releases.html
```
wget https://dlcdn.apache.org/zookeeper/zookeeper-3.8.0/apache-zookeeper-3.8.0-bin.tar.gz
```
```
tar -xvf apache-zookeeper-3.8.0-bin.tar.gz
```
```
cd apache-zookeeper-3.8.0-bin
```
```
cp conf/zoo_sample.cfg conf/zoo.cfg
```
```
vi conf/zoo.cfg
```
Untuk konfigurasi zookeeper, ubah konfigurasi berikut:
```
dataDir=/home/hard/apache/apache-zookeeper-3.8.0-bin/tmp/zookeeper
```
Lalu buat direktori dataDir
```
mkdir -p /home/hard/apache/apache-zookeeper-3.8.0-bin/tmp/zookeeper
```

### Menjalankan Zookeeper
```
bin/zkServer.sh start
```
Untuk melihat status zookeeper
```
bin/zkServer.sh status
```
Untuk menghentikan zookeeper
```
bin/zkServer.sh stop
```

### Zookeeper di Systemd

Tambahkan file di /etc/systemd/system/zk.service lalu edit
```
[Unit]
Description=Zookeeper Daemon
Documentation=http://zookeeper.apache.org
Requires=network.target
After=network.target

[Service]
Type=forking
WorkingDirectory=/home/hard/apache/apache-zookeeper
ExecStart=/home/hard/apache/apache-zookeeper/bin/zkServer.sh start
ExecStop=/home/hard/apache/apache-zookeeper/bin/zkServer.sh stop
ExecReload=/home/hard/apache/apache-zookeeper/bin/zkServer.sh restart
TimeoutSec=30
Restart=on-failure

[Install]
WantedBy=default.target
```

### Terima Kasih