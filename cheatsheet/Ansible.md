## Ansible
> disusun oleh Hardiyanto

<div align="center">
  <a href="https://docs.ansible.com/">
    <img src="https://github.com/dwiHard/five_byte.github.io/blob/master/images/ansible.jpg" alt="Logo" width="140" height="100">
  </a>

<h3 align="center">README-Ansible</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://docs.ansible.com/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/cheatsheet/ansible.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My README</a>
  </p>
</div>

### Daftar Isi
* [Instalasi](#instalasi)
* [Audit UFW](#audit-ufw)
* [AuditD](#auditd)
* [Explorer](#explorer)


#### Instalasi
Instalasi ansible di ubuntu
```
sudo apt update
```
```
sudo apt install software-properties-common
```
```
sudo add-apt-repository --yes --update ppa:ansible/ansible
```
```
sudo apt install ansible
```
untuk lebih detail bisa cek di https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu

Instalasi ansible di arch linux
```
sudo pacman -S ansible-core
```

#### Audit UFW
check rule iptables
```
sudo iptables -L -n 
```
code:
```
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
```
sudo systemctl restart ufw
```
test rule iptables
pada server jalankan:
```
nc -lvnp 9001
```
remote server jalankan:
```
nc <ip-server> 9001
```
check log pada server
```
sudo cat /var/log/syslog | grep -i SYN
```

#### AuditD
code:
```
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
```
sudo pkill -HUP auditd
```
check log
```
sudo tail -f /var/log/audit/audit.log
```
check report
```
aureport
```
```
ausearch -m USER_AUTH
```
#### Explorer
install sshpass
```
sudo pacman -S sshpass
```
copy file ansible ke direktori yang diinginkan
```
cp -rf /etc/ansible/ ~/Documents/ansible/ansible-docker
```
edit file ansible.cfg, rubah seperti berikut
```
hosts_key_checking=false
```
disable password authentication
```
sudo vim /etc/sudoers
```
edit seperti berikut
```
docker ALL=(ALL) NOPASSWD: ALL
```

#### Menjalankan Ansible Playbook
```
ansible-playbook -i hosts playbook.yml
```