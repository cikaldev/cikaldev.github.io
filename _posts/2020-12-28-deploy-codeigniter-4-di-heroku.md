---
layout: post
title:  "Deploy CodeIgniter 4 di Heroku"
date:   2020-12-28 16:24:37 +0700
categories: php codeigniter heroku
keywords: php,codeigniter,ci,ci-4,heroku,framework,deploy,tutorial
comments: true
---

update: 20-01-2021

## Buat project baru

Ketik perintah berikut :

```bash
composer create-project codeigniter4/appstarter olala-beibeh
```

Setelah selesai, buka file **composer.json** kemudian edit versi PHP menjadi v7.x

```json
{
  ...
  "require": {
    "php": "^7.2"
    ...
  }
  ...
}
```

**NOTE :** _Kenapa harus di edit? Karena Heroku akan menggunakan versi **Stable/Latest** di setiap install dependencies. Seperti kita tahu, saat ini PHP sudah mencapai **Versi 8** , sayangnya **CodeIgniter 4** belum support PHP 8, jadi kita harus manual memilih versi PHP yang akan di jalankan pada platform Heroku._

Ketik perintah `composer update`, jika setelah mengetik perintah tersebut terdapat error conflict versi PHP pada composer dengan versi PHP yang terinstall di komputer kalian.

Silahkan edit file `composer.lock`, cari dependencies versi php kemudian edit seperti langkah sebelumnya.

```json
  ...
  "php": "^7.2"
  ...
```

## Buat file Procfile

Kasih tau si Heroku, bahwa web kita index nya ada di folder public, jadi silahkan buat 1 file baru di root folder project, sejajar dengan folder app. Nama file nya **Procfile** tanpa ekstensi yaa.

Kemudian isi dengan perintah berikut, lalu simpan.

```
web: vendor/bin/heroku-php-apache2 public/
```

Silahkan lanjut kan perintah berikut :

```bash
cd olala-beibeh
git init
git add .
git commit -m "olala"
```

**NOTE :** _Pada perintah "**git add .**" terdapat simbol titik di akhir, jangan sampai ketinggalan!_

## Buat aplikasi baru di Heroku

Sampai disini project CodeIgniter 4 sudah jadi, sekarang kita lanjut buat Aplikasi Heroku via CLI / CMD / Terminal / Command Line. Pastikan anda sudah install Heroku-CLI di PC / Laptop yang digunakan dan pastikan juga sudah login ke akun Heroku di CLI.

Lanjut ketik perintah berikut :

```bash
heroku apps:create olala-beibeh
```

Setelah apps heroku berhasil dibuat, langkah terakhir untuk men-deploy aplikasi kita ke server heroku.

Silahkan ketik perintah berikut :

```bash
git push heroku master
```

Link Demo : <https://olala-beibeh.herokuapp.com>{: target="_blank"}

### Ga nyampe 5 menit web sudah Online..

Semoga bermanfaat.

![gif](/assets/media/deploy-heroku-ci4.mp4)
