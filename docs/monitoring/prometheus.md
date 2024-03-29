## Config prometheus dengan kafka

Config untuk systemd kafka path folder /etc/systemd/system/kafka.service

```bash
[Unit]
After=network.target
Requires=zk.service
After=zk.service

[Service]
Type=simple
user=kafka
Environment="KAFKA_HEAP_OPTS=-Xmx256M -Xms128M"
Environment="KAFKA_OPTS=-javaagent:/home/hard/monitoring/prometheus/jmx_prometheus_javaagent-0.16.0.jar=8085:/home/hard/monitoring/prometheus/kafka-0-8-2.yml"
SuccessExitStatus=143
ExecStart=/bin/sh -c '/home/hard/apache/kafka/bin/kafka-server-start.sh /home/hard/apache/kafka/config/server.properties > /home/hard/apache/kafka/kafka.log 2>&1'
ExecStop=/home/hard/apache/kafka/bin/kafka-server-stop.sh

[Install]
WantedBy=multi-user.target
```

link download prometheus https://github.com/prometheus/jmx_exporter

```sh
wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.0/jmx_prometheus_javaagent-0.17.2.jar
```

ambil config prometheus untuk kafka https://github.com/prometheus/jmx_exporter/tree/main/example_configs

```sh
wget https://raw.githubusercontent.com/prometheus/jmx_exporter/main/example_configs/kafka-0-8-2.yml
```

lalu jalankan curl localhost:8085/metrics jika berhasil buat config untuk prometheus

```yaml
global:
    scrape_interval: 10s
    evaluation_interval: 10s
scrape_configs:
    - job_name: 'kafka'
static_configs:
    - targets:
        - 192.168.x.x:8085
```

## Systemd Prometheus

tambahkan user untuk prometheus

```sh
sudo adduser kafka
```

path folder /etc/systemd/system/prometheus.service

```bash
[Unit]
Description=Prometheus
After=network.target
Documentation=https://prometheus.io/docs/introduction/overview/

[Service]
user=prometheus
ExecStart=/home/hard/monitoring/prometheus/prometheus/prometheus --config.file=/home/hard/monitoring/prometheus/prometheus/prometheus.yml 
    
[Install]
WantedBy=multi-user.target
```

lalu jalankan

```sh
sudo systemctl daemon-reload
```

lalu jalankan systemctl start prometheus.service

```sh
sudo systemctl start prometheus.service
```

## Terimakasih