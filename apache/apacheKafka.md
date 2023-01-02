## Apache Kafka
> disusun oleh Hardiyanto

<div align="center">
  <a href="https://kafka.apache.org">
    <img src="https://github.com/dwiHard/five_byte.github.io/blob/master/images/kafka.png" alt="Logo" width="140" height="130">
  </a>

<h3 align="center">README-Vim</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://kafka.apache.org"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/vim/vim.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My READMe</a>
  </p>
</div>

### Daftar Isi

* [Install Apache Kafka](#install-apache-kafka)
* [Membuat Topic](#membuat-topic)
* [Mengirimkan Topic](#mengirimkan-topic)
* [Melihat List Topic](#melihat-list-topic)
* [Mengirim Data Ke Topic](#mengirim-data-ke-topic)
* [Menerima Data dari Topic](#menerima-data-dari-topic)
* [Kafka Producer](#kafka-producer)
* [Kafka Consumer](#kafka-consumer)
* [Kafka di Systemd](#kafka-di-systemd)

#### Install Kafka
Kunjungi link berikut https://kafka.apache.org/downloads
```
tar -xzf kafka_2.13-3.2.1.tgz
```
```
cd kafka_2.13-3.2.1
```
Untuk menjalankan zookeper server kafka
```
bin/zookeeper-server-start.sh config/zookeeper.properties
```
Untuk menjalankan apache kafka
```
bin/kafka-server-start.sh config/server.properties
```

#### Membuat Topic
```
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic dem
```

#### Mengirimkan Topic
untuk partition 1
```
./bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic belajar-kafka
```
untuk partition 3
```
./bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 3 --topic belajar-kafka
```
#### Melihat List Topic
```
./bin/kafka-topics.sh --list --bootstrap-server localhost:9092
```

#### Mengirim Data Ke Topic
```
./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic belajar-kafka
```

#### Menerima Data dari Topic
menerima ketika kafka console customer dihidupkan
```
 ./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic belajar-kafka
```
menerima ketika kafka console customer dari awal
```
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic belajar-kafka --from-beginning
```
biar tidak duplikasi data gunakan command seperti dibawah ini dan pastikan kafkanya partitionnya lebih dari 1
```
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic belajar-kafka-lagi --group belajar
```
#### Kafka Producer
```
public static void main( String[] args )
    {

        Properties properties = new Properties();
        properties.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        properties.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        properties.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());

        KafkaProducer<String, String> producer = new KafkaProducer<String, String>(properties);

        for (int i = 0; i < 10; i ++){
            ProducerRecord<String, String> record = new ProducerRecord<>("topic-java", "Data ke " + i);
            producer.send(record);
        }
        producer.close();
    }
```
untuk menjalankan
```
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic-java
```

#### Kafka Consumer
```
public static void main(String[] args) {
        Properties props = new Properties();
        props.setProperty(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        props.setProperty(ConsumerConfig.GROUP_ID_CONFIG, "test");
        props.setProperty(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "true");
        props.setProperty(ConsumerConfig.AUTO_COMMIT_INTERVAL_MS_CONFIG, "1000");
        props.setProperty(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringDeserializer");
        props.setProperty(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringDeserializer");
        KafkaConsumer<String, String> consumer = new KafkaConsumer<>(props);
        consumer.subscribe(Arrays.asList("topic-java"));
        while (true) {
            ConsumerRecords<String, String> records = consumer.poll(Duration.ofMillis(100));
            for (ConsumerRecord<String, String> record : records){
                System.out.println("Receive Data :  " + record.value());
            }
        }
    }
```

#### Kafka di Systemd
Edit dan buat file baru di /etc/systemd/system/kafka.service
```
[Unit]
Description=Kafka with broker id (%i)
After=network.target
After=zk.service

[Service]
Type=forking

SyslogIdentifier=kafka (%i)
Restart=on-failure
LimitNOFILE=16384:163840

ExecStart=/home/hard/apache/kafka/bin/kafka-server-start.sh /home/hard/apache/kafka/config/server.properties
ExecStop=/home/hard/apache/kafka/bin/kafka-server-stop.sh

[Install]
WantedBy=multi-user.target
```

### Terima Kasih
