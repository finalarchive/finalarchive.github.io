---
layout: post
title:  "Install Arch Linux"
date:   2020-10-08 11:45
categories: [linux, archlinux]
permalink: /:year/:month/:title
---
***Daftar Isi***
{: .no_toc .text-delta }

- TOC
{:toc}

# Arch Linux
{: .no_toc }

---
Arch Linux (dikenal juga dengan ArchLinux atau Arch) adalah sebuah distribusi Linux untuk komputer x86_64 (64 bit) yang didesain untuk menjadi ringan dan sederhana.Cara pengucapan Arch Linux adalah `[ɑːrtʃ]` atau `[aːtʃ]` (seperti pada kata archer atau parchment).

<!--more-->

Pendekatan desain pengembang distro ini berfokus pada kesederhanaan, kebenaran program dan minimalisme. "Kesederhanaan" didefinisikan sebagai "tak perlu tambahan, modifikasi, atau komplikasi" sesuai sudut pandang pengembangnya, bukan sudut pandang pengguna.

Archlinux adalah sebuah Distribusi Linux berbasis binary, yang artinya, paket-paket aplikasi didistribusikan dalam bentuk telah terkompilasi. Berbeda dengan Gentoo yang mendistribusikan paket-paketnya dalam bentuk kode sumber. 

## Step 0: Introduction

Hello mas Bro, nama saya **Rizqi Nur Assyaufi**. Beberapa dari teman-teman mungkin sudah mengetahui bahwa saya adalah seorang Archer \(mungkin sebutan keren untuk pengguna Arch Linux\).

Sedikit cerita, saya sudah menggunakan sistem operasi GNU/Linux secara aktif baru dimulai sejak tahun 2014. Sebelumnya, sejak tahun 2009 saya menggunakan sistem operasi besutan Apple, yang dikenal dengan nama OS X, namun kini disebut dengan nama macOS \(denger-denger supaya lebih konvergen dengan iOS\).

Pertama kali mengenal sistem operasi GNU/Linux sejak tahun 2004 melalui sahabat saya yang juga teman berdiskusi soal teknologi \(**Yudo D. Baskoro**\). Beliaulah yang memperkenalkan saya mengenai distribusi sistem operasi GNU/Linux yang bernama Ubuntu dari Canonical. Dari situlah awal mula tanpa saya sadari sedikit demi sedikit saya mulai belajar bermigrasi dari satu sistem operasi ke sistem operasi yang lain.

Tujuan awal saya menulis petunjuk manual instalasi Arch Linux ini adalah untuk mempermudah saya dalam melakukan _reinstall_ \(instalasi kembali\) apabila sewaktu-waktu saya mengalami kendala atau kegagalan pada sistem yang saya pergunakan saat ini.

Belajar dari pengalaman menggunakan distribusi sistem operasi yang saya gunakan sebelumnya, yaitu Fedora Linux. Proses _reinstall_ menjadi lebih cepat dan lebih terarah apabila saya mengikuti dokumentasi yang telah saya buat sebelumnya. Karena proses _research_ \(mencari informasi\) yang valid sudah dipangkas. Bayangkan untuk memasang sebuah sistem operasi, kita harus mencari informasi mengenai apa saja paket-paket yang kita perlukan dan yang sistem operasi perlukan. Mulai dari sumber-sumber _official_, sampai tulisan-tulisan dokumentasi pribadi Arch *user* yang lain. Benar0benar menyita waktu.

Berdasarkan latar belakang kasus saya di atas, saya kembali mengumpulkan niat, tenaga, dan menyisihkan waktu luang untuk kembali menulis dokumentasi proses instalasi ini.

Dokumentasi ini saya tulis berdasarkan Arch Wiki dan catatan kaki hasil proses instalasi berulang-ulang yang saya lakukan sebelumnya. Saya menambahkan langkah-langkah untuk melindungi data-data yang ada di dalam partisi `root` dan direktori `home` user dengan proses enkripsi agar tidak sembarangan orang dapat mengaksesnya.

Keterbatasan dari dokumentasi ini dapat dilihat pada tabel di bawah.

Spesifikasi mesin yang saya gunakan :

| <center>No.</center> | <center>Hardware</center> | <center>Details</center> |
| :--- | :--- | :--- |
| 1 | CPU | Intel\(R\) Core\(TM\) i5-6300U CPU @ 2.40GHz |
| 2 | GPU | Intel HD Graphics 520 |
| 3 | Wireless Interface | Intel Corporation Wireless 8260 |
| ... | dst... | dst... |

Yang ingin saya informasikan dari tabel spesifikasi di atas adalah, saya tidak menggunakan GPU Nvidia maupun Radeon. Bahkan belum pernah sama sekali melakukan _setup_ pada mesin dengan GPU Nvidia maupun Radeon. Dan inilah keterbatasan dari dokumentasi yang saya tulis. Saya tidak dapat menyertakan proses instalasi _driver_ untuk kedua GPU tersebut. Dan juga untuk _processor_ dengan _brand_ AMD.

Selain itu, saya juga tidak menggunakan Arch Linux berdampingan dengan Microsoft Windows (*dual boot*). Sehingga proses manajemen partisi untuk *dual boot* tidak terdapat pada dokumentasi ini.

Hal lain yang sering dihadapi oleh GNU/Linux _user_ adalah kompatibilitas _wifi adapter_. Permasalahan ini paling sering saya temukan baik di forum maupun di chat group, karena beberapa _brand_ membutuhkan konfigurasi _driver_ yang belum terkonfigurasi atau bahkan belum tersedia pada _base_ sistem. Beberapa distribusi sistem operasi GNU/Linux mungkin sudah ada yang menyertakan pada _base_ sistem mereka, namun lain halnya dengan Arch Linux, dimana user yang harus mencari sendiri bagaimana mengkonfigurasi _network adapter_ yang tidak tersedia pada _base_ sistem Arch. Ini salah satu alasan kenapa Arch Linux tidak ditujukan untuk _user_ yang baru mengenal GNU/Linux.

**Gimana, Bro ? Masih berani untuk lanjut ?**

~~Mungkin~~ di sinilah yang menjadi _level_ awal dimana calon Archer diseleksi. Yaitu pada proses instalasi yang tidak semudah distribusi sistem operasi GNU/Linux yang lain.

Bagi teman-teman yang sudah menggunakan distribusi sistem operasi GNU/Linux selain Arch Linux, saya rasa tidak akan begitu kesulitan. Namun, bagi teman-teman yang baru bermigrasi dari sistem operasi Microsoft Windows, saya lebih merekomendasikan untuk menggunakan distribusi turunan dari Arch Linux dan memang lebih mudah proses instalasinya karena menggunakan GUI \(_Graphical User Interface_\) yaitu **Manjaro Linux**.

Kalo boleh saya gambarkan, proses instalasi distribusi sistem operasi Arch Linux ini seperti merakit kapal. Kita bebas menentukan apa saja yang kita perlukan, bagaimana proses pembuatan dan seperti apa bentuk kapal yang kita inginkan, agar kapal yang kita rakit, dapat berlayar. Ya, meskipun saya juga belum pernah merakit kapal sebelumnya, biar terlihat keren saja pakai kata “kapal”. Hehehe

Target yang akan kita capai dari dokumentasi ini adalah :

| <center>Items</center> | <center>Details</center> |
| :--- | :--- |
| **Sistem Operasi** | Arch Linux |
| **Dual Boot** | No \(Single Boot\) |
| **Desktop Environment** | GNOME |
| **Partition Table** | /dev/sda1 → ESP \(EFI System Partition\) |
|  | /dev/sda2 → Linux LVM with LUKS encryption |
| **Bootloader** | systemd-boot |
| **Encryption** | /dev/sda =&gt; root & /home |


## Step 1 : Connecting to the Internet

### 1.1 Pilih Network Adapter

Meskipun instalasi Arch Linux ini berupa _command line_, namun kita tetap dapat menggunakan _wifi adapter_ untuk terhubung dengan jaringan. \(apabila _wifi adapter_ kalian terdeteksi\). Lakukan pengecekan dengan perintah di bawah.

```
# wifi-menu
```

Apabila keluar menu interaktif berupa daftar SSID yang tersedia, maka pilih SSID milik kalian dan masukkan _password_ dari SSID. Apabila hanya keluar pesan berupa `--help`, menandakan _wifi adapter_ kalian belum terdeteksi oleh _kernel driver_ Arch _Installer_. Pada kasus ini kita masih dapat menggunakan koneksi dari kabel LAN ataupun dengan menggunakan _USB tethering smarpthone_.

Untuk penggunaan _USB tethering smartphone_, hubungkan _smartphone_ dengan laptop menggunakan kabel _USB_, lakukan pengecekan apakah sudah terhubung atau belum.

```
# lsusb
```

Apabila sudah terlihat nama dari *device smartphone* kita, lakukan perintah di bawah untuk mengaktifkan DHCP *daemon service*.

```
# dhcpcd
```

Setelah itu akan muncul pemberitahuan seperti di bawah.

```
dev: loaded udev
no interfaces have a carrier
forked to background, child pid 342
```

Lakukan pengetesan apakah kita telah terhubung ke Internet,

```
# ping google.com
```

Dalam langkah ini, kalian mungkin perlu menunggu beberapa saat hingga `ping` dapat berhasil, mungkin sekitar 1 - 2 menit.
Apabila telah berhasil, kalian dapat bergerak ke _step_ selanjutnya.

Apabila masih belum dapat terhubung dengan Internet, maka proses instalasi akan terkendala pada saat akan men-*download* paket-paket dari _mirror server_.

### 1.2 Memilih Mirrorlist

Karena _base package_ yang diperlukan untuk menjadikan sistem operasi seutuhnya harus kita unduh dari _server_ repositori, maka kita perlu memilih daftar _mirror server_. Tujuannya untuk mempercepat proses pengunduhan paket-paket aplikasi dari _server_ repositori.

<!-- PERTANYAAN -->
<div class="blockquote-yellow">
<div class="blockquote-yellow-title">Mengapa tidak menggunakan <i>mirror-mirror</i> lokal Indonesia ?</div>
<p>Karena belum tentu apabila kita memilih server repositori di Indonesia sudah pasti akan mendapatkan kecepatan yang maksimal. Maka biarkan program yang memilihkan untuk kita.</p>
</div>

Buat _backup_ `mirrorlist` terlebih dahulu.

<pre>
# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
</pre>

~~Kemudian kita akan menggunakan `rankmirrors` untuk memilih alamat _mirror_ mana yang paling cepat.~~

<pre>
<s># rankmirrors -n 5 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist</s>
</pre>

~~Proses ini akan memakan waktu sebentar. Karena `rankmirrors` akan melakukan filter pada ratusan alamat _mirror server_ yang ada pada daftar _file_ `mirrorlist`.~~

>**Penting** <br> 
>Penggunaan <code>rankmirrors</code> sudah <b>tidak direkomendasikan</b> lagi oleh Arch Wiki.
>.<br>
> Saat ini, sudah menggunakan <code>reflector</code>.
><br>
><pre>
>># pacman -Syy
>># pacman -S reflector
>># reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist</pre>

Setelah selesai, maka daftar _server_ repositori yang tadinya ada banyak sekali, hanya akan terseleksi dan tersisa menjadi 5 _server_ paling cepat saja. Kalian dapat melihatnya dengan mengetikkan `$ cat /etc/pacman.d/mirrorlist`.

Setelah itu, kita perlu memperbaharui metadata repository kita untuk dapat sinkron dengan repositori yang baru saja kita rubah.
```
$ pacman -Syy
```
Tunggu proses sinkorinasi metadata hingga selesai. Setelah itu kita bisa bergerak ke-*step* selanjutnya.

# STEP 2 : Disk Partitioning

## 2.1 Mengecek UEFI Mode

Saya lebih _prefer_ untuk menggunakan mode bios UEFI ketimbang mode bios Legacy. Untuk itu kita akan mengecek apakah kita sudah berada pada mode UEFI atau belum.

```
# ls /sys/firmware/efi
```

Kemudian perhatikan apakah terdapat direktori `efivars` atau tidak. Jika ada, berarti kita sudah berada di jalan yang benar. Apabila belum, berarti kita harus mengeset ulang pengaturan pada BIOS dan merubahnya menjadi UEFI.

## 2.2 Mengatur Partisi Tabel

Kita akan membuat **dua** partisi. Yang pertama adalah partisi **ESP** \(_EFI System Partition_\) dan partisi `/` \(baca: _root_\). Saya lebih _prefer_ menggunakan **satu** partisi `/` dan tidak memisahkan partisi `/home` dari `/`.

<!-- PERTANYAAN -->
<div class="blockquote-yellow">
<div class="blockquote-yellow-title">Mengapa saya tidak memisahkan partisi /home ?</div>
<p>Karena saya tidak berniat untuk memasang distribusi sistem operasi GNU/Linux yang lain.</p>
</div>

Pertama-tama kita harus mengetahui alamat blok dari _hard drive_ yang akan kita partisi.

```
# lsblk -p
```

Pada kasus saya, _storage device_ saya memiliki nama block `sda`. Saya dapat mengetahui dari jumlah kapasitasnya.

Kemudian langkah selanjutnya adalah mempartisi _hard disk_. Terdapat banyak aplikasi yang dapat kita gunakan seperti `parted`, `fdisk`, `gdsik`, `cfdisk`, `cgdisk`, dll. Namun pada dokumentasi ini saya akan menggunakan `gdisk`.

```
# gdisk /dev/sda
```

| Steps | Details |
| :--- | :--- |
| o↲ → Y↲ | =&gt; Membuat GPT |
| n↲ → ↲ → ↲ → +512MiB↲ → EF00↲ | =&gt; Membuat ESP \(EFI System Partition\) |
| n↲ → ↲ → ↲ → ↲ → 8E00↲ | =&gt; Membuat sisa block partisi menjadi / \(LVM\) |
| w↲ → Y↲ | =&gt; Menulis table partition ke disk |

Setelah kembali ke `#`, kita dapat mengecek apakah partisi kita telah berhasil dibuat atau tidak, dengan perintah.

```
# fdisk -l
```

Akan terdapat detail keterangan bahwa kita menggunakan **gpt** dan terdapat 2 partisi `/dev/sda1` \(EFI System\) dan `/dev/sda2` \(Linux LVM\).

`sda1` akan kita gunakan sebagai partisi `/boot` dan `sda2` akan kita gunakan sebagai partisi `/`.

<!-- PERTANYAAN -->
<div class="blockquote-yellow">
<div class="blockquote-yellow-title">Mengapa saya tidak menggunakan partisi SWAP ?</div>
<p>Karena saya menggunakan SSD. Kalau ingin menggunakan SWAP, dapat kita tambahkan belakangan, setelah sistem kita jadi.</p>
<p>Saya juga lebih memilih menggunakan <b>swapfile</b> saja. Sehingga swapfile hanya akan saya buat apabila saya perlukan.</p>
</div>


## 2.3 Mengenkripsi Partisi /dev/sda2

Pada saat ini, dimana semua orang mulai ~~memperhatikan~~ keamanan data, meskipun hanya laptop pribadi namun saya berusaha untuk tetap belajar mengerti bagaimana cara mengamankan data yang ada di dalam _hard disk_ saya.

Pada dokumentasi instalasi ini saya akan menggunakan enkripsi pada partisi `/dev/sda2` dan juga akan mengenkripsi direktori `/home/username`. Mungkin bisa disebut ini keamanan kue lapis. Hehe

Aplikasi *disk encryption* yang saya pergunakan adalah [**LUKS**](https://gitlab.com/cryptsetup/cryptsetup/){:target="_blank"} \(`dm-crypt`\).

```
# cryptsetup luksFormat /dev/sda2
```

| Steps | Details |
| :--- | :--- |
| YES↲ | =&gt; Konfirmasi dengan **YES** huruf kapital |
| \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* | =&gt; Masukkan password untuk enksripsi `/sda2` |
| \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* | =&gt; Konfirmasi password `/sda2` |

Kita telah berhasil membuat `/dev/sda2` terenkripsi dengan LUKS.

Tahap selanjutnya adalah mengkonfigurasi **LVM** pada `/dev/sda2`. Untuk itu kita perlu membuka kembali `/dev/sda2` yang baru saja kita enkripsi.

```
# cryptsetup luksOpen /dev/sda2 lvm
```

Membuat **_physical volume_**.

```
# pvcreate /dev/mapper/lvm
```

Membuat **_volume group_**.

```
# vgcreate volume /dev/mapper/lvm
```

Membuat **_logical volume_** dengan nama "**root**".

```
# lvcreate -l 100%FREE volume -n root
```

Kita telah berhasil mengkonfigurasi LVM pada `/dev/sda2` yang terenkripsi.

## 2.4 Memformat Partisi

Setelah kita mengkonfigurasi partisi tabel, langkah selanjutnya adalah mem-*format* partisi sesuai tipe partisi yang telah kita buat. Terdapat dua _file_ sistem yang akan kita gunakan, yaitu `FAT32` dan `EXT4`. _File_ sistem `FAT32` akan kita gunakan untuk `/dev/sda1` yang merupakan partisi ESP \(_EFI System Partition_\). Sedangkan _file_ sistem `EXT4` akan kita gunakan untuk `/dev/sda2` yang merupakan `/` partisi.

Mem-_format_ partisi `/dev/sda1`.

```
# mkfs.fat -F32 /dev/sda1
```

Mem-_format_ partisi `/dev/sda2`.

```
# mkfs.ext4 /dev/mapper/volume-root
```

Untuk melihat apakah konfigurasi partisi kita telah sesuai atau tidak, kita dapat menggunakan perintah di bawah ini untuk melihat struktur dari tabel partisi.

```
# lsblk
```

```
NAME                MAJ:MIN  RM    SIZE  RO  TYPE  MOUNTPOINT
loop0                 7:0     0  408.5M   1  loop  /run/archiso/sfs/
sda                   8:0     0      8G   0  disk
├─sda1                8:1     0    512M   0  part
└─sda2                8:2     0    7.5G   0  part
  └─lvm             254:0     0    7.5G   0  crypt
    └─volume-root   254:1     0    7.5G   0  lvm
sr0                  11:0     1    523M   0  rom   /run/archiso/bootmnt
```

Apabila telah sesuai, akan menampilkan susunan `/dev/sda` pada kolom **NAME**, seperti yang terdapat pada tabel di atas.

# STEP 3 : Installing Arch Linux Base Packages

Arch Linux adalah salah satu distribusi sistem operasi yang proses instalasinya membutuhkan koneksi internet untuk mengunduh paket-paket yang terdapat pada _server_ repositori.

## 3.1 Mounting Partition

Sebelum memasang _base package_ terlebih dahulu kita akan memasang \(_mounting_\) dua partisi yang telah kita buat `/dev/sda1` dan `/dev/mapper/volume-root` pada partisi `/mnt` untuk proses instalasi.

_Mount_ partisi `/dev/mapper/volume-root` ke partisi `/mnt`.

```
# mount /dev/mapper/volume-root /mnt
```

<!-- PERTANYAAN -->
<div class="blockquote-yellow">
<div class="blockquote-yellow-title">Mengapa bukan partisi /dev/sda2 yang dimount ke /mnt ?</div>
<p>Karena partisi <code>/dev/sda2</code> sudah kita enkripsi, kemudian kita dekripsi menjadi <code>/dev/mapper/volume-root</code>. Maka hanya partisi yang telah didekripsi yang dapat kita <i>mount</i> untuk di-<i>install</i> <code>base</code> <i>package</i>.</p>
</div>

Membuat direktori `/boot` pada `/mnt/boot`.

```
# mkdir -p /mnt/boot
```

_Mount_ partisi `/dev/sda1` ke partisi `/mnt/boot`.

```
# mount /dev/sda1 /mnt/boot
```

<!-- PERHATIAN -->
<div class="blockquote-red">
<div class="blockquote-red-title">[ ! ] Perhatian</div>
<p>Proses mounting di atas <b>harus berurutan</b> dan <b>tidak dapat dibolak-balik</b>. Misal, <i>mounting</i> <code>/boot</code> partisi terlebih dahulu. Apabila hal ini dilakukan akan menyebabkan <b>kegagalan saat instalasi bootloader</b>.</p>
</div>

Setelah partisi yang kita siapkan telah kita _mounting_, langkah selanjutnya adalah kita akan menggunakan `pacstrap` _script_ untuk menginstal `base` _package_ Arch Linux.

```
# pacstrap /mnt base base-devel linux linux-headers linux-firmware archlinux-keyring
```

Pada proses instalasi di atas saya menambahkan `base-devel` _package_. Proses instalasi ini akan berjalan lumayan lama. “Total _download size_” saat dokumentasi ini dibuat adalah 266.60 MiB.

Saya juga menambahkan kernel `linux` beserta `linux-headers` (yang biasanya diperlukan oleh paket seperti virtualbox, dll), serta `linux-firmware`. Karena pada berita ini, [(New kernel packages and mkinitcpio hooks 2019-11-10)](https://www.archlinux.org/news/new-kernel-packages-and-mkinitcpio-hooks/){:target="_blank"}, paket linux sudah dipisahkan dari group `base`. Tentunya ini merupakan keuntungan untuk yang ingin menggunakan paket kernel yang lain, seperti kernel `linux-lts`, `linux-hardened` dan `linux-zen`.

Apabila proses `pacstrap` telah selesai, langkah selanjutnya ada _generate_ `fstab`.

```
# genfstab -U /mnt > /mnt/etc/fstab
```

Perintah ini bertujuan untuk _mounting blok_ partisi mana yang akan di-*mounted* saat sistem di-*bootup*.  Kita bisa mengecek apakah hasil dari _generate_ `fstab` dengan perintah `# cat /mnt/etc/fstab`.

Hasil dari _generate_ `fstab` tersebut adalah sebagai berikut :

```
#
# /etc/fstab: static file system information
#
# <file system>    <dir>    <type>    <options>    <dump>    <pass>
# /dev/mapper/volume-root
UUID=56fdc3fa-8a1c-4d4e-a13f-4af99bf6ae6a    / ext4  rw,relatime,data=ordered    0 1

# /dev/sda1
UUID=3394-9E03 /boot vfat rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro    0 2
```

Kita dapat melihat `/dev/sda1` dan `/dev/mapper/volume-root`, artinya _mounting_ partisi dan _generate_ `fstab` telah berhasil dan benar. Karena apabila proses _mouting_ pada Step 3.1 salah, maka hasil _generate_ `fstab` juga akan salah. Misal, tidak terdapat partisi `/boot` yaitu `/dev/sda1`, maka apabila terjadi seperti ini, akan berdampak pada kegagalan saat proses instalasi `bootloader`.

Setelah kita selesai meng-*install* _base package_, langkah selanjutnya adalah konfigurasi komponen-komponen lain yang diperlukan oleh sistem operasi seperti _Bootloader_, _Time Zone_, _Locale_, _Hostname_, _Username_, _Passwords_, dll.

Untuk masuk ke dalam sistem yang sudah kita _install_ kita akan berpindah dari _root_ Arch _Installer_ ke _root_ Arch sistem yang baru saja kita buat.

Caranya dengan menggunakan `chroot` \(_change root_\).

```
# arch-chroot /mnt
```

Apabila perintah di atas berhasil, makan kalian dapat melihat perubahan pada `username` dan `hostname` yang terbungkus oleh tanda `[ ... ]`. Artinya kita telah masuk ke dalam `root` sistem yang baru saja kita _install_.

Sebelum `arch-chroot`.
<pre>
<span style="color:red;">root</span>@archiso ~ #
</pre>

Setelah `arch-chroot`.
<pre>
[root@archiso /]#
</pre>

Pada tahap ini, kita dapat bergerak ke _step_ selanjutnya.

# STEP 4 : Set up Bootloader

## 4.1 Install Bootloader \(systemd-boot\)

Saya memilih menggunakan `systemd-boot` ketimbang `GRUB` karena lebih mudah buat saya pahami. Sebelumnya `systemd-boot` ini bernama `gummiboot`, saya gunakan juga pada mesin MacBook Pro 8.1 \(_late_ 2011\). Menurut saya `systemd-boot` ini lebih sederhana dan simpel, serta sudah termasuk dalam paket `systemd`, yang mana sudah terpasang secara _default_ bersama _base system_ Arch.

Instalasi `systemd-boot` ke `/dev/sda1` yang telah di-_mount_ ke `/mnt/boot`.

```
# bootctl ––path=/boot install
```

```
Created “/boot/EFI”.
Created “/boot/EFI/systemd”.
Created “/boot/EFI/BOOT”.
Created “/boot/loader”.
Created “/boot/loader/entries”.
Copied “/usr/lib/systemd/boot/efi/systemd-bootx64.efi” to “/boot/EFI/systemd/systemd-bootx64.efi”.
Copied “/usr/lib/systemd/boot/efi/systemd-bootx64.efi” to “/boot/EFI/BOOT/BOOTX64.EFI”.
Created EFI boot entry “Linux Boot Manager”.
```

Pastikan **tidak terjadi **_**error**_ seperti “_File system “/boot” is not a FAT EFI System Partition \(ESP\) file system._”. Apabila terjadi _error_ seperti ini, maka besar kemungkinan terjadi kesalahan pada saat _mounting partition_ \(Step 3.1\). Kamu bisa kembali melakukan _mounting_ ulang dengan terlebih dahulu keluar dari `chroot` =&gt; `# exit`.

## 4.2 Bootloader Configuration

Setelah `systemd-boot` berhasil terpasang, langkah selanjutnya adalah mengkonfigurasi _file_ `loader.conf` dan membuat `arch.conf`.

Langkah ini membutuhkan _text editor_. Saya terbiasa menggunakan `vim`.

```
# pacman -S vim
```

Sekarang, saatnya kita mengedit _file_ `/boot/loader/loader.conf`

```
# vim /boot/loader/loader.conf
```
```
#timeout 3
#console-mode keep
default 2b7aac817eaf45d9b71a8f0e5ea8b942-*
```
Saya akan komentar saja baris `default ...`

Kemudian isikan seperti contoh yang ada di bawah.

<pre>
#timeout 3
#console-mode keep
<mark>#</mark>default 2b7aac817eaf45d9b71a8f0e5ea8b942-*
<mark>default arch
timeout 0</mark>
</pre>

<!-- PERHATIAN -->
<div class="blockquote-red">
<div class="blockquote-red-title">[ ! ] Perhatian</div>
<p>Secara <i>default</i>, file <code>loader.conf</code> sudah terdapat isi di dalamnya. Kita dapat menghapus isi sebelumnya dan mengganti atau isikan persis sama seperti contoh di atas. Untuk isi dari <code>default</code> penamaan harus sama dengan file preferensi yang akan kita buat pada langkah selanjutnya (di bawah). Saya menggunakan nama yang simple, yaitu <code>arch</code> , yang nantinya akan dibuatkan file bernama <code>arch.conf</code>.</p>
<p><code>timeout 3</code> nilai ini dapat kalian sesuaikan dengan preferensi kalian masing-masing. Saya biasanya menggunakan nilai <code>1</code> atau bahkan <code>0</code>.</p>
<p>Karena saya tidak memerlukan untuk melihat <i>boot selection</i>.</p>
</div>

Apabila sudah dipastikan tidak terdapat _typo_, kalian dapat keluar dari Vim.

Tahap selanjutnya terlebih dahulu siapkan _smartphone_ atau kertas dan pulpen untuk mencatat nomor UUID.

```
# blkid -s UUID -o value /dev/sda2
```

Catat atau untuk menghindari kesalahan, foto saja nomor UUID yang tampak di layar agar lebih mudah.

Kemudian kita akan membuat _file_ `arch.conf`

```
# vim /boot/loader/entries/arch.conf
```

Isikan persis sama seperti yang tertulis di bawah.

<pre>
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options cryptdevice=UUID=<mark>56fdc3fa-8a1c-4d4e-a13f-4af99bf6ae6a</mark>:volume root=/dev/mapper/volume-root rw
</pre>

Ganti `UUID=56fdc3fa-8a1c-4d4e-a13f-4af99bf6ae6a` dengan UUID milikmu. Jangan sampai ada yang _typo_. Harus benar-benar sama persis.

Apabila terjadi  kesalahan dapat menyebabkan sistem operasi yang tersimpan pada `/dev/sda2` tidak dapat di-*load* ke dalam RAM.

<!-- INFORMATION -->
<div class="blockquote-blue">
<div class="blockquote-blue-title">[ i ] Informasi</div>
<p>Kalau menggunakan Vim, dapat menggunakan cara yang lebih mudah ini.</p>
<p>Buat baris baris baru di bawah <code>options</code>, <kbd>Shift</kbd>+<kbd>O</kbd>.</p>
<p>Lalu masukkan command di bawah.</p>
<pre>
:r! blkid -s UUID -o value /dev/sda2
</pre>
<p>Nanti akan menghasilkan <i>output</i> berupa <code>UUID</code> dari <code>/dev/sda2</code>.</p>
<p>Asik bukan.</p>

</div>

Setelah dipastikan tidak terdapat _typo_, kita dapat menyimpannya dan keluar dari Vim.

Kemudian lakukan _update_ `systemd-boot`.

```
# bootctl update
```
Outputnya adalah,
```
Copied "/usr/lib/systemd/boot/efi/systemd-bootx64.efi" to "/boot/EFI/systemd/systemd-bootx64.efi"
Copied "/usr/lib/systemd/boot/efi/systemd-bootx64.efi" to "/boot/EFI/BOOT/BOOTX64.EFI"
```

Karena kita menggunakan partis LVM yang terenkripsi, untuk itu kita perlu mengedit _file_ `/etc/mkinitcpio.conf` agar kita dapat menggunakan _keyboard_ untuk memasukkan _password_ sebelum _filesystems_ di-*load* lebih dahulu.

```
# vim /etc/mkinitcpio.conf
```

Cari baris yang bertuliskan `HOOKS=(base udev dst... )`. Biasanya pada baris 52.

<pre>
...
...

HOOKS=(base udev autodetect modconf block filesystems <mark>keyboard</mark> fsck)
...
...
</pre>

Pindahkan `keyboard` setelah `block` dan tambahkan `encrypt` dan `lvm2`, seperti contoh di bawah ini.

<pre>
...
...

HOOKS=(base udev autodetect modconf block <mark>keyboard encrypt lvm2</mark> filesystems fsck)
...
...
</pre>

Setelah kalian memastikan tidak terdapat _typo_, kalian dapat simpan dan keluar dari Vim.

Berdasarkan [Arch Wiki](https://wiki.archlinux.org/index.php/LVM#Configure_mkinitcpio){:target="_blank"}, paket `lvm2` belum terpasang pada sistem yang kita masuki dengan menggunakan arch-chroot ini. Maka, kita perlu memasang paket tersebut.

```
# pacman -S lvm2
```

Langkah terakhir pada proses _bootloader configuration_ ini adalah, _update_ `initramfs` dengan cara sebagai berikut.

```
# mkinitcpio -p linux
```

Untuk kalian yang menggunakan _processor_ Intel. Sebaiknya kita menambahkan paket yang bernama `intel-ucode`. Kegunaannya dapat dibaca [di sini](https://wiki.archlinux.org/index.php/Microcode).

```
# pacman -S intel-ucode
```

Kemudian tambahkan `initrd /intel-ucode.img` pada file `/boot/loader/entries/arch.conf` seperti contoh di bawah.

```
# vim /boot/loader/entries/arch.conf
```

<pre>
title Arch Linux
linux /vmlinuz-linux
<mark>initrd /intel-ucode.img</mark>
initrd /initramfs-linux.img
options cryptdevice=UUID=56fdc3fa-8a1c-4d4e-a13f-4af99bf6ae6a:volume root=/dev/mapper/volume-root rw
</pre>

Setelah kalian memastikan tidak terdapat _typo_, kalian dapat simpan dan keluar dari Vim.

Kemudian lakukan _update_ `systemd-boot` dan _generate_ `mkinitcpio`.

```
# bootctl update
```

```
# mkinitcpio -p linux
```

Langkah di atas kita lakukan karena kita menggunakan `systemd-boot`. Untuk _bootloader_ `GRUB`, hanya tinggal melakukan _regenrate_ `grub-mkconfig` saja. Namun, saya kurang begitu memahaminya.

Sampai di sini, apabila kita _reboot_, sebenarnya kita sudah dapat masuk ke dalam Arch sistem.

Namun, sistem kita masih belum lengkap karena kita perlu melakukan beberapa konfigurasi dasar yang diperlukan oleh sebuah sistem operasi. Seperti, _locale_, _hostname_, _username_, _password_, _zoneinfo_ _time_, dll.

Untuk itu, sementara kita lanjutkan saja pada _session_ ini. Dan jangan *reboot* dahulu, nanti susah lagi konek internetnya (sebenarnya gampang aja, via *usb tethering*).


# STEP 5 : Set Language and Time Zone

## 5.1 Locale

Konfigurasi _locale_ dimaksudkan untuk menginformasikan kepada aplikasi yang berjalan pada sistem operasi kita bahwa kita menggunakan _locale_ \(yang kita pilih\) tersebut.

_locale_, sejauh yang saya gunakan adalah untuk mengatur _language_ \(bahasa\), _first day in calendar_, _date and time default format_, _paper format_, _currency format_, _distance format_, dan lain sebagainya.

Untuk memilih _locale_, terlebih dahulu kita perlu membuka akses _locale_ yang masih ter-_disable_ pada _file_ `/etc/locale.gen`. Dalam hal ini saya akan mengaktifkan / _uncommenting_ `en_US.UTF-8`.

```
# vim /etc/locale.gen
```

_Scroll_ ke bawah dan cari baris yang mengandung isi `en_US.UTF-8 UTF-8`, lalu hilangkan tanda `#` yang ada di depan baris tersebut.

<pre>
...
...

#en_SG.UTF-8 UTF-8
#en_SG ISO-8859-1
<mark>en_US.UTF-8 UTF-8</mark>
#en_US ISO-8859-1
#en_ZA.UTF-8 UTF-8
...
...
</pre>

Kamu dapat juga memilih bahasa **Indonesia**, dengan _scrolling_ ke bawah dan hilangkan tanda `#` pada `id_ID.UTF-8 UTF-8`. Namun, saya pribadi lebih _prefer_ hanya menggunakan **English** saja.

Kemudian _generate_ `locale` dengan perintah.

```
# locale-gen
```
```
Generating locales...
    en_US.UTF-8... done
Generating complete.
```

Mengeset _locale_ yang sudah kita _generate_ ke dalam _file_ `/etc/locale.conf`.

```
# locale > /etc/locale.conf
```

Konfigurasi lebih jauh mengenai `locale`, seperti _firstday in week_, _paper format_, dll., akan saya tambahkan pada kesempatan yang lain.

## 5.2 Time zone

Untuk mengatur _time zone_, gunakan `tzselect` dan ikuti alur perintahnya.

Misal, **\(4\) Asia → \(15\) Indonesia → \(3\) Borneo \(east, south … \) → \(1\) Yes**.

```
# tzselect
```

Kemudian, kita perlu untuk membuat _symlink_ untuk mengeset `localtime`.

```
# ln -sf /usr/share/zoneinfo/Asia/Makassar /etc/localtime
```

Saya berada pada waktu lokal WITA, jadi saya pilih _localtime_ Makassar. Kamu dapat menggantinya dengan _localtime_ Jakarta untuk WIB.

Selanjutnya adalah _hardware clock_. Bagaimanapun juga _hardware clock_ akan menggunakan UTC. Sehingga kita perlu megesetnya dengan cara sebagai berikut.

```
# hwclock --systohc --utc
```

Sampai sini, proses konfigurasi _locale_ dan _time zone_ telah selesai. Kita dapat melangkah ke _step_ selanjutnya.


# STEP 6 : Create User, Password and Hostname

## 6.1 User and Password

Secara _default_, Arch Linux yang telah kita _install_ telah memiliki akun, yaitu `root`. Yang ditandai dengan tanda `#` pada Terminal. Dan saat ini pun kita sedang menggunakan akun `root`. Namun akun ini secara _default_ **belum memiliki password**. Oleh karena itu kita perlu bahkan lebih ke-**harus** mengeset _password_ untuk akun `root`.

```
# passwd root
```

Kemudian, masukkan _password_ untuk akun `root`. Karakter _password_ memang tidak akan ditampilkan. Kamu akan diminta memasukkan _password_ yang sama, sebanyak dua kali. Dan **jangan sampai lupa**, karena akun `root` ini adalah akun yang sangat penting.
```
New password:
Retype new password:
passwd: password updated successfully
```

Kita sudah membuat _password_ untuk akun `root`. Namun, untuk pengunaan sehari-hari sebaiknya kita tidak menggunakan akun ini. Sangat direkomendasikan untuk membuat akun `user`. Caranya sebagai berikut.

Buat _group_ `sudo` terlebih dahulu.

```
# groupadd sudo
```

Kemudian buat _username_.

```
# useradd -m -g users -G sudo,storage,wheel,power,input,network bandithijo
```

Saya menggunakan _username_ **bandithijo**. Kamu dapat mengganti dengan _username_ yang kamu inginkan. Sebagai catatan _username_ haruslah berupa karakter huruf, _lowercase_ \(huruf kecil\), dan tidak boleh ada spasi.

Setelah membuat akun `user`, kita akan mengeset _password_ untuk user baru ini.

```
# passwd bandithijo
```
```
New password:
Retype new password:
passwd: password updated successfully
```

Masukkan _password_ untuk akun **bandithijo**.

Selanjutnya, mengeset `/etc/sudoers`. Kita akan mengaktifkan perintah `sudo` agar dapat memiliki kemampuan seperti _superuser_.

Kemudian, _edit_ file `/etc/sudoers`.

```
# vim /etc/sudoers
```

_Scrolling_ ke bawah dan cari `# %sudo ALL = (ALL) ALL`. Lalu hapus tanda pagar `#` untuk meng-_enable_-kan user yang termasuk dalam _group_ `sudo` dapat mengeksekusi semua _command_ \(perintah\) pada Terminal. Hasilnya seperti contoh di bawah.

<pre>
...
...
## Uncomment to allow members of group sudo to execute any command
<mark>   %sudo    ALL=(ALL) ALL</mark>
...
...
</pre>

Simpan dan keluar.

Untuk Vim, simpan dengan `:w!` untuk memaksa menyimpan perubahan pada file dengan *read only permisson*.

## 6.2 Hostname

Pada _step_ ini, kita akan memberikan _hostname_ pada sistem kita. Sebenarnya ini bukan hal yang _crucial_, namun karena ini komputer atau laptop pribadi kita, ada baiknya kita memberikan preferensi tersendiri.

Untuk mengkonfigurasi `hostname`,

```
# echo “Arch-Machine” > /etc/hostname
```

Perintah di atas akan menambahkan `Arch-Machine` pada _file_ `/etc/hostname`. Kita dapat mengecek isi dari `/etc/hostname` dengan menggunakan perintah `$ cat /etc/hostname`.

Penamaan `hostname` berbeda dengan penamaan pada `username`. Pada `hostname`, kita dapat menggunakan _uppercase_ \(kapital\), angka, simbol dan tanpa spasi.

<hr>
Oke, saat ini proses konfigurasi dasar dari sistem operasi Arch Linux sudah selesai. Namun, kita membutuhkan sistem operasi yang pengoperasiannya menggunakan GUI \(_Graphical User Interface_\) atau biasa dikenal dengan DE \(_Desktop Environment_\) agar kita dapat menggunakan sistem operasi ini dengan mudah. Karena saat ini, sudah sangat jarang ditemukan user yang masih menggunakan _text mode_ atau WM \(_Window Manager_\) pada komputer atau laptop pribadinya. Meskipun saya termasuk yang malah ketagihan menggunakan WM.

Langkah selanjutnya adalah melihat apakah proses instalasi kita berhasil atau tidak. Kita akan melakukan _reboot system_ untuk mengeceknya.

Namun sebelumnya, tambahkan dulu paket-paket di bawah ini. Agar memudahkan konektifitas jaringan. Saat kita sudah memasuki sistem dasar yang sudah kita bangun.
```
# pacman -S networkmanager network-manager-applet
```
Aktifkan servicenya.
```
# systemctl enable NetworkManager.service
```
<!-- INFORMATION -->
<div class="blockquote-blue">
<div class="blockquote-blue-title">[ i ] Informasi</div>
<p>Saya tidak memasang <code>network-manager-applet</code> karena lebih terbiasa menggunakan <code>nmtui</code> (Network Manager Terminal User Interface) yang sudah disertakan bersama paket <code>networkmanager</code>.</p>
</div>

Setelah itu _exit_ dari `chroot`.

```
# exit
```

_Unmounting_ semua partisi yang sebelumnya kita _mount_ ke direktori `/mnt`.

```
# umount -R /mnt
```

Lalu _restart_.

```
# reboot
```

Setelah berhasil menampilkan halaman _login_.

```
Arch Linux 4.13.12-1-ARCH (tty1)
Arch-Machine login: _
```

_Login_ dengan akun yang telah kita buat pada Step 6.1.

```
Last login: Thu Nov 16 14:57:01 on tty1
[bandithijo@Arch-Machine ~]$ _
```

Kalau pada tahap ini kalian berhasil. **Welcome to the BrotherHood !**


# STEP 7 : Install GNOME and Complete Installation

## 7.1 Check Internet Connection

Sebelum memasang paket **GNOME** _desktop_, pastikan dulu kalian telah terhubung dengan Internet.

```
$ ping google.com
```

Apabila keluar hasil seperti di bawah.

```
ping: google.com: Name or service not known
```

Menandakan bahwa kita belum terhubung ke Internet. Lakukan perintah di bawah untuk menjalankan `dhcpcd`.

```
$ sudo dhcpcd
```
Atau kalian dapat kembali merujuk pada _Step 1 : Connecting to the Internet_ untuk dapat kembali melakukan konfigurasi Internet.

Pada perintah di atas, kita menambahkan perintah `sudo` tepat sebelum _command_\(perintah\) `dhcpcd`, karena saat ini kita bukan lagi berada pada `root` _previlege_.  Kita berada pada akun kita sendiri yang hak aksesnya lebih terbatas. Ditandai dengan simbol `$` . Maka dari itu kita memerlukan bantuan `sudo` untuk membuat kita dapat mengeksekusi _command_ yang seharusnya hanya bisa dijalankan oleh `root` saja.

Kemudian kita akan diminta memasukkan _password_. Masukkan _password_ `user` kita \(bukan _password_ `root`\).

```
[sudo] password for archer: _
```

Setelah itu akan muncul pemberitahuan seperti di bawah.

```
dev: loaded udev
no interfaces have a carrier
forked to background, child pid 342
```

Sekarang coba lakukan ping lagi dengan cara `ping google.com`

Mungkin diperlukan 1 - 2 menit untuk menunggu sampai `ping` berhasil didapatkan. Apabila berhasil, artinya kita sudah terhubung ke Internet. Saatnya melangkah ke _step_ selanjutnya.

## 7.2 GNOME Desktop Environment

Pada dokumentasi kali ini saya memilih menggunakan **GNOME** _desktop environment_, ketimbang **XFCE** ataupun **KDE**. Karena menurut saya _desktop environment_ yang satu ini lebih mudah untuk diajarkan maupun digunakan karena _interface_-nya yang simpel dan minimalis. Selain itu cukup banyak distribusi sistem operasi GNU/Linux yang lain, yang juga menyertakan GNOME _desktop_ menjadi _default environment_ mereka.

Untuk teman-teman yang ingin menggunakan _desktop environment_ yang lain, dapat merujuk pada [Arch Wiki](https://wiki.archlinux.org/index.php/Desktop_environment) untuk proses instalasinya.

Untuk menginstal GNOME _desktop environment_, sangat mudah karena kita cukup mengetikkan _command_ di bawah ini.

```
$ sudo pacman -S gnome gnome-extra
```

_Command_ di atas dimaksudkan bahwa kita akan memasang dua buah paket aplikasi, `gnome` dan `gnome-extra`. `gnome` berisi paket-paket dasar dari GNOME _desktop_ sedangkan `gnome-extra` adalah paket-paket tambahan pendukung GNOME _desktop_.

Apabila keluar daftar paket-paket dari _group_ `gnome`.

```
Enter a selection (default=all): _
```

Maka kita memilih `all` dengan menekan tombol `ENTER`.

Selanjutnya akan keluar daftar paket-paket dari _group_ `gnome-extra`.

```
Enter a selection (default=all): _
```

Sekali lagi, kita hanya perlu memilih `all` dengan menekan tombol `ENTER`.

Apabila masih keluar pemberitahuan yang lain untuk memilih _default option_ dari _repository extra_ \(seperti: `libx264`, `xdg-desktop-portal-gtk`, dll\), saya memilih nomor **1 (default)** saja, jadi tinggal tekan tombol `ENTER`.

Setelah itu akan keluar daftar semua paket-paket dari GNOME _desktop_ yang akan kita pasang.

```
...
...
Total Download  Size:  591.06 MiB
Total Installed Size: 2786.74 MiB

:: Proceed with installation? [Y/n]
```

Tekan tombol  `Y`  → `ENTER`, atau langsung tekan `ENTER` untuk memilih Yes. Tunggu proses _download_ dan instalasi hingga selesai.

## 7.3 Enable GNOME Desktop Manager \(Login Manager\)

_Desktop Manager_ adalah aplikasi GUI yang menyediakan _interface_ kepada kita untuk dapat _login_ ke dalam sistem kita. Terdapat banyak _Desktop Manager_ pada sistem operasi GNU/Linux. **GDM**, **KDM**, **LightDM**, **SDM**, dan masih banyak lagi. Karena dokumentasi ini menggunakan GNOME _desktop environment_, maka kita akan menggunakan _desktop manager_ yang sudah termasuk dalam GNOME _base package_, yaitu GDM \(_GNOME Desktop Manager_\).

Untuk mengaktifkan dan membuat GDM otomatis dijalankan saat sistem pertama kali dinyalakan, kita perlu membuat _symlink service_ dari GDM terlebih dahulu.

```
$ sudo systemctl enable gdm.service
```

```
Created sysmlink /etc/systemd/system/display-manager.service → /usr/lib/ ...
```

Apabila keluar _output_ seperti di atas, maka proses instalasi GDM telah berhasil.

## 7.4 Manage Network with GUI

Secara _default_ GNOME _desktop_ belum meiliki aplikasi GUI untuk mengatur konfigurasi _network_. Maka, kita perlu untuk menambahkan beberapa paket yang mungkin ~~belum~~ termasuk dari _base package_ GNOME _desktop_. Meskipun paket pendukung _networking_ ini biasanya sudah termasuk dalam paket instalasi saat kita memasang _desktop environment_.

```
$ sudo pacman -S networkmanager network-manager-applet wpa_supplicant wpa_actiond dialog iw
```

Kemudian setelah proses instalasi selesai, kita perlu mengaktifkan _service_ dari `networkmanager` agar dapat berjalan saat sistem _startup_.

```
$ sudo systemctl enable NetworkManager.service
```

```
Created sysmlink /etc/systemd/system/dbus-org.freedesktop.NetworkManager.serv ...
Created sysmlink /etc/systemd/system/multi-user.target.wants/NetworkManager. ...
Created sysmlink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.servi ...
```

Maka pada _next reboot_, kalian sudah dapat menikmati konfigurasi _network_ melalui GUI. Termasuk konfigurasi _wifi_ juga telah tersedia.

Untuk teman-teman yang _wifi adapter_-nya tidak terdeteksi. Dapat mencari solusinya di Google yaa. Hehehe. Hal yang dapat kalian jadikan sebagai _keyword_ adalah :

1. Apa nama _vendor_ dari _network_ _adapter_ kalian \(misal: Intel, Atheros, Broadcom, Realtek, dll\)
2. Apa _type_ dari _network adapter_ \(misal : BCM43XX, rt3573, ath5k, ath9k, dll\)

Sumber bacaan lebih lanjut tentang _wireless network configuration_ dapat dibaca [di sini](https://wiki.archlinux.org/index.php/Wireless_network_configuration).

## 7.5 Enable Multilib Support for 32 bit Architecture

Meskipun laptop atau komputer kalian sudah menggunakan 64 bit, namun tidak ada salahnya untuk tetap mengaktifkan dukungan _library_ terhadap _processor_ 32 bit. Karena beberapa aplikasi terkadang masih membawa dependensi _library_ 32 bit.

```
$ sudo nano /etc/pacman.conf
```

Kemudian _scrolling_ ke bawah, cari bagian `[multilib]`, lalu aktifkan \(_uncommenting_\) baris tersebut dengan cara menghapus tanda pagar `#`.

<pre>
...
...
# If you want to run 32 bit applications on your x86_64 system,
# enable the multilib repositories as required here.

#[multilib-testing]
#Include = /etc/pacman.d/mirrorlist

<mark>[multilib]
Include = /etc/pacman.d/mirrorlist</mark>

...
...
</pre>

Setelah disimpan, lakukan _update repository_.

```
$ sudo pacman -Sy
```

## 7.6 Enable AUR \(Arch User Repository\)

Arch Linux selain memiliki _official repository_ yang dikelola oleh tim pengembang, tentu saja juga memiliki _repository_ yang di _maintenance_ oleh Arch _user_. AUR _package_ yang mempunyai popularitas yang baik akan dipertimbangkan dan berkesempatan untuk masuk ke dalam _official repository_. AUR _repository_ tidak langsung secara _default_ ada pada daftar _repository_ kita. Kita perlu mengaktifkannya terlebih dahulu.

Terdapat banyak cara, sejauh ini yang saya ketahui ada dua cara untuk mengaktifkan AUR _repository_. Namun saya hanya akan menuliskan satu saja cara yang menurut saya paling mudah. Yaitu dengan menambahkan _custom repository_ dari _archlinuxfr_.

```
$ sudo nano /etc/pacman.conf
```

Kemudian tambahkan _archlinuxfr repository_ ke bagian paling bawah.

```
...
...
[archlinuxfr]
Server = http://repo.archlinux.fr/$arch
SigLevel = Never
```

Setelah menambahkan _archlinuxfr repository_, saatnya melakukan sinkronisasi.

```
$ sudo pacman -Sy
```

Untuk dapat melakukan instalasi paket-paket yang terdapat pada AUR, kita memerlukan _package manager_ tambahan, _package manager_ ini sama seperti `pacman` yang juga di jalankan pada Terminal. Selama ini, saya menggunakan dua `package manager` untuk memasang paket pada repositori AUR yaitu `yaourt` dan `pacaur`. Namun kali ini saya hanya akan mendokumentasikan penggunaan `yaourt` saja,  untuk mempersingkat dan menyederhanakan kerumitan dari dokumentasi ini.

```
$ sudo pacman -S yaourt rsync customizepkg
```

<!-- INFORMATION -->
<div class="blockquote-blue">
<div class="blockquote-blue-title">[ i ] Informasi</div>
<p>Paket <b>Yaourt</b> sudah <i>deprecated</i> (usang). Saya lebih merekomendasikan untuk menggunakan <b>Yay</b>.</p>
<p>Untuk menginstall Yay, sangat mudah, dan tidak perlu menambahkan repo <code>[archlinuxfr]</code> seperti di atas.</p>
<pre>
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
</pre>
</div>

Setelah paket-paket di atas selesai di-*install*, saya merekomendasikan untuk men-*disable* kembali _archlinuxfr repository_, agar tidak terjadi bentrokan atau tumpang tindih paket antar _official repository_ dengan _archlinuxfr repository_.

Selanjutnya kita perlu untuk melakukan pengaturan pada `yaourt` sebelum dapat kita gunakan. Kita akan menjadikan Vim sebagai _default_ text editor untuk melihat PKGBUILD dari paket AUR yang kita _install_ dengan `yaourt`. PKGBUILD ini semacam resep yang berisi bahan-bahan dan cara meng-*install* paket ke dalam sistem Arch Linux kita.

Untuk BASH _shell_,

```
$ nano ~/.bashrc
```

Kita akan menambahkan pada baris terakhir \(atau pada baris mana saja\)

```
# PKGBUILD YAOURT
export VISUAL="vim"
```

_Save_ dan _exit_.

Cara di atas dimaksudkan apabila nanti `yaourt` menampilkan PKGBUILD saat proses instalasi paket, maka akan ditampilkan menggunakan Vim, dan kita bisa langsung _exit_ dengan `:q`.

Proses instalasi paket/aplikasi dengan menggunakan `yaourt` ini sedikit berbeda dengan menggunakan `pacman`. Mungkin kalian dapat mencari informasi pada dokumentasi Archer lain di Google atau Youtube tentang bagaimana proses instalasi paket/aplikasi menggunakan `yaourt`.

<!-- PERTANYAAN -->
<div class="blockquote-yellow">
<div class="blockquote-yellow-title">Mengapa perlu meng-enable-kan AUR ?</div>
<p>Karena kita membutuhkan paket-paket yang belum tersedia pada <i>official repositry</i>, sedangkah sudah tersedia pada AUR <i>repository</i>.</p>
<p>Beberapa paket pada AUR terkadang dibutuhkan untuk keleluasaan kita menggunakan distribusi sistem operasi Arch Linux.</p>
<p>Contohnya paket yang tidak terdapat pada <i>official repository</i> adalah: Google Chrome, Spotify, dan masih banyak lagi.</p>
</div>

## 7.7 ZSH Shell

Biasanya secara _default_, _shell_ yang dibawa setelah proses instalasi adalah BASH s_hell_. Kita dapat melakukan pengecekan dengan perintah di bawah.

```
$ echo $SHELL
```

_Shell_ adalah _environment_ pada Terminal _emulator_ tempat kita memasukkan baris-baris _command_. Terdapat berbagai macam jenis _shell_ dengan kelebihan fitur masing-masing, seperti BASH, ZSH, FISH, DASH, dsb. Saya pribadi lebih _prefer_ menggunakan ZSH _shell_. ZSH _shell_ fungsinya sama dengan BASH _shell_ namun dengan penambahan fitur-fitur lain, seperti _auto completion_ yang lebih memanjakan jari-jari. Hanya dengan mengetikkan 2 - 3 huruf awalan dari _command_, kemudian tekan tombol **TAB**, dengan pintar, ZSH akan melengkapi _command_ yang kita masukkan.

```
$ sudo pacman -S zsh zsh-completions
```

Selanjutnya kita akan buat ZSH _shell_ mejadi _default shell_, agar kita tidak perlu repot mengaktifkan ZSH _shell_ dengan mengetikkan `$ zsh` pada Terminal setiap saat.

```
$ chsh -s /usr/bin/zsh
```

Untuk me-_restart_ _shell_ tanpa harus mengeluarkan Terminal, cukup masukkan _command_ berikut.

```
$ exec $SHELL
```

Biasanya pada kondisi-kondisi tertentu kita perlu melakukan _restart_ terhadap Terminal, seperti sehabis instalasi program via `pacman` dan `yaourt` untuk dapat memanggil program-program yang baru saja di-_install_ atau di-_update_ tersebut, kita perlu melakukan _restart_ pada Terminal.

Pengaturan terakhir, jangan lupa pindahkan pengaturan _shell_ tambahan yang sudah pernah kita buat pada `~/.bashrc` ke dalam `~/.zshrc`.

```
$ nano ~/.zshrc
```

```
# PKGBUILD YAOURT
export VISUAL="vim"
```

Simpan dan _exit_.

## 7.8 Touchpad Driver

Untuk kalian yang menggunakan laptop, dapat meng-_install driver_ `libinput`. `libinput` adalah _library_ yang menangani _input devices_ pada `Wayland` _compositor_ dan `X.org`. `libinput` dapat mendeteksi dan mengatur pemrosesan _device_. Jadi sebenarnya `libinput` ini tidak khusus untuk _touchpad driver_ saja.

```
$ sudo pacman -S xf86-input-libinput
```

## 7.9 Graphic Card Driver

Sejak Intel menyediakan dan men-_support_ driver-driver yang _open source_, Intel graphics sudah secara langsung dapat di-_plug and play_ \(pasang tanpa membutuhkan driver\). Intel Kernel Module akan berjalan secara otomatis pada saat _system boot_.

Namun untuk kenyamanan berkomputasi yang lebih baik saya menyarankan untuk tetap meng_intall_ beberapa _package_ pendukung di bawah ini.

### 7.9.1 Mesa Driver

Pertama, kita perlu meng-_install_ `mesa` _package_, yang menyediakan dukungan terhadap DRI \(_Direct Rendering Infrastructur_\) driver untuk akselarasi gambar 3D.

```
$ sudo pacman -S mesa
```

### 7.9.2 DDX Driver \(xf86-video\)

Untuk dukungan terhadapr DDX driver \(yang menyediakan akselarasi gambar 2D pada `Xorg`\), kita membutuhkan `xf86-video-intel` _package_.

<!-- PERHATIAN -->
<div class="blockquote-red">
<div class="blockquote-red-title">[ ! ] Perhatian</div>
<p>Debian & Ubuntu, Fedora, KDE, merekomendasikan untuk tidak meng-<i>install</i> <code>xf86-video-intel</code>. Dan tetap menggunakan <i>modesetting driver</i> yang sudah disertakan pada Intel GPU generasi ke 4 dan yang lebih baru.</p>
<p>Namun, bagaimanapun juga <i>modesetting</i> driver ini dapat pula menyebabkan problem seperti <a href="https://bugs.chromium.org/p/chromium/issues/detail?id=370022" target="_blank">Chromium Issue 370022</a>.</p>
</div>

```
$ sudo pacman -S xf86-video-intel
```

### 7.9.3 Vulkan Driver

Untuk dukungan terhadap Vulkan 3D _rendering_, kita perlu meng-_install_ `vulkan-intel` _package_.

```
$ sudo pacman -S vulkan-intel
```

Untuk kalian yang menggunakan Intel Processor generasi ke 4 \(Skylake\), kita perlu menambahkan konfigurasi `Xorg` tambahan agar kita dapat mengambil keuntungan dari beberapa _driver_ yang tersedia. Caranya, dengan membuat _file_ konfigurasi pada _file_ `/etc/X11/xorg.conf/20-intel.conf`.

```
$ sudo nano /etc/X11/xorg.conf/20-intel.conf
```

_File_ `20-intel.conf` ini masih kosong, karena baru saja kita buat. Selanjutnya, isikan seperti contoh di bawah.

```
Section "Device"
  Identifier  "Intel Graphics"
  Driver      "intel"
  Option      "DRI"   "2"          # DRI3 is now default
  #Option      "AccelMethod" "sna" # default
  #Option      "AccelMethod" "uxa" # fallback
EndSection
```

Preferensi di atas adalah preferensi yang direkomendasi saat pertama kali kita memasang paket `vulkan-intel`.

Namun saya mencoba untuk menggunakan DRI3.

```
Section "Device"
  Identifier  "Intel Graphics"
  Driver      "intel"
  # Option      "DRI"   "2"
  Option      "DRI"   "3"         # DRI 3 is now default
  Option      "AccelMethod" "sna" # default
  # Option      "AccelMethod" "uxa" # fallback
  Option      "TearFree"  "true"
EndSection
```

Konfigurasi di atas adalah hasil preferensi saya dari mencari solusi di Arch Forum karena permasalahan hasil _video screencast_ yang _flickering_. Jadi apabila ternyata tidak cocok atau menyebabkan masalah pada sistem kalian, maka kalian dapat mengikuti preferensi yang direkomendasikan.

Sumber bacaan lebih lanjut dapat dipelajari sendiri pada Arch Wiki [di sini](https://wiki.archlinux.org/index.php/Intel_graphics) \(Intel Graphic\).

Untuk teman-teman yang menggunakan _dual graphic card_, seperti Nvidia dan ATI dapat mempelajarinya [di sini](https://wiki.archlinux.org/index.php/NVIDIA) \(NVIDIA\) dan [di sini](https://wiki.archlinux.org/index.php/ATI) \(ATI\).

Sampai pada tahap ini mungkin kita bisa melakukan _restart system_ terlebih dahulu. Sekalian melakukan pengecekan apakah langkah-langkah konfigurasi yang telah kita lakukan telah berhasil.

```
$ reboot
```

![]()

Gambar 1 - Tampilan GNOME _Desktop Environment_

Nah, kalau kalian berhasil mencapai _dekstop_ **GNOME** seperti pada tampilan di atas. Artinya proses langkah-langkah konfigurasi berjalan sukses.

## 7.10 Encrypt Home Directory

Selain kita melakukan enkripsi terhadap partisi `/` , saya merekomendasikan untuk melakukan enkripsi pada `/home` direktori. Tujuannya tentu saja untuk memberikan pengamanan data yang berlapis-lapis. Namun meskipun pengamanannya berlapis, kita cukup memasukkan satu kali _password_ pada saat _login_ dan `/home` _directory_ kita sudah otomatis ter-_mounting_.

Pemberian enkripsi pada direktori `/home` ini memang sebaiknya dilakukan saat sistem baru pertama kali dipasang. Karena direktori `/home` dari `user` belum terdapat data-data di dalamnya.

Langkah pertama, kita perlu _logout_ dari sistem.

Setelah sampai di halaman GDM _Login Manager_, tekan kombinasi tombol **CTRL + ALT + F2** untuk berpindah ke `tty2` _shell_.

Kemudian _login_ sebagai `root`.

```
Arch Linux 4.13.12-1-ARCH (tty2)

Archer-Computer login: root
Password: _
```

Selanjutnya, lakukan pengecekan apakah `user` kamu masih memiliki proses yang _running_.

```
# Ps -U archer
```

```
PID  TTY      TIME  CMD
```

Apabila mengeluarkan _output_ seperti di atas, artinya sudah tidak ada lagi proses yang _runnning_ pada _user_ **archer** \(ganti dengan _username_ kalian\). Dan kita dapat melangkah ke tahap selanjutnya.

Instal _package_ yang diperlukan untuk melakukan enkripsi.

```
# pacman -S rsync lsof ecryptfs-utils
```

Tunggu proses instalasinya hingga selesai.

Selanjutnya, `modprobe ecryptfs` yang sudah kita instal tadi.

```
# modprobe ecryptfs
```

Kalau tidak ada _output_ apa-apa yang keluar, artinya sudah benar.

Selanjutnya, proses menggunakan `ecryptfs` untuk mengenkripsi direktori `/home`.

```
# ecryptfs-migrate-home -u archer
```

**archer** adalah nama `username` saya, ganti dengan `username` kalian.

<!-- PERHATIAN -->
<div class="blockquote-red">
<div class="blockquote-red-title">[ ! ] Perhatian</div>
<p>Masukkan <b>password</b> yang sama dengan <b>login password username</b> kalian.</p>
</div>


```
INFO: Checking disk space, this may take a few minutes. Please be patient.
INFO: Checkingfor open files in /home/archer
Enter your login passphrase [archer]: _
```

Perhatikan dengan seksama _output_ tersebut. Kita diminta memasukkan _passphrase_ atau _password_ yang sama seperti _password username_ kita. Tujuannya agar saat kita login dengan menggunakan akun username kita, secara otomatis `ecryptfs` akan men-dekripsi direktori `/home` kita yang terenkripsi \(baca: auto-mounting `/home` directory\).

Proses ini akan menghabiskan ~~sedikit~~ waktu, tergantung dari banyaknya _file_ yang ada di dalam direktori `/home`.

Setelah selesai, kita dapat _logout_.

```
# exit
```

Kemudian _login_ kembali sebagai _user_ kita.

```
Arch Linux 4.13.12-1-ARCH (tty2)

Archer-Computer login: archer
Password: _
```

Kemudian, _mounting_ direktori `/home` yang terenkripsi dengan cara,

```
$ ecryptfs-mount-private
```

```
Enter your login passphrase: _
```

Masukkan _password login user_ kita untuk mendekripsi direktori `/home`  dan otomatis akan di _auto-mounting_ ke direktori `/home`.

Kemudian mungkin kalian ingin melihat `wrapped-passphrase` dalam bentuk yang tidak terenkripsi `unwrapped-passphrase`.

```
$ ecryptfs-unwrap-passphrase
```

Kalian dapat mencatatnya pada secarik kertas dan simpan baik-baik. Kalian dapat menggunakannya untuk me-*recovery* data-data yang terenkripsi pada kasus misalkan `wrapped-passphrase` tiba-tiba hilang atau _corrputed_ atau bahkan kalian lupa _login password_.

Selanjutnya lakukan pengecekan `auto-mount`, `auto-unmount`, `wrapped-passphrase`.

```
$ ls .ecryptfs
```

```
Private.mnt Private.sig auto-mount auto-unmount wrapped-passphrase
```

Apabila ada, akan menunjukkan _output_ seperti di atas.

Kemudian kita perlu menambahkan tiga baris propertis pada `/etc/pam.d/system-auth`. Ketiga baris propertis ini masing-masing memiliki penempatan yang berbeda-beda. Perhatikan dengan baik susunannya dan tidak boleh asal.

Gunakan _text editor_ Vim atau Nano.

```
$ sudo nano /etc/pam.d/system-auth
```

<pre>
#%PAM-1.0

auth      required  pam_unix.so     try_first_pass nullok
<mark>auth      required  pam_ecryptfs.so unwrap</mark>
auth      optional  pam_permit.so
auth      required  pam_env.so

account   required  pam_unix.so
account   optional  pam_permit.so
account   required  pam_time.so

<mark>password  optional  pam_ecryptfs.so</mark>
password  required  pam_unix.so     try_first_pass nullok sha512 shadow
password  optional  pam_permit.so

session   required  pam_limits.so
session   required  pam_unix.so
<mark>session   optional  pam_ecryptfs.so unwrap</mark>
session   optional  pam_permit.so
</pre>

_Reboot system_, dan pastikan kalian dapat _login_ ke _user desktop_ kalian.

Langkah terakhir adalah menghapus _backup_ dari direktori `/home` .

```
$ cd /home
```

Kemudian tampilkan isi dari direktori `/home`.

```
$ ls
```

```
archer archer.p7o6p7R2
```

Perhatikan bahwa terdapat direktori yang sama dengan direktori `username` kita, namun terdapat penambahan _random character_ di belakangnya. Ini adalah hasil _backup_ dari proses enkripsi kita sebelumnya.

Kita dapat menghapusnya dengan aman.

```
$ sudo rm -rvf archer.p7o6p7R2
```

Maka proses enkripsi direktori `/home` kita telah selesai.

## 7.11 Set Up Firewall

Cara terbaik untuk mengkonfigurasi firewall adalah dengan menggunakan [iptables](https://wiki.archlinux.org/index.php/Iptables), namun untuk user biasa seperti kita, rasanya sedikit terlalu rumit apabila menggunakan `iptables`. Kita akan menggunakan `ufw` \(_Uncomplicated Firewall_\) saja yang konfigurasinya lebih mudah.

```
$ sudo pacman -S ufw
```

Setelah selesai diinstall coba diaktifkan.

```
$ sudo ufw enable
```

Lalu buat `ufw.service` _running_ secara otomatis saat sistem start up.

```
$ sudo systemctl enable ufw.service
```

Sumber bacaan lebih lanjut dapat kalian temuka di Arch Wiki [di sini](https://wiki.archlinux.org/index.php/Uncomplicated_Firewall).

## 7.12 GUI Package Manager

Mungkin teman-teman bertanya, apakah Arch Linux mempunyai package manger yang tidak text mode namun mempunyai GUI seperti : `Synaptic` \(Ubuntu\), `Yumex-DNF` \(Fedora\), `YaST` \(OpenSUSE\), dan sebagainya. Jawabannya, tentu saja ada. Namun bukan merupakan official package dari Arch Linux, jadi kita dapat menginstallnya dari AUR \(_Arch User Repository_\).

```
$ yaourt pamac-aur
```

`pamac-aur` ini adalah sebuah aplikasi package manager yang mempunyai GUI yang dikembangkan oleh distribusi sistem operasi **Manjaro** yang juga merupakan turunan dari Arch Linux.

## 7.13 Daily Applications

<span class="font-latin">Sedang dalam proses penulisan ...</span>

# Referensi
- <https://bandithijo.github.io/arch/>