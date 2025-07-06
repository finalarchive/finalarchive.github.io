
# Python

Panduan ini menjelaskan cara:
- Menginstal Python
- Membuat virtual environment (lingkungan terisolasi)
- Menginstal paket hanya dalam lingkungan tersebut

---

## 🐍 Install Python

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

## 🌱 Membuat Virtual Environment

> Virtual environment menjaga agar dependensi antar proyek tidak saling bertabrakan.

### Contoh:
Misal nama proyek kamu adalah `projek-saya`.

1. Buka terminal / CMD, masuk ke folder proyek:
   ```bash
   cd path\ke\projek-saya
   ```

2. Buat virtual environment:
   ```bash
   python -m venv evenv
   ```
| Bagian              | Arti                                                                                                                      |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `python`            | Memanggil interpreter Python yang sudah terinstal di sistem.                                                              |
| `-m`                | Menyuruh Python untuk **menjalankan sebuah modul bawaan** (bukan file).                                                   |
| `venv`              | Nama modul yang dijalankan. Modul `venv` digunakan untuk **membuat virtual environment**.                                 |
| `evenv` () | Nama folder/direktori virtual environment yang akan dibuat. Bisa kamu ganti jadi nama lain, misalnya `env`, `myenv`, dll. |



3. Aktifkan virtual environment:

   - **Windows (CMD):**
     ```cmd
     evenv\Scripts\activate
     ```
   - **Windows (PowerShell):**
     ```powershell
     .\evenv\Scripts\Activate.ps1
     ```
   - **Linux/macOS:**
     ```bash
     source evenv/bin/activate
     ```

4. Jika berhasil, prompt akan berubah seperti:
   ```
   (evenv) C:\projek-saya>
   ```

---

## 📦 Instalasi Paket di Virtual Environment

Setelah virtual environment aktif, kamu bisa install paket seperti biasa:

```bash
pip install requests
```

Untuk mengecek paket terinstal:

```bash
pip list
```

---

## 📁 Menyimpan & Memuat Daftar Paket

### Menyimpan daftar paket ke file:
```bash
pip freeze > requirements.txt
```

### Menginstal ulang dari file:
```bash
pip install -r requirements.txt
```

---

## 🧼 Menonaktifkan Virtual Environment

Setelah selesai, keluar dari environment dengan:
```bash
deactivate
```

---

## 📝 Ringkasan Perintah

| Langkah                 | Perintah                                      |
|------------------------|-----------------------------------------------|
| Cek versi Python       | `python --version`                            |
| Buat virtual env       | `python -m venv venv`                         |
| Aktifkan venv (Windows)| `venv\Scripts\activate`                       |
| Aktifkan venv (Linux)  | `source venv/bin/activate`                    |
| Install paket          | `pip install nama-paket`                      |
| Simpan daftar paket    | `pip freeze > requirements.txt`              |
| Restore dari daftar    | `pip install -r requirements.txt`            |
| Nonaktifkan venv       | `deactivate`                                  |

---
