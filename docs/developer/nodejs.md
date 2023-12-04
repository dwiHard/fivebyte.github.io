## Install NodeJs Ubuntu

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

```sh
source ~/.bashrc
```
untuk check list version node remote 

```sh
nvm list-remote
```

```sh
nvm install <version_node>
```

example:

```sh
nvm install v14.10.0
```
### Check list npm
untuk melihat check list local version node

```sh
nvm list
```

### Unistall Node Js

```sh
nvm uninstall <node_version>
```

## Install pm2


```sh
npm install -g pm2
```

configure pm2 untuk typescript
```sh
pm2 install typescript
```

menjalankan service
```sh
pm2 start src/index.ts --watch
```

untuk melihat service berjalan
```sh
pm2 ps
```

untuk menghentikan process
```sh
pm2 stop <pid>
```

untuk menghapus process dari daftar 
```sh
pm2 delete <pid>
```

untuk melihat logs
```sh
pm2 logs
```
