# HTTP Server Transfer File Linux - Android

Panduan ini menjelaskan cara membuat server HTTP sederhana di Linux menggunakan Python, sehingga kamu bisa mentransfer file antar perangkat (misal: dari Linux ke Android) melalui jaringan lokal.

## 1. Cek IP Address

Pastikan kamu mengetahui alamat IP komputer Linux yang akan dijadikan server.

```bash
ifconfig | more
```
Cari bagian `inet` pada interface yang aktif (biasanya `wlan0` untuk WiFi atau `eth0` untuk kabel).

## 2. Pindah ke Direktori yang Akan Dijadikan Server

Arahkan terminal ke folder yang ingin kamu bagikan.

```bash
cd /home/user/
```
Ganti `/home/user/` dengan path folder yang kamu inginkan.

## 3. Jalankan HTTP Server

### Python 2

```bash
python -m SimpleHTTPServer 8000
```

### Python 3

```bash
python3 -m http.server 8000
```

Server akan berjalan di port 8000 dan membagikan isi folder tersebut.

## 4. Akses dari Perangkat Lain

Buka browser di perangkat lain (misal: Android) dan masukkan alamat berikut:

```
http://[IP_SERVER]:8000
```

**Contoh:**

```
http://192.168.100.1:8000
```

Kamu bisa mengunduh atau mengunggah file (jika server mendukung upload) melalui tampilan web yang muncul.

## 5. Menghentikan Server

Tekan `Ctrl + C` di terminal untuk menghentikan server.

## Catatan

- Pastikan perangkat lain terhubung ke jaringan yang sama (WiFi/LAN).
- Port 8000 bisa diganti sesuai kebutuhan, misal `python3 -m http.server 8080`.

## Referensi

- [Python 2 SimpleHTTPServer](https://docs.python.org/2/library/simplehttpserver.html)
-

