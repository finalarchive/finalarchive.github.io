---
title:  "Directory Linux (Ubuntu)"
date:   2020-10-08 12:13
tags: [linux, ubuntu]
category: Archive
description: ""
---

***Daftar Isi***
{: .no_toc .text-delta }

- TOC
{:toc}

# Directory Ubuntu

| <center> Directory </center> | | <center> Discripsi </center> | 
| :--- | :--- | :--- |
| **/** | Directory root | Semua yang ada pada filesystem Linux berada di bawah direktori root `/`. Direktori root mirip dengan `C:\` pada filesystem Windows, tetapi tidak sama. Pada Windows, partisi `C:\` dan `D:\` lokasinya terpisah. Pada Linux, semua partisi berada di dalam satu lokasi di bawah direktori root. |
|**/bin** | Direktori Program | **Essential User Binaries** Direktori `/bin` berisi program-program penting **essential** yang dibutuhkan Sistem Operasi untuk bekerja. Aplikasi user seperti Firefox atau Music Player disimpan di direktori `/usr/bin`, sedangkan program-program penting yang dibutuhkan Sistem Operasi disimpan di direktori `/bin`. |
| **/boot** | Direktori Boot | Direktori `/boot` berisi file-file yang dibutuhkan untuk booting sistem. Contohya file bootloader GRUB dan kernel Linux **vmlinuz**. Walaupun demikian, file untuk konfigurasi bootloader berada pada direktori lain, yaitu pada `/etc` **bersama dengan file-file konfigurasi lain**.|
| **/cdrom** | Direktori CD-ROM | Direktori `/cdrom` bukanlah bagian dari standar FHS **dan sudah tidak digunakan**, tetapi masih ada di Sistem Operasi Linux. Dahulu ini adalah lokasi sementara **temporary** untuk CD/DVD yang dibaca **mount** di sistem. Lokasi standar FHS untuk CDROM berada di direktori `/media`.|
| **/dev** | Direktori File Device| Direktori `/dev` adalah direktori `spesial`, karena berisi file-file yang bukan dalam arti sebenarnya sebagai `file`. Sistem Linux menampilkan devices sebagai file, dan direktori `/dev` berisi file-file yang mewakilkan devices. Contohnya, file `sda` pada direktori `/dev` adalah file yang mewakilkan hard disk pertama pada komputer. File `sda1` mewakilkan partisi pertama pada hard disk pertama, file `sda2` mewakilkan partisi kedua pada hard disk pertama, file `sdb3` mewakilkan partisi ketiga pada hard disk kedua. Semua devices pada sistem Linux ditampilkan di direktori ini.|
|**/etc**| Direktori Konfigurasi | Direktori `/etc` berisi file-file konfigurasi sistem secara keseluruhan yang bisa dimodifikasi dengan program editor teks. Sedangkan file-file konfigurasi user berada di direktori `Home` setiap user. Ada beberapa file menarik di direktori ini :|
||*/etc/passwd* | file ini berisi informasi penting mengenai identifikasi setiap user.|
||*/etc/fstab* |file ini berisi informasi daftar devices yang terbaca **mount** pada saat booting sistem, seperti hard disk.|
||*/etc/hosts* | file ini berisi informasi hostname dan IP address jaringan yang dikenali oleh sistem layaknya file hosts pada Sistem Operasi lain.|
|| */etc/init.d* | direktori ini berisi kumpulan script yang akan dieksekusi untuk memulai berbagai system service pada saat booting.|
|**/home**|Direktori Home | Direktori `/home` berisi direktori `Home` untuk setiap user **direktori `Home` untuk setiap user memiliki path `/home/username`**. Contohnya jika username saya adalah `bonioctavianus`, maka direktori `Home` saya memiliki path `/home/bonioctavianus`. Direktori ini berisi file-file user dan file-file konfigurasi spesifik untuk user bersangkutan. Setiap user hanya memiliki akses write untuk file-file pada direktori `Home` nya masing-masing. Jika salah satu user ingin mempunyai akses write untuk direktori `Home` user lain **atau direktori root**, maka dia harus menggunakan mode root / superuser.|
|**/lib**| Direktori Libraries | Direktori ini berisi libraries yang dibutuhkan oleh program-program pada direktori `/bin` atau `/sbin`. Libraries fungsinya sama dengan file .DLL pada Sistem Operasi Windows. Libraries yang dibutuhkan oleh program-program pada direktori `/usr/bin` berada di direktori `/usr/lib`. Untuk pemahaman yang lebih detail mengenai libraries bisa dilihat di thegeekstuff.com|
|**/lost+found**| Direktori Recovery | Setiap filesystem Linux memiliki direktori `/lost+found`. Jika sistem crash, maka kegiatan cek filesystem akan dilakukan pada proses booting setelahnya. Jika terdeteksi ada file yang corrupt, maka file tersebut akan disimpan di direktori `/lost+found`. Sehingga kita bisa melakukan recovery data.|
|**/media**| Removable Media | Direktori `/media` berisi subdirectory dari removable media yang terbaca oleh sistem **mounted by system secara otomatis menggunakan mekanisme mounting yang digunakan pada distro Linux modern**. Contohnya, jika saya memasukkan CD ke DVD-Drive dan me-mount CD tersebut, maka secara otomatis akan muncul subdirectory `/Media/CD`. Saya bisa mengakses isi CD di subdirectory `/Media/CD`. Saat saya mengeluarkan **unmount** CD, maka secara otomatis subdirectory `/Media/CD`  akan hilang.<br>*Note : Mount / mounting adalah proses memasang devices tambahan pada filesystem yang sudah ada / bisa diakses. Untuk penjelasan yang lebih detail bisa dilihat di tldp.org|
|**/mnt**| Direktori Mount | Saat proses booting berlangsung, sistem membaca konfigurasi yang ada pada file `/etc/fstab`, dan kemudian menentukan devices mana saja yang akan di-mount dan pada titik mount **mount point** mana. Ini berlaku pada hard disk komputer dan juga removable devices seperti CD dan USB drive **distro Linux modern menyediakan mekanika otomatis atau automount**. Direktori `/mnt` adalah direktori dimana user me-mount devices secara sementara dengan metode manual. Devices yang membutuhkan proses mounting secara manual menggunakan direktori `/mnt`.<br> *Note : Metode mounting manual dilakukan dengan menggunakan command `mount` dan `umount`. Contoh, untuk mounting hard disk kedua pada filesystem Linux, digunakan command `mount /dev/sdb1 /mnt`. Untuk unmounting-nya digunakan command `umount /dev/sdb1 /mnt`|
|**/opt**| Direktori Optional Packages | Direktori `/opt` berisi subdirectory dari program-program yang tidak mengikuti standar filesystem FHS. Program-program ini menyimpan file-filenya di direktori `/opt/nama_program`. Biasanya program-program ini adalah program komersil / berbayar.|
|**/proc**| Direktori Kernel dan Process | Direktori `/proc` adalah direktori virtual yang mirip dengan direktori `/dev`, karena berisi file-file yang mewakili hal lain. File-file di direktori `/proc` mewakili informasi dan proses kerja sistem. Ada banyak file yang bisa ditampilkan sebagai teks, beberapa membutuhkan penggunaan mode root. Contohnya file `cpuinfo` yang menampilkan informasi mengenai CPU. Untuk melihatnya dengan program less, eksekusi command `sudo less /proc/cpuinfo`.|
|**/root**| Direktori `Home` Root | Direktori `/root` adalah direktori `Home` untuk root / superuser. Walaupun adalah direktori `Home`, path nya bukan di `/home/root` melainkan di `/root`. Jangan lupa kalau direktori `/root` berbeda dengan direktori `/`.|
|**/run**| Direktori File Status Aplikasi | Direktori `/run` merupakan direktori yang baru dibuat. Direktori ini menjadi standar untuk penyimpanan file-file sementara **temporary** aplikasi yang dibutuhkan saat bekerja seperti sockets dan process ID. File-file ini tidak bisa disimpan di direktori `/tmp` karena file pada `/tmp` bisa terhapus.|
|**/sbin**| Direktori Program Sistem Administrasi | Direktori `/sbin` mirip dengan direktori `/bin`. Direktori ini berisi program-program yang hanya bisa dijalankan dalam mode root untuk kepentingan sistem administrasi.|
|**/tmp**| Direktori Temporary | Direktori `/tmp` adalah direktori tempat aplikasi menyimpan file-filenya secara sementara. File-file ini akan dihapus secara otomatis setiap kali sistem melakukan reboot. Dan juga bisa dihapus kapan saja oleh user.|
|**/usr**| Direktori User | Direktori `/usr` berisi aplikasi dan file yang digunakan oleh user **berbeda dengan aplikasi dan file yang digunakan oleh sistem**. Contohnya aplikasi yang non–essential disimpan di direktori `/usr/bin`.  Program sistem administrasi yang non-essential disimpan di direktori `/usr/sbin`. Libraries untuk setiap user berada di direktori `/usr/lib`. Dan Ada beberapa subdirectory lainnya pada direktori `/usr`, seperti konfigurasi graphics seperti themes pada `/usr/share`.|
|| */usr/share/X11* | Berisi file-file untuk support sistem `X Window`.|
|| */usr/share/dict* | Berisi file-file kamus untuk fungsi spelling checker. Gunakan program `look` dan `aspell`.|
|| */usr/share/doc* | Berisi file-file dokumentasi dalam berbagai format|
|| */usr/share/man* | Berisi file-file manual Linux|
|| */usr/local* | Direktori Aplikasi Lokal|
|||Direktori ini dan subdirectory-nya digunakan untuk file-file aplikasi yang tidak termasuk dalam paket resmi aplikasi distro Linux yang digunakan yang berada di direktori `/usr/bin`. Ketika kita ingin menginstall aplikasi, maka lebih baik menggunakan direktori `/usr/local/bin`.<br> *Note : File source code Kernel Linux berada di direktori `/usr/src`|
|**/var**| Direktori Variable Data Files | Direktori `/var` adalah direktori yang file-file didalamnya berubah / berganti saat sistem bekerja. Ada beberapa subdirectory di dalamnya, salah satunya `/var/log` yang berisi file-file log sistem. Ada baiknya secara berkala mengecek direktori ini untuk memeriksa kondisi sistem.|

# Directory Menarik

| <center>Directory</center> | <center>Discripsi</center> |
| :--- | :--- |
|**/boot/vmlinuz** | File Kernel Linux.|
|**/dev/hda** | File device untuk IDE HDD **Hard Disk Drive** yang pertama.|
|**/dev/hdc** | File device untuk IDE Cdrom.|
|**/dev/null** | Sebuah perangkat semu, yang tidak ada apa – apa. Kadang keluaran sampah diarahkan ke /dev/null, sehingga akan hilang selamanya. |
|**/etc/bashrc** | Mengandung default sistem dan alias digunakan oleh shell bash.|
|**/etc/crontab**   | Sebuah script shell untuk menjalankan perintah tertentu pada interval waktu yang telah ditetapkan.|
|**/etc/exports**   | Informasi dari sistem file yang tersedia pada jaringan.|
|**/etc/fstab**  | Informasi Disk Drive dan mount point nya.|
|**/etc/group** | Informasi security group.|
|**/etc/grub.conf** | file konfigurasi grub bootloader.|
|**/etc/init.d** | Layanan Script startup.|
|**/etc/lilo.conf**| file konfigurasi bootloader lilo.|
|**/etc/hosts**| Informasi alamat Ip dan nama host yang sesuai.|
|**/etc/hosts.allow** | Daftar host yang diperbolehkan untuk mengakses layanan pada mesin lokal.|
|**/etc/host.deny**  | Daftar host yang ditolak untuk mengakses layanan pada mesin lokal.|
|**/etc/inittab**     | proses INIT dan interaksinya di berbagai tingkat run.|
|**/etc/issue**  | Memungkinkan untuk mengedit pesan pra-login.|
|**/etc/modules.conf**| file konfigurasi untuk modul sistem.|
|**/etc/motd**| Tempat motd untuk Pesan Of The Day, pesan yang didapat para pengguna setelah login.|
|**/etc/passwd** | Mengandung password pengguna sistem dalam file shadow, implementasi keamanan.|
|**/etc/printcap**  | Informasi printer.|
|**/etc/profile**   | default shell Bash.|
|**/etc/profile.d**   | Aplikasi skrip, dieksekusi setelah login.|
|**/etc/rc.d**   | Informasi tentang script khusus tingkat run.|
|**/etc/rc.d/init.d**| Script instalasi tingkat run.|
|**/etc/resolv.conf**| Domain Name Servers **DNS** biasa digunakan oleh system.|
|**/etc/securetty**  | List terminal, dimana root login.|
|**/etc/skel**  | Script yang Mempopulasikan direktori home user baru.|
|**/etc/termcap**  | Sebuah file ASCII yang mendefinisikan perilaku Terminal, konsol dan printer.|
|**/etc/X11**   | file Konfigurasi sistem X-Windows.|
|**/usr/bin**   | Perintah eksekusi user normal.|
|**/usr/bin/X11**  | Binari sistem X-Windows.|
|**/usr/include**  | Berisi file yang digunakan oleh program ‘c’.|
|**/usr/share**   | Direktori file bersama, Info file, dll.|
|**/usr/lib**   | File library yang dibutuhkan selama kompilasi Program.|
|**/usr/sbin** | Perintah untuk Super User, untuk administrator system.|
|**/proc/cpuinfo**| Informasi CPU.|
|**/proc/filesystems**| Informasi file system yang digunakan saat ini.|
|**/proc/interrupts**| Informasi tentang interupsi saat sedang digunakan saat ini.|
|**/proc/ioports**| Berisi semua alamat Input / Output yang digunakan oleh perangkat pada server.|
|**/proc/meminfo**| Informasi penggunaan memori.|
|**/proc/modules**| Saat menggunakan modul kernel.|
|**/proc/mount**| Informasi file system yang di-mount.|
|**/proc/Stat** | Statistik Detil Sistem saat ini.|
|**/proc/swaps** | Informasi file swap.|
|**/version**| Informasi versi linux.
|**/var/log/lastlog** | log proses boot terakhir.|
|**/var/log/messages** | log pesan yang dihasilkan oleh daemon syslog pada boot.|
|**/var/log/wtmp** | Daftar waktu login dan durasi setiap pengguna pada sistem saat ini.|

# Directory Yang Sering di Akses

| <center>Directory</center> | <center>Discripsi</center> |
| :--- | :--- |
| /usr/local/src/ | tempat file-file aplikasi yang tidak termasuk dalam paket resmi aplikasi distro Linux atau hasil download |
| /usr/local/bin | tempat aplikasi aplikasi yang tidak termasuk dalam paket resmi aplikasi distro Linux atau hasil download |


# Referensi
* https://coolnetkid.wordpress.com/2014/05/06/linux-struktur-direktori/
* http://www.pintarkomputer.com/struktur-direktori-dan-lokasi-file-file-penting-dalam-linux/
