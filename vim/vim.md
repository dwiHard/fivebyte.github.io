<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="https://github.com/dwiHard/five_byte.github.io/blob/master/images/Vim.svg" alt="Logo" width="140" height="100">
  </a>

<h3 align="center">README-Vim</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/README.md"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/vim/vim.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io/tree/master/vim">Awesome Konfiguration</a>
  </p>
</div>


### Daftar Isi
* [Gerakan Kursor dalam Mode Normal](#gerakan-kursor-dalam-mode-normal)
* [Insert mode](#insert-mode)
* [Copy, Paste dan Delete](#copy-paste-dan-delete)
* [Search and Replace Pattern in Vim](#search-and-replace-pattern-in-vim)
* [Configurasi Me](https://gitlab.com/dwiHard/LinuxAdministration/-/blob/master/vim/.vimrc)


#### Gerakan Kursor dalam Mode Normal
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


#### Insert mode

1. ```i``` - Masukkan sebelum kursor.
2. ```I``` - Masukkan di awal baris, ini berguna saat Anda berada di tengah baris.
3. ```a``` - Masukkan setelah kursor.
4. ```A``` - Masukkan di akhir baris.
5. ```o``` - Buka baris baru di bawah garis saat ini.
6. ```O``` - Tambahkan baris baru di atas garis saat ini.
7. ```ea``` - Masukkan di akhir kata.
 

#### Copy, Paste dan Delete

1. ```yy``` - copy satu baris.
2. ```p/P``` - Tempel setelah kursor / diletakkan sebelum kursor
3. ```dd``` - hapus satu baris.
4. ```dw``` - hapus kata


#### Search and Replace Pattern in Vim

1. ```/``` - Untuk mencari kata yang diberikan.
2. ```?``` - Untuk mencari mundur kata yang diberikan.
3. ```n``` - Untuk mengulang pencarian.
4. ```N``` - Untuk mengulangi pencarian mundur.
5. ```:%s/kata-lama/kata-baru/g``` - Ganti semua format lama dengan format baru di seluruh file.
6. ```:s/kata-lama/kata-baru/g``` - Ganti semua format lama dengan format baru di baris saat ini.
7. ```:%s/kata-lama/kata-baru/gc``` - Ganti semua format lama dengan format baru di seluruh file dengan konfirmasi.



### Terima Kasih
