
## Apa itu kubernetes?
Kubernetes, sering disingkat K8s, adalah sebuah platform sumber terbuka (open-source) yang digunakan untuk mengotomatiskan deployment, penskalaan, dan manajemen aplikasi yang terkontainerisasi. Bayangkan Anda memiliki banyak aplikasi yang berjalan dalam kontainer (seperti Docker), dan Anda ingin memastikan aplikasi-aplikasi itu selalu berjalan, dapat diakses, dan dapat menangani banyak pengguna secara efisien. Nah, di sinilah Kubernetes berperan. 🚀


## Instalasi

## Check version

```sh
kubectl version
```

atau:

```sh
kubectl version --short
```

## Kube Master

```sh
sudo kubeadm init --apiserver-advertise-address=<ip_address>
```

jika berhasil membuat cluster, maka akan muncul token untuk join ke cluster selanjutnya ketikan perintah berikut:

```sh
mkdir -p $HOME/.kube
```

```sh
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
```

```sh
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

## Kube join

```sh
kubeadm join <ip_address>:6443 --token <token_id>  --discovery-token-ca-cert-hash sha256:<token_value>
```
