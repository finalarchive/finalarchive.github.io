# Install Mikrotik CHR di VPS

## Install
```
wget https://download.mikrotik.com/routeros/6.49.15/chr-6.49.15.img.zip
gunzip -c chr-6.49.15.img.zip > chr.img
mount -o loop,offset=512 chr.img /mnt
ls /mnt
ls /mnt/rw/
IP=<address>
GW=<gateway>
echo "/ip address add address=$IP interface=[/interface ethernet find where name=eth0]
> /ip route add gateway=$GW" > /mnt/rw/autorun.scr
cat /mnt/rw/autorun.scr
umount /mnt
echo u > /proc/sysrq-trigger
cek disk 
	
fdisk -l

dd if=chr.img of=/dev/sda bs=1024

Reboot : echo b > /proc/sysrq-trigger
```

### Penjelasan
**Mengunduh File Image MikroTik**
```wget https://download.mikrotik.com/routeros/6.49.15/chr-6.49.15.img.zip```
wget: Perintah untuk mengunduh file dari internet.
URL: Alamat tempat file chr-6.49.15.img.zip diunduh.

**Mengekstrak File Zip**
```gunzip -c chr-6.49.15.img.zip > chr.img```
gunzip -c: Mengekstrak file zip tanpa menghapus file zip asli.
> chr.img: Menyimpan hasil ekstraksi sebagai chr.img.

**Memasang File Image**
```mount -o loop,offset=512 chr.img /mnt```
mount -o loop,offset=512: Memasang file image chr.img ke direktori /mnt menggunakan loopback dengan offset 512 byte.
/mnt: Direktori tempat file image dipasang.

**Menampilkan Isi Direktori Mount**
```
ls /mnt
ls /mnt/rw/
```
ls /mnt: Menampilkan isi direktori /mnt.
ls /mnt/rw/: Menampilkan isi sub-direktori /mnt/rw/.

**Mendefinisikan Alamat IP dan Gateway**
```
IP=<alamat IP/subnet mask>
GW=<gateway>
```
IP: Variabel yang berisi alamat IP dan subnet mask.
GW: Variabel yang berisi alamat IP gateway.

**Menulis Konfigurasi Jaringan ke File autorun.scr**
```
echo "/ip address add address=$IP interface=[/interface ethernet find where name=eth0]
/ip route add gateway=$GW" > /mnt/rw/autorun.scr
```
echo: Menulis teks ke dalam file.
> /mnt/rw/autorun.scr: Menyimpan teks konfigurasi ke file autorun.scr di direktori /mnt/rw/.

**Memeriksa Isi File autorun.scr**
```cat /mnt/rw/autorun.scr```
cat: Menampilkan isi file.
/mnt/rw/autorun.scr: File yang berisi konfigurasi jaringan.

**Melepas Mounting**
```umount /mnt```
umount /mnt: Melepas mounting dari direktori /mnt.

**Sinkronisasi Buffer File Sistem**
```echo u > /proc/sysrq-trigger```
echo u > /proc/sysrq-trigger: Memicu sinkronisasi semua buffer file sistem.

**Memeriksa Disk yang Tersedia**
```fdisk -l```
fdisk -l: Menampilkan daftar partisi disk yang tersedia.

**Menulis Image ke Disk**
```dd if=chr.img of=/dev/sda bs=1024```
dd if=chr.img: Membaca dari file image chr.img.
of=/dev/sda: Menulis image ke disk sda.
bs=1024: Mengatur ukuran blok menjadi 1024 byte.

**Merestart Sistem**
```echo b > /proc/sysrq-trigger```
echo b > /proc/sysrq-trigger: Memicu restart sistem.