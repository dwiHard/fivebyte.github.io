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