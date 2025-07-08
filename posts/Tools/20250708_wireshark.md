# Wireshark

## Install Wireshark di Ubuntu 24.04

Wireshark adalah aplikasi open source untuk menganalisis lalu lintas jaringan (network packet analyzer) yang sangat populer.

### Update Sistem

```bash
sudo apt update && sudo apt upgrade -y
```

### Install Wireshark

```bash
sudo apt install wireshark -y
```

### Konfigurasi Hak Akses (Opsional)
Agar bisa capture paket tanpa sudo:

```bash
sudo dpkg-reconfigure wireshark-common
sudo usermod -aG wireshark $USER
```
- Pilih "Yes" saat diminta mengizinkan non-superuser capture paket.
- Logout dan login kembali agar grup wireshark aktif.

### Jalankan Wireshark

- Dari menu aplikasi, cari dan buka **Wireshark**
- Atau lewat terminal:

```bash
wireshark
```

### Tips Penggunaan
- Pilih interface jaringan yang ingin di-capture.
- Gunakan filter (misal: `ip.addr == 192.168.1.1` atau `tcp.port == 80`) untuk memudahkan analisis.
- Simpan hasil capture untuk analisa lebih lanjut.

### Uninstall / Menghapus Wireshark

Jika ingin menghapus Wireshark dari Ubuntu, gunakan perintah berikut:

```bash
sudo apt remove --purge wireshark -y
sudo apt autoremove -y
```

- `remove --purge` akan menghapus paket beserta konfigurasi.
- `autoremove` membersihkan dependensi yang tidak diperlukan lagi.

Jika Anda juga menginstall tshark dan ingin menghapusnya:

```bash
sudo apt remove --purge tshark -y
sudo apt autoremove -y
```

---

**Catatan:**
- Untuk penggunaan di server/headless, bisa gunakan `tshark` (Wireshark versi CLI):
  ```bash
  sudo apt install tshark
  ``` 
- Dokumentasi resmi: https://www.wireshark.org/docs/


