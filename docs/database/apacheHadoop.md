## Installation Configuration

edit file **mapred-site.xml** tambahkan seperti dibawah ini

```xml
<configuration>
<property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
        <description>MapReduce framework name</description>
</property>
<property>
        job.getConfiguration().setStrings("mapreduce.reduce.shuffle.memory.limit.percent", "0.15");
</property>
</configuration>
```

lalu edit dan tambahkan di file **core-site.xml**

```xml
<configuration>
        <property>
                <name>fs.default.name</name>
                <value>hdfs://localhost:9000</value>
        </property>
</configuration>
```

lalu edit dan tambahkan di file **yarn-site.xml**

```xml
<configuration>

<!-- Site specific YARN configuration properties -->
<property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
        <description>Yarn Node Manager Aux Service</description>
</property>
</configuration>
```

lalu edit dan tambahkan di file **hdfs-site.xml**

```xml
<configuration>
<property>
        <name>dfs.replication</name>
        <value>1</value>
</property>
<property>
        <name>dfs.namenode.name.dir</name>
        <value>~/apache/hadoop-2.10.2/data/dfs/namenode</value>
</property>
<property>
        <name>dfs.datanode.name.dir</name>
        <value>~/apache/hadoop-2.10.2/data/dfs/datanode</value>
</property>
</configuration>
```

## Jika Error SSH

ini terjadi error karena ketika memasukkan ```ssh localhost``` memasukan password

```
localhost: hard@localhost: Permission denied (publickey,password).
Starting datanodes
localhost: hard@localhost: Permission denied (publickey,password).
Starting secondary namenodes [hard]
hard: hard@hard: Permission denied (publickey,password).
Starting resourcemanager
```

fix

```sh
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
```

```sh
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

```sh
chmod 0600 ~/.ssh/authorized_keys
```

## Error resource manager

```
resourcemanager is running as process 7002.  Stop it first and ensure /tmp/hadoop-hard-resourcemanager.pid file is empty before retry.
```

fix

```sh
sbin/yarn-daemon.sh stop resourcemanager
```

## Perintah Dasar

untuk cek version

```sh
./bin/hadoop version
```

untuk memformat hdfs

```sh
./bin/hdfs namenode -format
```

untuk menjalankan service hadoop

```sh
./sbin/start-all.sh 
```

untuk melihat di browser alamat
http://localhost:8042/node
http://localhost:8088/cluster
untuk cek directory

```sh
./bin/hdfs dfs -ls /
```

untuk membuat directory baru

```sh
./bin/hdfs dfs -mkdir /data
```

