## Configure Node Exporter

Configure untuk node exporter link bisa didapatkan di https://prometheus.io/download/#node_exporter

```sh
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
```

```sh
tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz 
```

```sh
node_exporter-1.5.0.linux-amd64
```

## Node Exporter di Systemd

membuat service untuk node exporter
pindahkan file ke /usr/local/bin

```sh
sudo cp node_exporter /usr/local/bin/
```

```sh
sudo vi /etc/systemd/system/node_exporter.service
```

```bash
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

```sh
sudo systemctl status node_exporter.service
```

menjalankan service

```sh
sudo systemctl start node_exporter.service
```
cek di dashboard localhost:9100
cek untuk matric localhost:9100/metrics

## Monitoring node exporter with prometheus

```sh
docker pull prom/prometheus
```

```sh
docker run -d --name prometheus --restart always --net host \
-v prometheus-config:/etc/prometheus \
-v prometheus-data:/prometheus \
-v /etc/localtime:/etc/localtime:ro \
prom/prometheus
```

cek status port prometheus (9090)

```sh
netstat -plnt
```

lihat di dashboard localhost:9090
lihat targetnya localhost:9090/targets

## Terima Kasih
