## Menambahkan identitas di github

Menambahkan nama

```sh
git config --global user.name "NAMA KAMU"
```

Menambahkan email

```sh
git config --global user.email EMAIL@example.com
```

## Menambahkan Text editor

ini tidak harus dilakukan

```sh
git config --global core.editor NAMA TEXT EDITOR
```

cara untuk menambahkan dengan visual studio code

```sh
git config --global core.editor "code --wait"
```

```sh
git config --global diff.tool "default-difftool"
```

```sh
git config --global difftool.default-difftool.cmd "code --wait --diff \$LOCAL \$REMOTE"
```

## Check list config

```sh
git config --list
```

```sh
git config --list --show-origin
```

## Clone dari repository

```sh
git clone URL
```

## Git Connect SSH

buat ssh-keygen

```sh
ssh-keygen -t ed25519
```

Edit di ```~/.ssh/config```

```bash
Host gitlab.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519
```

cek status ssh

```sh
ssh -T git@gitlab.com
```

## Alternatif Connect

1. Goto https://gitlab.com/profile/personal_access_tokens
2. Create new token and mark check to all.
3. Copy your token
4. Now go to your Terminal and paste it like this.
5. git clone https://oauth2:YOUR_TOKEN@gitlab.com/PROFILE_NAME/REPO_NAME.git/

## Menambahkan Repository

```sh
git init
```

## Melihat status repository

```sh
git status
```

## Menambahkan file ke repository

```sh
git add nama_file
```

## Menambahkan komentar

```sh
git commit -m "komentar"
```

## Melihat Perubahan di file

```sh
git diff
```

## Membatalkan perubahan

```sh
git clean -f
```

## Membatalkan perubahan file/penghapusan file

```sh
git restore namaFile
```

## Membatalkan perubahan Staging index

```sh
git restore --staged namaFile
```

## Commit Log History

melihat commit log

```sh
git log
```

Melihat log dengan detail

```sh
git log -p NamaFile
```

Melihat siapa yang melakukan commit

```sh
git blame NamaFile
```

Melihat log satu line

```sh
git log --oneline
```

melihat log dengan grafik

```sh
git log --oneline --graph
```

Melihat Detail commit dengan kode hash

```sh
git show hashnya
```

## Compare Commit

```sh
git diff hash1 hash2
```

untuk melihat diVSCode

```sh
git difftool hash1 hash2
```

## Git Reset commit

untuk mode ada soft, mixed dan hard

```sh
git reset <mode> hash
```

example

```sh
git reset --soft hash
```

## Membuat cabang baru 

```sh
git branch NAMA_BRANCH
```

## Memindahkan cabang

```sh
git switch -c master
```

## Push file ke repository

```sh
git push origin master
```

## Cek daftar cabang baru atau branch 

```sh
git branch
```

## Pindah cabang

```sh
git checkout NAMA_BRANCH
```

## Menggabungkan cabang 

```sh
git merge nama_file
```

## Kumpulan link github

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
- <a href="https://github.com/rev1si0n/lamda/">Lamda</a> - A tool for automating the process of creating a lambda function

Android :
- <a href="https://github.com/newbit1/rootAVDa">Root AVD</a> - Root AVD Android Virtual Device
- <a href="https://github.com/tanprathan/MobileApp-Pentest-Cheatsheet">Mobile Pentest CheetSheet</a> - Mobile Cheet Sheet tujuan pentest

Machine learning  :
- <a href="https://github.com/doccano/doccano">Doccano</a> - Open Source Text Annotation Tool for Humans



## Terima Kasih
