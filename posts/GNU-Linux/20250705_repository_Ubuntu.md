# REPOSITORY UBUNTU

Repository Ubuntu adalah **kumpulan server** (lokal atau internet) yang menyimpan berbagai paket perangkat lunak (software) yang dapat diinstal di sistem operasi Ubuntu. Saat kamu menginstal aplikasi atau melakukan update di Ubuntu (misalnya dengan `apt install` atau `apt update`), sistem akan mengambil data dari repository ini.


## 🔧 Struktur dan Jenis Repository Ubuntu

Secara umum, Ubuntu memiliki empat komponen utama repository berdasarkan **lisensi** dan **dukungan teknis**:

### Main
- **Isi:** Software **bebas dan open-source** yang **resmi didukung oleh Ubuntu** (Canonical).
- **Contoh:** `bash`, `coreutils`, `gnome`, dll.
- **Dukungan:** Jangka panjang, termasuk pembaruan keamanan.

### Universe
- **Isi:** Software open-source dari komunitas.
- **Contoh:** `vlc`, `gimp`, dll.
- **Dukungan:** **Tidak dijamin** oleh Canonical (bisa tidak ada update keamanan).

### Restricted
- **Isi:** Driver atau software **proprietary** yang tetap diperlukan untuk fungsionalitas sistem (misalnya driver WiFi).
- **Dukungan:** Dibatasi, hanya perangkat tertentu.

### Multiverse
- **Isi:** Software dengan lisensi **terbatas** atau **tidak bebas**, seperti codec MP3 atau aplikasi tertentu.
- **Dukungan:** Tidak didukung Canonical.


## 📁 Contoh Baris Repository di `/etc/apt/sources.list`

```bash
deb http://archive.ubuntu.com/ubuntu focal main restricted universe multiverse
```

**Penjelasan:**
- `deb`: Format paket Debian (bukan `deb-src` untuk source code)
- `http://archive.ubuntu.com/ubuntu`: Alamat server repository
- `focal`: Codename untuk Ubuntu 20.04
- `main restricted universe multiverse`: Komponen yang diaktifkan

> `lsb_release -c` cek codemane ubuntu


## 🌐 Jenis Repository Berdasarkan Tujuan

| Jenis Repository | Fungsi |
|------------------|--------|
| **Release**      | Versi stabil dari Ubuntu |
| **Updates**      | Perbaikan bug dan pembaruan |
| **Security**     | Patch keamanan penting |
| **Backports**    | Software baru untuk rilis lama |
| **Proposed**     | Pengujian sebelum masuk ke stable (tidak disarankan untuk pemula) |

> Penggunaan <br>`deb http://archive.ubuntu.com/ubuntu focal-`**Jenis Repository** `main restricted universe multiverse`


## 📥 Proses Umum Akses Repository

1. **`apt update`** – Mengambil info terbaru dari daftar paket di repository.
2. **`apt install nama_paket`** – Mengunduh dan memasang paket dari repository.
3. **`apt upgrade`** – Memperbarui semua paket yang sudah diinstal.

## 🔒 Mirror Lokal & Kustom

Kamu juga bisa:
- Mengganti repository default ke mirror lokal (lebih cepat).
- Menambahkan PPA (Personal Package Archive) untuk software yang tidak tersedia secara default.

**Contoh mengganti ke mirror lokal Indonesia:**
```bash
deb http://kambing.ui.ac.id/ubuntu focal main restricted universe multiverse
```
