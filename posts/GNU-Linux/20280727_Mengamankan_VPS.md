# Mengamankan VPS

## Update Sistem
Perintah:

```bash
sudo apt update && sudo apt upgrade -y
```
>Tujuan:
>Memastikan semua software dan sistem di VPS kamu pakai versi terbaru — ini penting karena versi lama bisa punya celah keamanan (vulnerability).

## Buat User Baru (Jangan pakai root terus)
Perintah:

```bash
adduser finalarchive
usermod -aG sudo finalarchive
```
untuk pindah user ke finalarchive `su - finalarchive`

>Tujuan:
>Kamu pakai user biasa untuk kerja, dan hanya pakai sudo kalau butuh akses root. Ini lebih aman daripada kerja langsung pakai root.

## Login Hanya Pakai SSH Key (Nonaktifkan Password Login)
### Buat SSH key di laptop kamu (kalau belum punya):
```bash
ssh-keygen -t ed25519
```
### Upload public key ke VPS:
```bash
ssh-copy-id finalarchive@IP-VPS
```
### Nonaktifkan login pakai password:
Edit file ini:

```bash
sudo nano /etc/ssh/sshd_config
```
Cari dan ubah:
```bash
PasswordAuthentication no
PermitRootLogin no
```
Restart SSH:

```bash
sudo systemctl restart ssh
```
>Tujuan:
>SSH pakai key lebih aman daripada password biasa, dan root login dimatikan agar tidak bisa di-hack langsung.


## Ubah Port Default SSH
Port default SSH itu 22, dan sering jadi sasaran brute-force.

Ubah ke port lain, misal 2222:
Edit sshd_config:

```bash
sudo nano /etc/ssh/sshd_config
```
Ubah:

```yaml
Port 2222
```

Restart SSH:
```bash
sudo systemctl restart ssh
```
>Tujuan:
>Menghindari bot otomatis yang menyerang port default 22.


## Install & Aktifkan Firewall (UFW)
Perintah:

```bash
sudo ufw allow 2222/tcp     # ganti 2222 dengan port SSH kamu
sudo ufw allow 80,443/tcp   # web port kalau pakai web server
sudo ufw enable             # mengaktifkan ufw
sudo ufw status             # cek status
```
>Tujuan:
>Menutup semua akses yang tidak perlu. Hanya port yang kamu izinkan yang bisa diakses.

## Cek Port yang Terbuka
Perintah:

```bash
sudo ss -tuln
```
Atau:

```bash
sudo netstat -tuln
```
>Tujuan:
>Mengetahui service apa saja yang berjalan dan mendengarkan port — tutup yang tidak perlu.

### Install Fail2Ban (Proteksi Brute Force)
Perintah:

```bash
sudo apt install fail2ban -y
```
>Tujuan:
>Kalau ada orang gagal login berkali-kali, IP-nya akan diblok otomatis.



