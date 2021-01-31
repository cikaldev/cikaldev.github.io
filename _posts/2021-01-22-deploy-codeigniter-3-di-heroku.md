---
layout: post
title:  "Deploy CodeIgniter 3 di Heroku"
date:   2021-01-22 01:17:00 +0700
categories: php codeigniter heroku
keywords: php,codeigniter,ci,ci-3,heroku,framework,deploy,tutorial
comments: true
---

## Buat project baru & atur config

Silahkan download file release nya <a href="https://api.github.com/repos/bcit-ci/CodeIgniter/zipball/3.1.11" target="_blank">di sini</a>. Kemudian extract dan rename sesuai nama project anda yang akan di host ke heroku.


### Update composer dependencies

Silahkan buka file "**composer.json**" dan hapus semua isi nya, kemudian ketik kode berikut:

```json
{
  "require": {
    "php": "^7.2"
  }
}
```

**NOTE :** _Kenapa harus di edit? Karena Heroku akan menggunakan versi **Stable/Latest** di setiap install dependencies. Seperti kita tahu, saat ini PHP sudah mencapai **Versi 8** , sayangnya **CodeIgniter** belum support PHP 8, jadi kita harus manual memilih versi PHP yang akan di jalankan pada platform Heroku._

Setelah selesai update dependencies composer pada langkah diatas, silahkan ketik perintah **composer update**, jika setelah mengetik perintah tersebut terdapat error conflict versi PHP pada composer dengan versi PHP yang terinstall di komputer kalian.

Silahkan edit file "**composer.lock**", cari dependencies versi php kemudian edit seperti langkah sebelumnya.

```json
  ...
  "php": "^7.2"
  ...
```

### Edit Config & Autoload

Silahkan buka file "**application/config/config.php**" kemudian lakukan edit pada "**base_url**" dan "**index_page**" kosongkan isinya.

line 26 edit menjadi:

```php
$config['base_url'] = '';
```

line 38 edit menjadi:

```php
$config['index_page'] = '';
```

Silahkan simpan, selanjutnya silahkan buka file "**application/config/autoload.php**". Lakukan edit pada line 92, disini kita akan me-load helper url.

line 92 edit menjadi:

```php
$autoload['helper'] = array('url');
```

Jika sudah selesai, silahkan simpan. Sampai tahap ini, urusan config saya rasa sudah selesai.


### Buat file .htaccess

Selanjutnya silahkan buat file htaccess di root folder project sejajar dengan folder **application**.

File "**.htaccess**"

```
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php/$1 [L]
```

## Deploy

Sebelum melakukan deploy, silahkan buat 1 file baru di root folder project, sejajar dengan folder application. Nama file nya "**Procfile**" tanpa ekstensi yaa.

Kemudian isi dengan perintah berikut, lalu simpan.

```
web: vendor/bin/heroku-php-apache2 /
```

Silahkan lanjut kan perintah berikut :

```bash
# sesuaikan dengan nama project anda
cd latihan-ci3
# lakukan initialisasi git
git init
# tambahkan file2 project ke git, baca note dibawah
git add .
# simpan / commit perubahan
git commit -m "latihan"
```

**NOTE :** _Pada perintah "**git add .**" terdapat simbol titik di akhir, jangan sampai ketinggalan!_

## Buat aplikasi baru di Heroku

Sampai disini project CodeIgniter 3 sudah jadi, sekarang kita lanjut buat Aplikasi Heroku via CLI / CMD / Terminal / Command Line. Pastikan anda sudah install Heroku-CLI di PC / Laptop yang digunakan dan pastikan juga sudah login ke akun Heroku di CLI.

Lanjut ketik perintah berikut :

```bash
# sesuaikan dengan nama project anda
heroku apps:create latihan-ci3
```

Setelah apps heroku berhasil dibuat, langkah terakhir untuk men-deploy aplikasi kita ke server heroku.

Silahkan ketik perintah berikut :

```bash
git push heroku master
```

Link Demo : <a href="https://latihan-ci3.herokuapp.com" target="_blank">https://latihan-ci3.herokuapp.com</a>

Sampai disini kita sudah berhasil menyelesaikan tutorial "_Deploy CodeIgniter 3 di Heroku_", silahkan anda kembangkan project latihan ini sesuai kebutuhan anda.

Semoga bermanfaat.
