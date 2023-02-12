## Prometheus
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
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/Tips/ansible.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My README</a>
  </p>
</div>

### Daftar Isi
* [Instalasi](#instalasi)
* [Persiapan Awal](#persiapan-awal)


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

#### Persiapan Awal
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