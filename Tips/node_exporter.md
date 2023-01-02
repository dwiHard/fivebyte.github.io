# Apache Zookeeper
> disusun oleh Hardiyanto

<div align="center">
  <a href="https://github.com/prometheus/node_exporter">
  </a>

<h3 align="center">README-Zookeeper</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://github.com/prometheus/node_exporter"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/apache/nodeexporter.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My README</a>
  </p>
</div>

### Daftar Isi
* [Configure Node Exporter](#configure-node-exporter)
* [Node Exporter di Systemd](#node-exporter-di-systemd)
* [Monitoring node exporter with prometheus](#monitoring-node-exporter-with-prometheus)

#### Configure Node Exporter
Configure untuk node exporter link bisa didapatkan di https://prometheus.io/download/#node_exporter
```
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
```
```
tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz 
```
```
node_exporter-1.5.0.linux-amd64
```

#### Node Exporter di Systemd
membuat service untuk node exporter
pindahkan file ke /usr/local/bin
```
sudo cp node_exporter /usr/local/bin/
```
```
sudo vi /etc/systemd/system/node_exporter.service
```
```
[Unit]
Description=Node Exporter
Wants=network-online. target
After=network-online. target
[Service]
User=root
Group=root

Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
```
untuk cek status
```
sudo systemctl status node_exporter.service
```
menjalankan service
```
sudo systemctl start node_exporter.service
```
cek di dashboard
```
http://192.168.10.251:9100/
```
cek untuk matric
```
http://192.168.10.251:9100/metrics
```

#### Monitoring node exporter with prometheus
```
docker pull prom/prometheus
```
```
docker run -d --name prometheus --restart always --net host \
-v prometheus-config:/etc/prometheus \
-v prometheus-data:/prometheus \
-v /etc/localtime:/etc/localtime:ro \
prom/prometheus
```
cek status port prometheus (9090)
```
netstat -plnt
```
lihat di dashboard
```
http://localhost:9090
```
lihat targetnya
```
http://localhost:9090/targets
```


## Terima Kasih