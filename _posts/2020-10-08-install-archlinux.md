---
layout: post
title:  "Install ArchLinux"
date:   2020-11-14 10:07
categories: [linux, archlinux]
permalink: /:year/:month/:title
---

***Daftar Isi***
{: .no_toc .text-delta }

- TOC
{:toc}



## Cek Connection

  ip a

## Memilih Mirrorlist

Sinkronisasi Database 
  
    pacman -Syy

Install reflector
	
    pacman -S reflector

Pilih 5 mirror dengan kualitas kecepatan download yang bagus
```	
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

Cek
	
    cat /etc/pacman.d/mirrorlist

Sinkron Database
	
    pacman -Syy

## Buat partisi
	
cek partisi
	
    lsblk

```
NAME  MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0   7:0    0 556.2M  1 loop /run/archiso/sfs/airootfs
sda     8:0    0     8G  0 disk
sr0    11:0    1   679M  0 rom  /run/archiso/bootmnt
```

Buat partisi

	  fdisk /dev/sda

**n** → **↵** → **↵** → **↵** → **↵** → **↵** → **w**

cek hasil

	lsblk

```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0    7:0    0 556.2M  1 loop /run/archiso/sfs/airootfs
sda      8:0    0     8G  0 disk
└─sda1   8:1    0     8G  0 part
sr0     11:0    1   679M  0 rom  /run/archiso/bootmnt
```

## Format partisi
	mkfs.ext4 /dev/sda1
	lsblk

```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0    7:0    0 556.2M  1 loop /run/archiso/sfs/airootfs
sda      8:0    0     8G  0 disk
└─sda1   8:1    0     8G  0 part
sr0     11:0    1   679M  0 rom  /run/archiso/bootmnt
```

mount `/dev/sda1` ke `/mnt`
	
    mount /dev/sda1 /mnt
    lsblk

```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0    7:0    0 556.2M  1 loop /run/archiso/sfs/airootfs
sda      8:0    0     8G  0 disk
└─sda1   8:1    0     8G  0 part /mnt
sr0     11:0    1   679M  0 rom  /run/archiso/bootmnt  
```

## Install base paket dari Arch Linux dan beberapa paket pendukung
	pacstrap /mnt base linux linux-firmware vim [amd-ucode / intel-ucode]

## Mounting semua partisi yang telah dibuat secara permanen
	genfstab -U /mnt >> /mnt/etc/fstab
	cat /mnt/etc/fstab

```
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>
# /dev/sda1
UUID=8b29657e-14fd-422c-82fa-21ee1ab6614e       /               ext4            rw,relatime     0 1
```

## Beralih ke mode root untuk mengatur instalasi sistem baru
	arch-chroot /mnt

## Set Language dan Time Zone
Set Time Zone
	
    ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

Atur jam

	  hwclock --systohc --utc

Set Locale

	  vim /etc/locale.gen

Edit

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
#ia_FR UTF-8
<mark>id_ID.UTF-8 UTF-8</mark>
#id_ID ISO-8859-1
#ig_NG UTF-8
...
...
</pre>

Cek konfigurasi
	
    locale-gen

set locale yang sudah kita generet ke dalam file `/etc/locale.conf`

	locale > /etc/locale.conf

cek konfigurasi

	cat /etc/locale.conf

```
LANG=en_US.UTF-8
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES=
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=
```

## Set Hostname dan Host
Set Hostname

	  echo “arch” > /etc/hostname

set Host

	  vim /etc/host

add
```
127.0.0.1 localhost
::1       localhost
127.0.1.1 arch.localdomain arch
```

## Setting Password dan User

#### Set password root

	  passwd root

```
New password:
Retype new password:
passwd: password updated successfully
```

#### Tambah User
buat group 'sudo' terlebih dahulu

	groupadd sudo

#### Buat user
	useradd -m -g users -G sudo,storage,wheel,power,input,network final

set password user final

	passwd final

```
New password:
Retype new password:
passwd: password updated successfully
```

Setting agar user final agar memiliki kemapuan seperti superuser

	EDITOR=vim visudo

edit
<pre>
...
...
## Uncomment to allow members of group sudo to execute any command
<mark>%sudo ALL=(ALL) ALL</mark>
...
...
</pre>

## Install Paket Bootloader and Networking tools:
	pacman -S grub networkmanager network-manager-applet dialog mtools dosfstools base-devel linux-headers reflector git cups xdg-utils xdg-user-dirs


## Install boot loader GRUB
Grub Install

	grub-install --target=i386-pc /dev/sda

Grub configuration file

	grub-mkconfig -o /boot/grub/grub.cfg



## Activate servis for nex reboot

Network

	systemctl enable NetworkManager
 
Printer

	systemctl enable org.cups.cupsd

## Return to the installer, unmount all partitions and reboot
    exit
    umount -a
    reboot

## Install OpenSsh
Install Open SSH

	pacman -Sy openssh

Set password
	passwd

Start service ssh
	systemctl start sshd

akses open ssh
	ssh root@[ip addres]


## Install dan Configurasi i3wm

Install

	#sudo pacman -Sy xorg xorg-xinit i3

Copy congigurasi Xinitrc

	#sudo cp /etc/X11/xinit/xinitrc ~/.xinitrc

edit

	$vim .xinitrc

<pre>
...
...
# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

<mark>exec i3</mark>
</pre>

	  $ startx
















