
# Cara Membuat Shortcut di Desktop Ubuntu (.desktop)

## 📁 Lokasi File Shortcut

Shortcut dapat diletakkan di:
- `~/Desktop` → hanya muncul di desktop user saat ini.
- `~/.local/share/applications` → agar muncul di menu aplikasi (khusus user ini).
- `/usr/share/applications` → tersedia untuk semua user di sistem.

Untuk shortcut di desktop, klik kanan pada file `.desktop` lalu pilih **"Allow Launching"** agar bisa dijalankan.

---

## 🧩 Struktur Dasar File `.desktop`

```ini
[Desktop Entry]
Version=1.0
Type=Application
Name=Nama Aplikasi
Comment=Deskripsi Singkat
Exec=/path/to/aplikasi [opsi]
Icon=/path/to/icon.png
Terminal=false
Categories=Utility;
StartupNotify=true
```

---

## 🔍 Penjelasan Variabel `.desktop`

| Variabel        | Wajib | Fungsi                                                | Contoh                                 |
|-----------------|--------|--------------------------------------------------------|-----------------------------------------|
| `Type`          | ✅     | Jenis entri: `Application`, `Link`, atau `Directory`  | `Application`                           |
| `Name`          | ✅     | Nama aplikasi di menu atau desktop                    | `Winbox`                                |
| `Comment`       | ❌     | Deskripsi singkat                                     | `Aplikasi untuk konfigurasi MikroTik`   |
| `Exec`          | ✅     | Perintah saat shortcut dijalankan                    | `/home/user/winbox/winbox64`            |
| `Icon`          | ✅     | Path ke icon `.png` atau `.svg`                      | `/home/user/winbox/winbox.png`          |
| `Terminal`      | ✅     | `true` jika butuh terminal, `false` jika tidak       | `false`                                 |
| `Categories`    | ❌     | Untuk kategori menu aplikasi (jika ingin muncul di menu) | `Network;Utility;`                    |
| `StartupNotify` | ❌     | Tampilkan notifikasi saat aplikasi dimulai           | `true`                                  |

---

## ✅ Contoh: Shortcut Aplikasi Winbox

Misalnya kamu memiliki Winbox di:

- Path aplikasi: `/home/final/winbox/winbox64`
- Path icon: `/home/final/winbox/winbox.png`

### Langkah-langkah

1. Buka terminal dan ketik:
    ```bash
    nano ~/Desktop/winbox.desktop
    ```

2. Isi file dengan:
    ```ini
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Winbox
    Comment=Aplikasi untuk mengakses MikroTik
    Exec=/home/final/winbox/winbox64
    Icon=/home/final/winbox/winbox.png
    Terminal=false
    Categories=Network;Utility;
    StartupNotify=true
    ```

3. Simpan dan beri permission:
    ```bash
    chmod +x ~/Desktop/winbox.desktop
    ```

4. Klik kanan > **Allow Launching**

---

## 💡 Contoh Lain

### Shortcut ke Folder:
```ini
[Desktop Entry]
Version=1.0
Type=Application
Name=Folder Proyek
Exec=xdg-open /home/final/Documents/Proyek
Icon=folder
Terminal=false
```

### Shortcut ke Website:
```ini
[Desktop Entry]
Version=1.0
Type=Link
Name=OpenAI
URL=https://chat.openai.com
Icon=web-browser
```

---

## 🧾 Kesimpulan

File `.desktop` di Ubuntu adalah cara membuat shortcut aplikasi, folder, atau website. Pastikan `Exec` dan `Icon` valid, beri hak akses `chmod +x`, dan aktifkan dengan klik kanan > **Allow Launching**.

