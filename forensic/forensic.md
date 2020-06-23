# Trik & Tips Forensic
> Disusun oleh Hardiyanto

### Daftar Isi

* [John the Ripper](#john-the-ripper)
* [Recon-ng](#reconng)

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
pip install flask
pip install dicttoxml
pip install unicodecsv
pip install xlsxwriter
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
recon-ng -r PATH
```
Menyimpan output menggunakan spool
```
spool start
```
```
spool stop
```


### Terima Kasih

