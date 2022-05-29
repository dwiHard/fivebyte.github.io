# Rangkuman git
>di susun oleh Hardiyanto

### Daftar isi

* [Menambahkan identitas di github](#menambahkan-identitas-di-github)
* [Menambahkan Text editor](#menambahkan-text-editor)
* [Check list config](#check-list-config)
* [Clone dari repository](#clone-dari-repository)
* [Git Connect SSH](#git-connect-ssh)
* [Alternatif Connect](#alternatif-connect)
* [Melihat status repository](#melihat-status-repository)
* [Menambahkan file ke repository](#menambahkan-file-ke-repository)
* [Menambahkan komentar](#menambahkan-komentar)
* [Membuat cabang baru](#membuat-cabang-baru)
* [Memindahkan cabang](#memindahkan-cabang)
* [Cek daftar cabang baru atau branch](#cek-daftar-cabang-baru-atau-branch)
* [Pindah cabang](#pindah-cabang)
* [Menggabungkan cabang](#menggabungkan-cabang)
* [Kumpulan link github](#kumpulan-link-github)

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
#### Alternatif Connect
```
1. Goto https://gitlab.com/profile/personal_access_tokens
2. Create new token and mark check to all.
3. Copy your token
4. Now go to your Terminal and paste it like this.
5. git clone https://oauth2:YOUR_TOKEN@gitlab.com/PROFILE_NAME/REPO_NAME.git/

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

#### Memindahkan cabang
```
$ git switch -c master
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

#### Kumpulan link github

Linux :
- <https://github.com/hastinbe/theme-kawasaki> - Custom fish
- <https://github.com/vinceliuice/Vimix-cursors> - Custom cursor Linux
- <https://github.com/vinceliuice/Tela-circle-icon-theme> - Custom tema linux
- <https://www.xfce-look.org/p/1661983> - My Favorit icon theme


Testing :
- <https://github.com/KathanP19/HowToHunt> - Tutorial Vulnerability
- <https://github.com/gchq/CyberChef> - a web app for encryption, encoding, compression and data analysis
- <https://github.com/medpaf/hawk> - Hawk:-- Network and pentest tool for Linux systems
- <https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/XSS%20Injection> - XSS
- <https://github.com/ivan-sincek/xss-catcher> - XSS
- <https://github.com/PushpenderIndia/thorse> - RAT (Remote Administrator Trojan)
- <https://github.com/m4ndingo/.net-WebBruteForcer> - BruteForce
- <https://github.com/kaotickj/The-Not-So-Simple-PHP-Command-Shell> - Serangan
- <https://github.com/swagkarna/Nivistealer> - Serangan
- <https://github.com/HerraVp/H4X-Tools> - Tools Serangan
- <https://github.com/Sunlight-Rim/SQLbit> - SQL Injection
- <https://github.com/d4rckh/vaf> - very advanced (web) fuzzer
- <https://github.com/sebastienrousseau/password-generator> - Password Generator
- <https://github.com/anouarbensaad/wsvuls> - Website vulnerabilit
- <https://github.com/XZB-1248/Spark> - RAT (Remote Administration Tool)
- <https://github.com/Johnng007/Live-Forensicator> - Forensic
- <https://github.com/botherder/androidqf> - Android Quick Forensics
- <https://github.com/mrd0x/EvilSeleniu>m - Selenium Attact
- <https://github.com/Anteste/WebMap> - Web Vulnerability
- <https://github.com/RAJANAGORI/Nightingale> - Docker for Pentesters
- <https://github.com/TelefonicaTC2Tech/packagedna> - This tool gives developers, researchers and companies the ability to analyze software packages 
- <https://github.com/Esc4iCEscEsc/skanuvaty> - Dangerously fast dns/network/port scanner, all-in-one
- <https://github.com/megadose/toutatis> - information from instagrams accounts
- <https://github.com/rly0nheart/octosuite> - OSINT Framework
- <https://github.com/bmshifat/TecSpy> - A cloud-based Android Monitoring Tools
- <https://github.com/obsidianforensics/hindsight> - Hindsight is a free tool for analyzing web artifacts 

Android :
- <https://github.com/newbit1/rootAVDa> - Root AVD



### Terima Kasih
