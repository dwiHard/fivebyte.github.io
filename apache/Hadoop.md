## Apache Hadoop
> disusun oleh Hardiyanto


### Daftar Isi
* [x] [Installation Configuration](#installation-configuration)
* [x] [Perintah Dasar](#perintah-dasar)

### Installation Configuration
edit file **mapred-site.xml** tambahkan seperti dibawah ini
```
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
```
<configuration>
        <property>
                <name>fs.default.name</name>
                <value>hdfs://localhost:9000</value>
        </property>
</configuration>
```
lalu edit dan tambahkan di file **yarn-site.xml**
```
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
```
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

### Perintah Dasar
untuk cek version
```
./bin/hadoop version
```
untuk memformat hdfs
```
./bin/hdfs namenode -format
```
untuk menjalankan service hadoop
```
./sbin/start-all.sh 
```
untuk melihat di browser alamat
```
http://localhost:8042/node
```
```
http://localhost:8088/cluster
```
untuk cek directory
```
./bin/hdfs dfs -ls /
```
untuk membuat directory baru
```
./bin/hdfs dfs -mkdir /data
```

