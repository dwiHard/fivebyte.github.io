## Install

```sh
composer create-project --prefer-dist laravel/laravel NamaProject
```

install laravel berdasarkan versinya

```sh
composer create-project --prefer-dist laravel/laravel:^7.0 NamaProject
```

## Migration

```sh
php artisan make:migration NameMigration --create=Nama
```

```sh
php artisan migrate
```

Lebih detail bisa lihat link dibawah ini
https://laravel.com/docs/8.x/migrations#introduction

## Buat Controller dan Model

```sh
php artisan make:controller DataController --resource --model=Data
```

## Install Dompdf

```sh
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

## Install Bootstrap in Laravel

```sh
composer require laravel/ui:^2.4
```

```sh
php artisan ui bootstrap
```

```sh
npm install && npm run dev
```

## Memindahkan laravel berbeda platform

```sh
composer install
```

```sh
php artisan key:generate  
```

```sh
php artisan cache:clear
```

jika terjadi error **Failed to clear cache. Make sure you have the appropriate permissions.**__ masuk folder _bootstrap/cache/_ hapus semua file didalamnya

```sh
php artisan migrate
```

## Terima kasih
