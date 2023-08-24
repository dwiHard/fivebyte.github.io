## Install Kafka

Kunjungi link berikut https://kafka.apache.org/downloads

```sh
tar -xzf kafka_2.13-3.2.1.tgz
```

```sh
cd kafka_2.13-3.2.1
```

Untuk menjalankan zookeper server kafka

```sh
bin/zookeeper-server-start.sh config/zookeeper.properties
```

Untuk menjalankan apache kafka

```sh
bin/kafka-server-start.sh config/server.properties
```

## Membuat Topic

untuk zookepeer

```sh
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic <nama_topic>
```

untuk kafka

```sh
bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic <nama_topic>
```

## Mengirimkan Topic

untuk partition 1

```sh
./bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic <nama_topic>
```

untuk partition 3

```sh
./bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 3 --topic <nama_topic>
```

## Melihat List Topic

untuk kafka

```sh
./bin/kafka-topics.sh --list --bootstrap-server localhost:9092
```

untuk zookepeer

```sh
./bin/kafka-topics.sh --list --zookeeper localhost:2181
```

## Melihat Detail Topic

```sh
./kafka-topics.sh --zookeeper localhost:2181 --describe
```

```sh
./kafka-topics.sh --zookeeper localhost:2181 --describe --topic <nama_topic>
```

## Mengirim Data Ke Topic

```sh
./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic <nama_topic>
```

## Mengirim Data Ke Topic dengan key

```sh
./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic <nama_topic>--property "key.separator=-" --property "parse.key=true"
```

## Menerima Data dari Topic

menerima ketika kafka console customer dihidupkan

```sh
 ./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic <nama_topic>
```

menerima ketika kafka console customer dari awal

```sh
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic <nama_topic> --from-beginning
```

biar tidak duplikasi data gunakan command seperti dibawah ini dan pastikan kafkanya partitionnya lebih dari 1

```sh
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic <nama_topic> --group belajar
```

## Menerima Data Ke Topic dengan key

```sh
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test-topic --from-beginning --property "key.separator=-" --property "print.key=true"
```

## Melihat List Consumer

```sh
./bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
```

## Consumer Group

```sh
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic <nama_topic> --group belajar
```

## Melihat Commit log

```sh
./kafka-run-class.sh kafka.tools.DumpLogSegments --deep-iteration --files /tmp/kafka-logs/test-topic-0/00000000000000000000.log
```

## Menghapus topic

untuk zookepeer

```sh
./bin/kafka-topics.sh --zookeeper localhost:2181 --delete --topic <nama_topic>
```

untuk kafka

```sh
./bin/kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic <nama_topic>
```

## Log Compaction

membuat topic jika pakai zookepeer maka ganti --bootstrap-server menjadi --zookeeper localhost:2181

```sh
./bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --topic <nama_topic> --partitions 1 --replication-factor 1 --config cleanup.policy=compact --config min.cleanable.dirty.ratio=0.001 --config segment.ms=5000
```

melihat detail topic

```sh
./bin/kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic <nama_topic>
```

jalankan kafka consumer

```sh
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic <nama_topic> --from-beginning --property print.key=true --property key.separator=,
```

## Kafka Producer

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

```sh
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic <nama_topic>
```

## Kafka Consumer

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

## Kafka di Systemd

Edit dan buat file baru di /etc/systemd/system/kafka.service

```
[Unit]
After=network.target
Requires=zk.service
After=zk.service

[Service]
Type=simple
user=kafka

Restart=on-abnormal

ExecStart=/bin/sh -c '/home/hard/apache/kafka/bin/kafka-server-start.sh /home/hard/apache/kafka/config/server.properties > /home/hard/apache/kafka/kafka.log 2>&1'
ExecStop=/home/hard/apache/kafka/bin/kafka-server-stop.sh

[Install]
WantedBy=multi-user.target
```

## Terima Kasih
