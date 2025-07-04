# GITHUB

## REMOTE VIA SSH

### Generate SSH Key
```bash
ssh-keygen
```

### Tambahkan SSH Key ke GitHub
+ Salin key:

```bash
cat ~/.ssh/id_rsa.pub
```
+ Buka GitHub → Profile → **Settings** → **SSH and GPG keys** → **New SSH Key**

+ Paste dan beri nama sesuai perangkat (misal: Laptop Final)

### Ganti Remote Git dari HTTPS ke SSH (Optional tapi Wajib)
Mengganti URL remote repository GitHub dari protokol HTTPS ke SSH untuk memudahkan proses push/pull tanpa harus memasukkan username atau token setiap kali.

+ **Cek Remote Saat Ini**
```bash
git remote -v
```
Jika hasilnya seperti ini, berarti masih menggunakan HTTPS:

```bash
origin  https://github.com/USERNAME/REPO.git (fetch)
origin  https://github.com/USERNAME/REPO.git (push)
```

+ **Ubah Remote ke SSH**

Gunakan perintah berikut:

```bash
git remote set-url origin git@github.com:USERNAME/REPO.git
```
Contoh:

```bash
git remote set-url origin git@github.com:finalarchive/finalarchive.github.io.git
```

+ **Verifikasi Perubahan**
```bash
git remote -v
```
Hasil yang benar akan tampak seperti ini:

```bash
origin  git@github.com:finalarchive/finalarchive.github.io.git (fetch)
origin  git@github.com:finalarchive/finalarchive.github.io.git (push)
```

+ **Uji Koneksi SSH ke GitHub (Opsional)**
```bash
ssh -T git@github.com
```
Jika berhasil, akan muncul:

```vbnet
Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.
```

## Push Otomatis dengan Timestamp (Script Bash)
```bash
nano commit.sh
```
```bash
#!/bin/bash

commit_message=$(date +"%Y%m%d %H:%M")

git add .
git commit -m "$commit_message"
git push origin main
```
Cara pakai:
```bash
chmod +x commit.sh
./commit.sh
```
