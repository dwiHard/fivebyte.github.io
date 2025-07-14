## Apa itu ansible?
Ansible adalah alat otomatisasi sumber terbuka (open-source) yang sangat populer untuk konfigurasi manajemen, deployment aplikasi, dan orkestrasi tugas IT lainnya. Intinya, Ansible membantu Anda mengotomatiskan tugas-tugas berulang di banyak server secara efisien dan konsisten.

## Instalasi
Instalasi ansible di ubuntu

```sh
sudo apt update
```

```sh
sudo apt install software-properties-common
```

```sh
sudo add-apt-repository --yes --update ppa:ansible/ansible
```

```sh
sudo apt install ansible
```

untuk lebih detail bisa cek di https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu
Instalasi ansible di arch linux

```sh
sudo pacman -S ansible-core
``` 

## Audit UFW

check rule iptables

```sh
sudo iptables -L -n 
```

code:

```yaml
---
- name: "Configuring UFW/Iptables"
  hosts: localhost
  connection: local
  tasks:
    - name: "Enable rsyslog service"
      service:
        name: rsyslog
        state: started
        enabled: yes
      become: yes
      become_method: sudo
    - name: "Configure UFW/Iptables"
      ufw:
        state: enabled
        policy: allow
      become: yes
      become_method: sudo
    - name: "Log SYN packets in INPUT Chain"
      lineinfile:
        path: /etc/ufw/after.rules
        line: "-A ufw-after-input -p tcp --syn -j LOG --log-prefix \"[UFW-SYN-LOG]\""
        insertbefore: "# don't delete the 'COMMIT' line or these rules won't be processed"
      become: yes
      become_method: sudo
``` 

restart ufw

```sh
sudo systemctl restart ufw
``` 

test rule iptables
pada server jalankan:

```sh
nc -lvnp 9001
```

remote server jalankan:

```sh
nc <ip-server> 9001
```

check log pada server

```sh
sudo cat /var/log/syslog | grep -i SYN
```

## AuditD

code:

```yaml
- name: "Download file AuditD and configure AuditD"
  hosts: localhost
  tasks:
    - name: "Install AuditD"
      apt:
        name: auditd
        state: present
      become: yes
      become_method: sudo
    - name: "Download file auditd.yml from github"
      get_url:
        url: "https://raw.githubusercontent.com/Neo23x0/auditd/master/audit.rules"
        dest: "backup/auditd.rules"
    - name: "Configure AuditD rules"
      copy:
        src: "backup/auditd.rules"
        dest: "/etc/audit/rules.d/audit.rules"
        owner: root
        group: root
        mode: 0640
      become: yes
      become_method: sudo
```

restart auditd

```sh
sudo pkill -HUP auditd
```

check log

```sh
sudo tail -f /var/log/audit/audit.log
```

check report

```sh
aureport
```

```sh
ausearch -m USER_AUTH
```

## Explorer

install sshpass

```sh
sudo pacman -S sshpass
```

copy file ansible ke direktori yang diinginkan

```sh
cp -rf /etc/ansible/ ~/Documents/ansible/ansible-docker
```

edit file ansible.cfg, rubah seperti berikut: 

```
hosts_key_checking=false
```

disable password authentication

```sh
sudo vim /etc/sudoers
```

edit seperti berikut

```
docker ALL=(ALL) NOPASSWD: ALL
```

### Menjalankan Ansible Playbook

```sh
ansible-playbook -i hosts playbook.yml
```

### Terima Kasih
