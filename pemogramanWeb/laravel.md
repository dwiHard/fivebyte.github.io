# Ringkasan Laravel
> disusun oleh Hardiyanto


### Daftar Isi
- [x] [Install](#install)
- [x] [Migration](#migration)
- [x] [Buat Controller dan Model](#buat-controller-dan-model)
- [x] [Install Dompdf](#install-dompdf)
- [x] [Install Bootstrap in Laravel](#install-bootstrap-in-laravel)
- [x] [Memindahkan laravel berbeda platform](#memindahkan-laravel-berbeda-platform)


#### Install
```
$ composer create-project --prefer-dist laravel/laravel NamaProject
```
install laravel berdasarkan versinya
```
$ composer create-project --prefer-dist laravel/laravel:^7.0 NamaProject

```

#### Migration
```
$ php artisan make:migration NameMigration --create=Nama
```
```
$ php artisan migrate
```
Lebih detail bisa lihat link dibawah ini

https://laravel.com/docs/8.x/migrations#introduction

#### Buat Controller dan Model
```
$ php artisan make:controller DataController --resource --model=Data
```

#### Install Dompdf
```
$ composer require barryvdh/laravel-dompdf
```
Edit di ```config/app.php```
```
'providers' => [

    Barryvdh\DomPDF\ServiceProvider::class,
],
'aliases' => [

    'PDF' => Barryvdh\DomPDF\Facade::class,
]
```

#### Install Bootstrap in Laravel
```
$ composer require laravel/ui:^2.4
```
```
$ php artisan ui bootstrap
```
```
$ npm install && npm run dev
```

#### Memindahkan laravel berbeda platform
```
$ composer install
```
```
$ php artisan key:generate  
```
```
$ php artisan cache:clear
```
jika terjadi error **Failed to clear cache. Make sure you have the appropriate permissions.**__ masuk folder _bootstrap/cache/_ hapus semua file didalamnya
```
$ php artisan migrate
```

### Terima kasih
