## Apache HBase
> disusun oleh Hardiyanto

### Daftar Isi
* [ERROR: KeeperErrorCode](#errorkeepererrorcode)

### ERROR: KeeperErrorCode
Error detail
```
ERROR: KeeperErrorCode = NoNode for /hbase/master
```
Cara Mengatasi
###### JPS
cek jps yang berjalan dengan mengetikan command berikut
```
jps
```
contoh output yang dihasilkan ketika mengetikan command jps 
```
10107 Jps
```
ini artinya tidak ada job yang berjalan
###### Menjalankan hadoop
pastikan sudah berada di root directory hadoop lalu jalankan perintah
```
./sbin/start-all.sh
```
jika sudah berhasil berjalan lalu lakukan pengecekan jps dengan jalankan perintah sebelumnya, dibawah ini hasil output jps
```
10562 DataNode
11267 NodeManager
10823 SecondaryNameNode
11545 Jps
10347 NameNode
```
###### Menjalankan HBase
pastikan sudah berada di root directory HBase lalu jalankan perintah
```
./bin/start-hbase.sh
```
jika sudah berhasil berjalan lalu lakukan pengecekan jps dengan jalankan perintah sebelumnya, dibawah ini hasil output jps
```
13825 HRegionServer
10562 DataNode
11267 NodeManager
14148 Jps
10823 SecondaryNameNode
13577 HQuorumPeer
10347 NameNode
```
> Could not start ZK at requested port of 2181, while export HBASE_MANAGES_ZK=false
##### Problem
cek status port 2181
```
netstat -nato | grep 2181
```
output
```
tcp        0      0 :::2181                     :::*                        LISTEN
```
lakukan edit file ```conf/hbase-env.sh```
```export HBASE_MANAGES_ZK=false```
dan edit juga ```conf/hbase-site.xml```
```
<configuration>
  <property>
    <name>hbase.cluster.distributed</name>
    <value>true</value>
  </property>
</configuration>
```