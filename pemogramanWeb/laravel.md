# Ringkasan Laravel
> disusun oleh Hardiyanto


### Daftar Isi
- [x] [Install]
- [x] [Migration]
- [x] [Buat Controller dan Model]
- [x] [Install Dompdf]


#### Insatall
```
composer create-project --prefer-dist laravel/laravel NamaProject
```

#### Migration
```
php artisan make:migration NameMigration --create=Nama
```
```
php artisan migrate
```
Lebih detail bisa lihat link dibawah ini

https://laravel.com/docs/8.x/migrations#introduction

### Buat Controller dan Model
```
php artisan make:controller DataController --resource --model=Data
```

### Install Dompdf
```
composer require barryvdh/laravel-dompdf
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
