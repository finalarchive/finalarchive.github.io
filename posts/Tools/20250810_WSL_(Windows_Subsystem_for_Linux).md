# WSL (Windows Subsystem for Linux) di Windows 10/11

## Langkah Cepat (Command Satu Baris) – Untuk Windows 10/11 (versi 2004 ke atas)

Berikut langkah-langkah mudah dan detail untuk menginstall WSL:

### Buka PowerShell sebagai Administrator
- Klik kanan pada tombol **Start** (logo Windows di pojok kiri bawah).
- Pilih **Windows PowerShell (Admin)** atau **Terminal (Admin)**.

### Aktifkan Fitur WSL
Ketik perintah berikut di PowerShell, lalu tekan **Enter**:
```powershell
wsl --install
```
Perintah ini akan otomatis mengaktifkan semua fitur yang dibutuhkan dan menginstall Ubuntu sebagai default.

### Restart Komputer
Setelah proses selesai, **restart** komputer Anda agar perubahan diterapkan.

### Jalankan Linux
- Setelah restart, buka menu **Start** dan cari **Ubuntu** (atau distro lain yang Anda pilih).
- Klik untuk menjalankan.

### Buat Username dan Password Linux
- Saat pertama kali dijalankan, Anda akan diminta membuat username dan password untuk Linux.

### Selesai!
- Sekarang Anda sudah bisa menggunakan Linux di Windows melalui WSL.

---

### Catatan:
- Jika perintah `wsl --install` tidak dikenali, pastikan Windows Anda sudah update ke versi terbaru.
- Untuk memilih distro lain, buka **Microsoft Store** dan cari "Linux", lalu pilih dan install distro

## 🔧 Cara Manual (Optional)
### Aktifkan fitur WSL dan Virtual Machine Platform
```powershell```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
### Komputer
### Set default versi ke WSL2
```powershell
wsl --set-default-version 2
```
### Install distro (misal: Ubuntu)
```powershell
wsl --install -d 
```
Atau pilih distro lain dengan:

```powershell
wsl --list --online
wsl --install -d <NamaDistro>
```
Contoh:

```powershell
Salin
Edit
wsl --install -d Debian
```

## Perintah WSL Lain yang Berguna

- **Melihat daftar distro yang terinstall:**
  ```powershell
  wsl --list --verbose
  ```
- **Mengatur distro default:**
  ```powershell
  wsl --set-default <NamaDistro>
  ```
- **Menjalankan shell Linux langsung dari PowerShell/CMD:**
  ```powershell
  wsl
  ```
- **Menjalankan perintah Linux langsung dari Windows:**
  ```powershell
  wsl ls ~
  ```
- **Menghapus/uninstall distro tertentu:**
  ```powershell
  wsl --unregister <NamaDistro>
  ```
- **Update kernel WSL:**
  ```powershell
  wsl --update
  ```
- **Restart WSL:**
  ```powershell
  wsl --shutdown
  ```

