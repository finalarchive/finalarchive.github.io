
# Python


## Install Python
### Untuk Penguna GNU/Linux

Cek Python Sudah Terinstall atau Belum, Buka terminal, lalu jalankan:

```bash
python3 --version
```

Kalau muncul seperti `Python 3.x.x`, artinya Python sudah terpasang.

Kalau tidak, ikuti langkah berikut untuk Distro Ubuntu.

```bash
sudo apt update
sudo apt install python3 python3-pip -y
```

Cek versi:

```bash
python3 --version
pip3 --version
```
> Agar bisa cukup ketik python bukan python3, buat alias:
Tambahkan ke file `.bashrc` atau `.zshrc`:
```bash
alias python=python3
alias pip=pip3
```
Lalu aktifkan:

```bash
source ~/.bashrc
```

### Untuk Pengguna Windows

1. Unduh dari situs resmi:  
   👉 [https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)

2. Jalankan file `.exe` hasil unduhan.

3. **Centang** `Add Python to PATH` saat instalasi dimulai.

4. Klik **Install Now**.

5. Setelah selesai, buka Command Prompt dan jalankan:
   ```bash
   python --version
   ```
   Outputnya harus seperti:
   ```
   Python 3.x.x
   ```

---

## Manajement Paket Pythone
**1. Install**

```bash
pip install nama_paket
```
Contoh:
```bash
pip install requests
pip install numpy
pip install pandas
```

Kamu juga bisa menentukan versi paket:

```bash
pip install requests==2.31.0
```

**2. Untuk mengecek paket terinstal**

```bash
pip list
```

**3. Simpan Daftar Paket ke requirements.txt**
Simpan daftar paket
```bash
pip freeze > requirements.txt
```

Restore dari daftar
```bash
pip install -r requirements.txt
```

**4. Uninstall paket**
```bash
pip uninstall nama_paket
```
---

## Virtual Environment

> Virtual Environment (Lingkungan Virtual) adalah cara untuk mengisolasi proyek Python agar tidak bercampur antar paket.

**1. Buat virtual environment**
   ```bash
   python -m venv env
   ```
| Bagian              | Arti                                                                                                                      |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `python`            | Memanggil interpreter Python yang sudah terinstal di sistem.                                                              |
| `-m`                | Menyuruh Python untuk **menjalankan sebuah modul bawaan** (bukan file).                                                   |
| `venv`              | Nama modul yang dijalankan. Modul `venv` digunakan untuk **membuat virtual environment**.                                 |
| `env` | Nama folder/direktori virtual environment yang akan dibuat. Bisa kamu ganti jadi nama lain, misalnya `env`, `myenv`, dll. |

**2. Aktifkan virtual environment**

   - **Windows (CMD):**
     ```cmd
     env\Scripts\activate
     ```
   - **Windows (PowerShell):**
     ```powershell
     .\env\Scripts\Activate.ps1
     ```
   - **Linux/macOS:**
     ```bash
     source env/bin/activate
     ```

Jika berhasil, prompt akan berubah seperti:
   ```
   (env) C:\projek-saya>
   ```

---

> Setelah virtual environment aktif, kamu bisa install paket seperti biasa

**3. Menonaktifkan Virtual Environment**

Setelah selesai, keluar dari environment dengan:
```bash
deactivate
```
---

## Ringkasan Perintah

| Langkah                 | Perintah                                      |
|------------------------|-----------------------------------------------|
| Cek versi Python       | `python --version`                            |
| Buat virtual env       | `python -m venv env`                         |
| Aktifkan venv (Windows)| `env\Scripts\activate`                       |
| Aktifkan venv (Linux)  | `source env/bin/activate`                    |
| Install paket          | `pip install nama-paket`                      |
| Simpan daftar paket    | `pip freeze > requirements.txt`              |
| Restore dari daftar    | `pip install -r requirements.txt`            |
| Nonaktifkan venv       | `deactivate`                                  |

---

## Tautan Menarik
