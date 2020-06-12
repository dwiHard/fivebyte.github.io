# Rangkuman git
>di susun oleh Hardiyanto

### Daftar isi

* [Menambahkan identitas di github](#menambahkan-identitas-di-github)
* [Menambahkan Text editor](#menambahkan-text-editor)
* [Check Setting](#check-setting)
* [Clone dari repository](#clone-dari-repository)
* [Melihat status repository](#melihat-status-repository)
* [Menambahkan file ke repository](#menambahkan-file-ke-repository)
* [Membuat cabang baru](#membuat-cabang-baru)
* [Cek daftar cabang baru atau branch](#cek-daftar-cabang-baru-atau-branch)
* [Pindah cabang](#pindah-cabang)
* [Menggabungkan cabang](#menggabungkan-cabang)

#### Menambahkan identitas di github
Menambahkan nama
```
git config --global user.name "NAMA KAMU"
```
Menambahkan email
```
git config --global user.email EMAIL@example.com
```

#### Menambahkan Text editor
ini tidak harus dilakukan
```
git config --global core.editor NAMA TEXT EDITOR
```

#### Check Setting
```
git config --list
```

#### Clone dari repository
```
git clone URL
```

#### Melihat status repository
```
git status
```

#### Menambahkan file ke repository
```
git add nama_file
```
```
git commit -m "komentar"
```

#### Membuat cabang baru 
```
git branch NAMA_BRANCH
```

#### Cek daftar cabang baru atau branch 
```
git branch
```

#### Pindah cabang
```
git checkout NAMA_BRANCH
```

#### Menggabungkan cabang 
```
git merge nama_file
```
