## Install dan Configure Zookeeper

Kunjungi link https://zookeeper.apache.org/releases.html

```sh
wget https://dlcdn.apache.org/zookeeper/zookeeper-3.8.0/apache-zookeeper-3.8.0-bin.tar.gz
```

```sh
tar -xvf apache-zookeeper-3.8.0-bin.tar.gz
```

```sh
cd apache-zookeeper-3.8.0-bin
```

```sh
cp conf/zoo_sample.cfg conf/zoo.cfg
```

```sh
vi conf/zoo.cfg
```

Untuk konfigurasi zookeeper, ubah konfigurasi berikut:

```sh
dataDir=/home/hard/apache/apache-zookeeper-3.8.0-bin/tmp/zookeeper
```

Lalu buat direktori dataDir

```sh
mkdir -p /home/hard/apache/apache-zookeeper-3.8.0-bin/tmp/zookeeper
```

## Menjalankan Zookeeper

```sh
bin/zkServer.sh start
```

Untuk melihat status zookeeper

```sh
bin/zkServer.sh status
```

Untuk menghentikan zookeeper

```sh
bin/zkServer.sh stop
```

## Zookeeper di Systemd

Tambahkan file di /etc/systemd/system/zk.service lalu edit

```txt
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

## Terima Kasih