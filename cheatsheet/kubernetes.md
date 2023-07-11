## Kubernetes
> disusun oleh Hardiyanto

<div align="center">
  <a href="https://kubernetes.io/id/docs/home/">
    <img src="https://github.com/dwiHard/five_byte.github.io/blob/master/images/kubernetes.png" alt="Logo" width="140" height="100">
  </a>

<h3 align="center">README-Kubernetes</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://kubernetes.io/id/docs/home/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/cheatsheet/kubernetes.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My README</a>
  </p>
</div>

### Daftar Isi
* [Instalasi](#instalasi)
* [Basic Command](#basic-command)
  * [Check version](#check-version)
  * [Kube Master](#kube-master)


### Instalasi
### Basic Command
#### Check version
```
kubectl version
```
atau:
```
kubectl version --short
```
#### Kube Master
```
sudo kubeadm init --apiserver-advertise-address=<ip_address>
```
jika berhasil membuat cluster, maka akan muncul token untuk join ke cluster selanjutnya ketikan perintah berikut:
```
mkdir -p $HOME/.kube
```
```
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
```
```
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

#### Kube join
```
kubeadm join <ip_address>:6443 --token <token_id>  --discovery-token-ca-cert-hash sha256:<token_value>
```