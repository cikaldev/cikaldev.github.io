---
layout: post
title:  "Implementasi API RajaOngkir dengan NodeJS + Express"
date:   2020-07-31 23:15:09 +0700
categories: nodejs javascript api
keywords: nodejs,javascript,api,rajaongkir,api,tutorial
comments: true
---
Pandemi bukan jadi satu halangan atau alasan bagi kita para developer untuk tetap berkarya, pasalnya sebelum masa pandemi pun, sebagian besar dari kita bekerja secara remote dari rumah / kantor / bahkan ada yang sambil duduk santuy di coffee shop.

Hari ini saya akan sharing dengan kalian, cara Implementasi API RajaOngkir dengan NodeJS dan Express. Saya asumsikan di PC / Laptop kalian sudah terinstall NodeJS, dan sebelumnya kalian sudah pernah berkenalan / latihan dengan NodeJS. Jadi kita tidak perlu membahas hal-hal mendasar yang sudah ada di jawaban dan tutorial nya di belantara Internet, saya akan langsung ke pokok pembahasan.

Demo sederhana bisa kalian kunjungi pada link berikut, [demo](https://kotaksabun.herokuapp.com/rajaongkir.html){: target="_blank" }.

Link dokumentasi RajaOngkir pada link berikut, [dockumentasi](https://rajaongkir.com/dokumentasi){: target="_blank" }.

## Real world, use case

Fitur Cek Ongkos Kirim (Ongkir), biasanya akan digunakan pada sistem / aplikasi / website Toko Online. Untuk meng-kalkulasi total belanja berikut ongkos kirim, fitur ini akan digunakan sebelum sistem / aplikasi / website yang kita buat menerbitkan Invoice / Nota Tagihan atas pembelanjaan Customer / Pelanggan.

Pada project ini saya menggunakan akun **Starter Plan**, yang hanya memiliki kemampuan untuk mengakses endpoint **Province**, **City**, **Costs**, dan limitasi hanya pada 3 kurir tersohor **JNE**, **POS Indonesia** dan **Tiki**. Singkat kata project kita kali ini hanya akan implementasi penarikan data pendukung wilayah dan implementasi cek ongkos kirim.

_lu-mayan lah daripada lu-manyun._ 😜

## Persiapan

* Untuk kalian yang **belum** memiliki akun. Silahkan register / daftar akun baru di situs **RajaOngkir** untuk mendapatkan "**APIKEY**", yang nantinya akan kita gunakan pada project sederhana kali ini. _(tenang starter plan nya gratis koq..)_
* Untuk kalian yang **sudah** memiliki akun. Silahkan masuk menu profil, kemudian catat "**APIKEY**" akun anda.
* Kopi dan Cemilan. (**WAJIB**) 😜

Jika persiapan sudah matang, mari kita langsung gaskeun main becek-becekan..

## Proses

Buat sebuah folder baru dimanapun kalian inginkan, kemudian beri nama "**ongkir**", lalu buka folder tersebut di Text Editor kesayangan kalian.

image

Lakukan inisialisasi NPM, dengan perintah :

```bash
npm init -y
```

Lanjut install paket yang kita butuhkan, dengan perintah :

```bash
npm install express cors axios --save
```

Struktur folder sudah dibuat, instalasi paket pun sudah selesai. Saatnya kita lanjut ke pembuatan kode backend dengan NodeJS + Express.

Buat sebuah file **index.js** pada root folder project kita, kemudian isi dengan kode berikut lalu simpan :

<script src="https://gist.github.com/cikaldev/fa7d2327d7e92b28642d7c1f066c1071.js"></script>

Penjelasan singkat **index.js** :

* Pada line 7, kita mendefinisikan **apiRouter** yang file nya akan dibuat pada langkah selanjutnya.
* Line 15, kita definisikan **apiRouter** tersebut pada path "**/api**" yang mana router ini kita berdayakan sebagai API penghubung antara frontend dengan backend.
* Line 17, kita definisikan aplikasi berjalan pada **Port 4000** (default), sedangkan jika aplikasi ini kita hosting di heroku atau hosting lainnya. maka dia akan mengikuti port yang sudah disediakan.

Lanjut ke proses berikutnya, buat sebuah file dengan nama **api.js** didalam folder **routes/api.js**, kemudian isi dengan kode berikut lalu simpan :

<script src="https://gist.github.com/cikaldev/af392aa593e364a4d953b625bd81b118.js"></script>

Penjelasan singkat **api.js** :

* Line 6-8, kita melakukan konfigurasi default Axios, supaya kita gak bersusah payah memasukkan APIKEY pada headers di setiap request.
* Line 7, silahkan masukkan APIKEY kalian (yang sudah dicatat sebelumnya di awal)
* Line 11-15, endpoint "**/api/provinsi**" akan me-return JSON data provinsi dari RajaOngkir. _(silahkan baca dokumentasi di link yang saya buat di awal)_
* Line 18-23, endpoint "**/api/kota/:provId**" akan me-return JSON data kota berdasarkan ID Provinsi yang di request pada parameter "**provId**" dari RajaOngkir. _(silahkan baca dokumentasi di link yang saya buat di awal)_
* Line 26-36, sama seperti sebelum nya. Akan me-return JSON data, namun yang jadi sorotan jumlah parameter yang lumayan serius kali ini 😃<br>
**:asal** = **int** ID Kota asal<br>
**:tujuan** = **int** ID Kota tujuan<br>
**:berat** = **int** Satuan gram (1kg = 1000g)<br>
**:kurir** = **string** [jne|pos|tiki]

Sampai tahap ini, kode backend sudah berhasil kita selesaikan. Mari beralih ke proses berikutnya yaitu pembuatan kode frontend, jangan berharap **Too Fancy** alias muluk-muluk, karena pada project ini saya tidak menitik beratkan tampilan yang keren dan kekinian, yang saya share adalah logic dan cara **Implementasi API RajaOngkir dengan NodeJS dan Express** _(gak pake bootstrap)_ 😜

Lanjut buat sebuah file dengan nama **index.html** didalam folder **public/index.html**, kemudian isi dengan kode berikut lalu simpan :

<script src="https://gist.github.com/cikaldev/de65b5f337a87f19d4c9408e1416a8c0.js"></script>

Penjelasan singkat **index.html** :

* Line 9, kita definisikan event onload. Saat pertama kali page di load akan melakukan request data provinsi ke backend.
* selebihnya tidak ada yang spesial di file ini, semua hanya layout jadul menggunakan tabel dengan 5 select option, 1 input number, dan 1 button element.

Lanjut ke proses berikut nya, buat sebuah file dengan nama **script.js** didalam folder **public/js/script.js** kemudian isi dengan kode berikut lalu simpan :

<script src="https://gist.github.com/cikaldev/ba009f6e26f223673fc758fb1613e7c4.js"></script>

Tinggal 1 file terakhir yang harus kita buat, sederhana saja untuk mempercantik tampilan form yang sudah kita buat pada file "**index.html**". Silahkan buat sebuah file dengan nama **style.css** didalam folder **public/css/style.css** kemudian isi dengan kode berikut lalu simpan :

<script src="https://gist.github.com/cikaldev/17056b6baf2df81822ef33c7951803ae.js"></script>

Dan saat nya kita lakukan percobaan pada project ini, apakah sudah berjalan sebagaimana mesti nya? atau terdapat error, karena typo atau salah ketik dalam penulisan kode. 😃

Untuk menyalakan server, silahkan jalankan perintah berikut :

```bash
node index.js
```

Jika server sudah berjalan, silahkan buka browser anda kemudian akses URL <http://localhost:4000>{: target="_blank"}

Semoga bermanfaat..