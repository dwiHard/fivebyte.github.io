---
outline: deep
---

Menampilkan informasi systemd

| Command                           | Keterangan                            |
| --------------------------------- | :-----------------------------------: |
| sudo systemctl list-dependencies  | Menampilkan unit dependencies         |
| sudo systemctl list-sockets       | Daftar soket dan apa yang diaktifkan  | 
| sudo systemctl list-jobs          | Melihat pekerjaan systemd yang aktif  |
| sudo systemctl list-unit-files    | Lihat file unit dan statusnya         |
| sudo systemctl list-units         | Daftar target default                 |

Perintah dasar systemd

| Command                                       | Keterangan                                    |
| --------------------------------------------- | :-------------------------------------------: |
| sudo systemctl stop _\<service\>_             | Menghentikan service yang berjalan            |
| sudo systemctl start _\<service\>_            | Memulai service                               |
| sudo systemctl restart _\<service\>_          | Restart service yang berjalan                 |
| sudo systemctl reload _\<service\>_           | Reload semua config file di service           |
| sudo systemctl status _\<service\>_           | Melihat status service apakah berjalan/tidak  |
| sudo systemctl enable _\<service\>_           | Aktifkan service saat boot                    |
| sudo systemctl disable _\<service\>_          | Non-aktifkan service saat boot                |
| sudo systemctl show _\<service\>_             | Menampilkan properties dari service           |
| sudo systemctl -H _\<host\>_ status network   | Menjalankan perintah systemctl secara remote  |

Perintah System states

| Command                   | Keterangan                    |
| ------------------------- | :---------------------------: |
| sudo systemctl reboot     | Mulai ulang/reboot system     |
| sudo systemctl poweroff   | Shutdown/Mematikan system     |
| sudo systemctl emergency  | Emergency mode                |
| sudo systemctl default    | Mengembalikan default target  |

Menampilkan pesan log

| Command                       | Keterangan                        |
| ------------------------------| :-------------------------------: |
| journalctl                    | Menampilkan semua pesan log       |
| journalctl -u network.service | Menampilkan pesan service network |
| journalctl -f                 | Ikuti pesan yang muncul           |
| journalctl -k                 | Menampilkan pesan log hanya kernel|
