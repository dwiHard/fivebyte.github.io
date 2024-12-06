## Install neovim
kunjungi https://github.com/neovim/neovim/releases
download nvim
```
wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
```
atau
```
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
```
extract nvim di folder saat ini
```
tar xzvf nvim-linux64.tar.gz
```
atau bisa extrak di folder opt
```
tar -C /opt -xzf nvim-linux64.tar.gz
```
jalankan nvim
```
./nvim-linux64/bin/nvim
```
biar bisa di jalankan secara global
```
export PATH="$PATH:/opt/nvim-linux64/bin"
```


## Gerakan Kursor dalam Mode Normal
1. ```G```  - Pergi ke baris terakhir file.
2. ```gg``` - Pergi ke baris pertama file.
3. ```$``` - Pergi ke akhir baris.
4. ```0``` - Pergi ke awal baris.

5. ```w``` - Lompat di awal kata-kata.
6. ```W``` - Lompat di kata (spasi kata yang terpisah).
7. ```b``` - Lompat mundur kata-kata.
8. ```B``` - Lompat mundur dengan kata-kata (spasi kata yang terpisah).

9. ```ctrl + d``` - Pindahkan setengah halaman ke bawah.
10. ```ctrl + u``` - Pindahkan setengah halaman ke atas.


## Insert mode

1. ```i``` - Masukkan sebelum kursor.
2. ```I``` - Masukkan di awal baris, ini berguna saat Anda berada di tengah baris.
3. ```a``` - Masukkan setelah kursor.
4. ```A``` - Masukkan di akhir baris.
5. ```o``` - Buka baris baru di bawah garis saat ini.
6. ```O``` - Tambahkan baris baru di atas garis saat ini.
7. ```ea``` - Masukkan di akhir kata.
 

## Copy, Paste dan Delete

1. ```yy``` - copy satu baris.
2. ```p/P``` - Tempel setelah kursor / diletakkan sebelum kursor
3. ```dd``` - hapus satu baris.
4. ```dw``` - hapus kata


## Search and Replace Pattern in Vim

1. ```/``` - Untuk mencari kata yang diberikan.
2. ```?``` - Untuk mencari mundur kata yang diberikan.
3. ```n``` - Untuk mengulang pencarian.
4. ```N``` - Untuk mengulangi pencarian mundur.
5. ```:%s/kata-lama/kata-baru/g``` - Ganti semua format lama dengan format baru di seluruh file.
6. ```:s/kata-lama/kata-baru/g``` - Ganti semua format lama dengan format baru di baris saat ini.
7. ```:%s/kata-lama/kata-baru/gc``` - Ganti semua format lama dengan format baru di seluruh file dengan konfirmasi.

## Komentar di VIM

1. Arahkan kursor ke baris yang akan dikomentari.
2. Tekan ``esc`` lalu ketikan ``v``memulai mode visual block.
3. Tekan ``j`` untuk memilih baris yang akan dikomentari.
4. Jika sudah, tekan ```:``` lalu ketikan ``norm I#``.

## Hapus Komentar di VIM

1. Arahkan kursor ke baris yang akan dihapus komentarnya.
2. Tekan ``esc`` lalu ketikan ``v``memulai mode visual block.
3. Tekan ``j`` untuk memilih baris yang akan dihapus komentarnya.
4. Jika sudah, tekan ```:``` lalu ketikan ``norm x``.

## Open Link URL di VIM

1. Arahkan kursor ke link yang akan dibuka.
2. Tekan ``esc`` lalu ketikan ``gx``.

## Ubah Huruf di VIM

1. ``cw`` - Ubah kata dari kursor sampai akhir kata.
2. ``caw`` - Ubah kata termasuk spasi.
3. ``ciw`` - Ubah kata tanpa spasi.

## Buat File dan Folder di VIM
1. ``%`` - Membuat file baru.
2. ``d`` - Membuat folder baru.

## Hapus semua enter di vim
```:%s/\n/```

## Hapus semua space di vim
```:%s/\s//g```

## replace semua dari " ke \"
```:%s/"/\\"/g```

## Copy file to clipboard
```cat file.txt | xclip -selection clipboard```
atau

```cat file.txt | xclip -se c```

## Config default editor

Mengubah default test editor


```sh
sudo update-alternatives --config editor
```

Menambahkan path lainnya
```sh
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 100
```

Menghapus path config 
```sh
sudo update-alternatives --remove editor /usr/bin/nvim
```

My Favorit IDE neovim
```
https://github.com/lunarvim/lunarvim
```
```
https://github.com/NvChad/NvChad
```

## Terima Kasih
