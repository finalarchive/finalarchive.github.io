# Install ArchLinux

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
	pacstrap /mnt base linux linux-firmware vim sudo [amd-ucode / intel-ucode]

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

## Aktifkan dukungan 32 bit Architecture
	sudo vim /etc/pacman.conf

edit

<pre>
...
...
#[multilib-testing]
#Include = /etc/pacman.d/mirrorlist
<mark>
[multilib]
Include = /etc/pacman.d/mirrorlist
</mark>
# An example of a custom package repository.  See the pacman manpage for
# tips on creating your own repositories.
...
...
</pre>

## Install Package Manager AUR Yay (Yet another Yaourt)
	cd /home/final/Downloads/
	pacman -Syy
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	
## install grafhic Card Driver
#### Mesa Driver
Paket yang menyediakan dukungan terhadap DRI (Direct Reading Infrastructur) driver untuk akselerasi gambar 3D

	sudo pacman -S mesa

#### DDX Driver (xf86-vidio)
dukungan terhadap DDX driver (yang menyediakan akselarasi gambar 2D pada Xorg)

	pacman -S xf86-video-intel

## Setting Terminal
#### Install ST sttruck
install Emulator Terimanl

	yay -Sy st

#### Install ZSH Shell
Referensi : <https://computingforgeeks.com/installingconfiguring-and-customizing-zsh-on-linux/>

Install Shell

cek Shell Defaul
		
	$ echo $SHELL
	/bin/bash

Secara defaul shell bawaan adalah bash shell

install ZSH Shell

	sudo pacman -S zsh zsh-completions

buat ZHS Shell menjadi defaul Shell

	chsh -s /usr/bin/zsh

restar shell

	exec $SHELL

untuk dapat memanggil program-program yang baru saja di install atau di update kita perlu melakukan restar terminal

pindahkan pengaturan shell ~/.bashrc ke dalam ~/.zshrc

	vim ~/.zshrc
edit

	# PKGBUILD YAOURT
	export VISUAL="vim"

save and exit

##### Install Oh My Zsh
	sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

seteh install akan ada pilihan tema yang terletak di `~/.oh-my-zsh/themes/`

Terdapat juga direktori plugin untuk melihat semua plugin yang tersedia `ls -lh ~/.oh-my-zsh/plugins`

##### Install Oh My Zsh themes for Zsh
kita akan memasang tema `honukai.zsh-theme` di `~/.oh-my-zsh/themes/` dan mengcofigurasinnya di `.zshrc`

	cd /home/final/Downloads
	git clone https://github.com/oskarkrawczyk/honukai-iterm-zsh.git
	cp honukai-iterm-zsh/honukai.zsh-theme ~/.oh-my-zsh/themes/

midifiy variabel theme

	vim ~/.zshrc

edit
	
	ZSH_THEME=”honukai”

reload config

	source ~/.zshrc



















