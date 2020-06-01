# Format FlashDisk Lewat Terminal
Cek dahulu letak flashdisk ada di device boot  mana :
```
$ sudo fdisk -l
```
Sebelum format unmount dulu semisal letak flashdisk saya di ```/dev/sdc1```:
```
$ sudo umount /dev/sdc1
```
Lalu format
```
$ sudo mkfs.vfat /dev/sdc1
```

### Berhasil !!!!
