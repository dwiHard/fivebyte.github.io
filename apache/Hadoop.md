## Apache Hadoop
> disusun oleh Hardiyanto

<div align="center">
  <a href="https://hadoop.apache.org">
    <img src="https://github.com/dwiHard/five_byte.github.io/blob/master/images/hadoop.jpg" alt="Logo" width="150" height="120">
  </a>

<h3 align="center">README-Vim</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://hadoop.apache.org"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/apache/Hadoop.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My README</a>
  </p>
</div>


### Daftar Isi
* [x] [Installation Configuration](#installation-configuration)
* [x] [Jika Error SSH](#jika-error-ssh)
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
### Jika Error SSH
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
```
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
```
```
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```
```
chmod 0600 ~/.ssh/authorized_keys
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

