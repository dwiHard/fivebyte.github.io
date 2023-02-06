<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="https://git-scm.com/images/logos/downloads/Git-Logo-1788C.svg" alt="Logo" width="140" height="100">
  </a>

<h3 align="center">README-Git</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/README.md"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/Tips/git.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/Tips/git.md#kumpulan-link-github">Awesome Link</a>
  </p>
</div>


### Daftar isi

* [Menambahkan identitas di github](#menambahkan-identitas-di-github)
* [Menambahkan Text editor](#menambahkan-text-editor)
* [Check list config](#check-list-config)
* [Clone dari repository](#clone-dari-repository)
* [Git Connect SSH](#git-connect-ssh)
* [Alternatif Connect](#alternatif-connect)
* [Menambahkan Repository](#menambahkan-repository)
* [Melihat status repository](#melihat-status-repository)
* [Menambahkan file ke repository](#menambahkan-file-ke-repository)
* [Menambahkan komentar](#menambahkan-komentar)
* [Melihat Perubahan di file](#melihat-perubahan-di-file)
* [Membatalkan perubahan](#membatalkan-perubahan)
* [Membatalkan perubahan Staging index](#membatalkan-perubahan-staging-index)
* [Commit Log History](#commit-log-history)
* [Compare Commit](#compare-commit)
* [Git Reset commit](#git-reset-commit)
* [Membuat cabang baru](#membuat-cabang-baru)
* [Memindahkan cabang](#memindahkan-cabang)
* [Push file ke repository](#push-file-ke-repository)
* [Cek daftar cabang baru atau branch](#cek-daftar-cabang-baru-atau-branch)
* [Pindah cabang](#pindah-cabang)
* [Menggabungkan cabang](#menggabungkan-cabang)
* [Kumpulan link github](#kumpulan-link-github)

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
cara untuk menambahkan dengan visual studio code
```
git config --global core.editor "code --wait"
```
```
git config --global diff.tool "default-difftool"
```
```
git config --global difftool.default-difftool.cmd "code --wait --diff \$LOCAL \$REMOTE"
```

#### Check list config
```
git config --list
```
```
git config --list --show-origin
```

#### Clone dari repository
```
git clone URL
```

#### Git Connect SSH
buat ssh-keygen
```
ssh-keygen -t ed25519
```
Edit di ```~/.ssh/config```
```
Host gitlab.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519

```
cek status ssh
```
ssh -T git@gitlab.com
```
#### Alternatif Connect
```
1. Goto https://gitlab.com/profile/personal_access_tokens
2. Create new token and mark check to all.
3. Copy your token
4. Now go to your Terminal and paste it like this.
5. git clone https://oauth2:YOUR_TOKEN@gitlab.com/PROFILE_NAME/REPO_NAME.git/

```

#### Menambahkan Repository
```
git init
```

#### Melihat status repository
```
git status
```

#### Menambahkan file ke repository
```
git add nama_file
```

#### Menambahkan komentar
```
git commit -m "komentar"
```
#### Melihat Perubahan di file
```
git diff
```
#### Membatalkan perubahan
```
git clean -f
```
#### Membatalkan perubahan file/penghapusan file
```
git restore namaFile
```
#### Membatalkan perubahan Staging index
```
git restore --staged namaFile
```
#### Commit Log History
melihat commit log
```
git log
```
Melihat log dengan detail
```
git log -p NamaFile
```
Melihat siapa yang melakukan commit
```
git blame NamaFile
```
Melihat log satu line
```
git log --oneline
```
melihat log dengan grafik
```
git log --oneline --graph
```
Melihat Detail commit dengan kode hash
```
git show hashnya
```
#### Compare Commit
```
git diff hash1 hash2
```
untuk melihat diVSCode
```
git difftool hash1 hash2
```
#### Git Reset commit
untuk mode ada soft, mixed dan hard
```
git reset <mode> hash
```
example
```
git reset --soft hash
```
#### Membuat cabang baru 
```
git branch NAMA_BRANCH
```

#### Memindahkan cabang
```
git switch -c master
```

#### Push file ke repository
```
git push origin master
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

#### Kumpulan link github

Linux :
- <a href="https://github.com/hastinbe/theme-kawasaki">Theme Kawasaki</a> - Untuk custom tema pada fish(terminal)
- <a href="https://github.com/vinceliuice/Vimix-cursors">Vimix Cursors</a> - Untuk custom cursor Linux
- <a href="https://github.com/vinceliuice/Tela-circle-icon-theme">Tela Circle Icon Theme</a> - Untuk custom tema desktop enviroment linux
- <a href="https://www.xfce-look.org/p/1661983">Icon Favorit</a> - My Favorit icon theme


Testing :
- <a href="https://github.com/KathanP19/HowToHunt">How To Hunt</a> - Belajar mencari Vulnerability/kerentanan
- <a href="https://github.com/gchq/CyberChef">Cyber Chef</a> - a web app for encryption, encoding, compression and data analysis
- <a href="https://github.com/medpaf/hawk">Hawk</a> - Network and pentest tool for Linux systems
- <a href="https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/XSS%20Injection">XSS</a> - Belajar Cross-site scripting (XSS)
- <a href="https://github.com/ivan-sincek/xss-catcher">XSS Catcher</a> - Belajar Cross-site scripting (XSS)
- <a href="https://github.com/PushpenderIndia/thorse">RAT</a> - RAT (Remote Administrator Trojan)
- <a href="https://github.com/m4ndingo/.net-WebBruteForcer">BruteForce</a> -  Web Belajar BruteForcer and tujuan pentesting 
- <a href="https://github.com/kaotickj/The-Not-So-Simple-PHP-Command-Shell">Simple PHP Command Shell</a> - Script Shell PHP
- <a href="https://github.com/swagkarna/Nivistealer">Nivistealer</a> - Tools Untuk Melakukan Serangan
- <a href="https://github.com/HerraVp/H4X-Tools">H4X Tools</a> - Tools Untuk Melakukan Serangan
- <a href="https://github.com/Sunlight-Rim/SQLbit">SQL bit</a> - SQL Injection
- <a href="https://github.com/d4rckh/vaf">VAF</a> - very advanced (web) fuzzer
- <a href="https://github.com/sebastienrousseau/password-generator">Password Generator</a> - Password Generator
- <a href="https://github.com/anouarbensaad/wsvuls">Ws Vuln</a> - Website vulnerabilit
- <a href="https://github.com/XZB-1248/Spark">Spark</a> - RAT (Remote Administration Tool)
- <a href="https://github.com/Johnng007/Live-Forensicator">Live Forensicator</a> - Forensic
- <a href="https://github.com/botherder/androidqf">Android Qf</a> - Android Quick Forensics
- <a href="https://github.com/mrd0x/EvilSelenium">Evil Selenium</a> - Selenium Attact
- <a href="https://github.com/Anteste/WebMap">Web Map</a> - Web Vulnerability
- <a href="https://github.com/RAJANAGORI/Nightingale">Nightingle</a> - Docker for Pentesters
- <a href="https://github.com/TelefonicaTC2Tech/packagedna">Packagedna</a> - This tool gives developers, researchers and companies the ability to analyze software packages 
- <a href="https://github.com/Esc4iCEscEsc/skanuvaty">Skanuvaty</a> - Dangerously fast dns/network/port scanner, all-in-one
- <a href="https://github.com/megadose/toutatis">Tuotatis</a> - information from instagrams accounts
- <a href="https://github.com/rly0nheart/octosuite">Octosuite</a> - OSINT Framework
- <a href="https://github.com/bmshifat/TecSpy">Tec Spy</a> - A cloud-based Android Monitoring Tools
- <a href="https://github.com/obsidianforensics/hindsight">Hindsignt</a> - Hindsight is a free tool for analyzing web artifacts 

Android :
- <a href="https://github.com/newbit1/rootAVDa">Root AVD</a> - Root AVD Android Virtual Device
- <a href="https://github.com/tanprathan/MobileApp-Pentest-Cheatsheet">Mobile Pentest CheetSheet</a> - Mobile Cheet Sheet tujuan pentest



### Terima Kasih
