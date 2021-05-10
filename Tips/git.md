# Rangkuman git
>di susun oleh Hardiyanto

### Daftar isi

* [Menambahkan identitas di github](#menambahkan-identitas-di-github)
* [Menambahkan Text editor](#menambahkan-text-editor)
* [Check list config](#check-list-config)
* [Clone dari repository](#clone-dari-repository)
* [Git Connect SSH](#git-connect-ssh)
* [Melihat status repository](#melihat-status-repository)
* [Menambahkan file ke repository](#menambahkan-file-ke-repository)
* [Menambahkan komentar](#menambahkan-komentar)
* [Membuat cabang baru](#membuat-cabang-baru)
* [Cek daftar cabang baru atau branch](#cek-daftar-cabang-baru-atau-branch)
* [Pindah cabang](#pindah-cabang)
* [Menggabungkan cabang](#menggabungkan-cabang)

#### Menambahkan identitas di github
Menambahkan nama
```
$ git config --global user.name "NAMA KAMU"
```
Menambahkan email
```
$ git config --global user.email EMAIL@example.com
```

#### Menambahkan Text editor
ini tidak harus dilakukan
```
$ git config --global core.editor NAMA TEXT EDITOR
```

#### Check list config
```
$ git config --list
```

#### Clone dari repository
```
$ git clone URL
```

#### Git Connect SSH
buat ssh-keygen
```
$ ssh-keygen -t ed25519
```
Edit di ```~/.ssh/config```
```
Host gitlab.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519

```
cek status ssh
```
$ ssh -T git@gitlab.com
```
#### Melihat status repository
```
$ git status
```

#### Menambahkan file ke repository
```
$ git add nama_file
```

#### Menambahkan komentar
```
$ git commit -m "komentar"
```

#### Membuat cabang baru 
```
$ git branch NAMA_BRANCH
```

#### Push file
```
$ git push origin master
```

#### Cek daftar cabang baru atau branch 
```
$ git branch
```

#### Pindah cabang
```
$ git checkout NAMA_BRANCH
```

#### Menggabungkan cabang 
```
$ git merge nama_file
```

### Terima Kasih
