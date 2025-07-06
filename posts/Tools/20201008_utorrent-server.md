# uTorrent Server

## Install Dependency
Ubuntu 20.04
 ```
 Instal Dependency
 sudo apt update
 sudo apt upgrade
 sudo apt install libssl-dev
 wget https://ftp.unpad.ac.id/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.4_amd64.deb
 apt install ./libssl1.0.0_1.0.2n-1ubuntu5.4_amd64.deb
```

## Download

32-Bit

    wget http://download-hr.utorrent.com/track/beta/endpoint/utserver/os/linux-i386-ubuntu-13-04 -O utserver.tar.gz

64-Bit

    wget http://download-hr.utorrent.com/track/beta/endpoint/utserver/os/linux-x64-ubuntu-13-04 -O utserver.tar.gz

Extrak ke `/opt/`

    sudo tar xvf utserver.tar.gz -C /opt/

## Buat Server
Buat symbolic link
 
    sudo ln -s /opt/utorrent-server-alpha-v3_3/utserver /usr/bin/utserver

## Jalankan uTorren Server menggunakan perintah
 
    utserver -settingspath /opt/utorrent-server-alpha-v3_3/ -daemon

uTorrent akan listen pada 0.0.0.0:8080, -daemon akan menjalankan uTorrent di background.

## Beberapa Konfigurasi Penting
Akses ke web
```
 http://ip-torrent-server:8080/gui
 http://192.168.0.7:8080/gui
```

username **admin**
password "dikosongkan" (tanpa password)

Jika ada firewall di server Ubuntu Anda, maka Anda harus mengizinkan akses ke port 8080 dan 6881. Misalnya, jika Anda menggunakan UFW, jalankan dua perintah berikut untuk membuka port 8080 dan 6881.
 
    sudo ufw allow 8080/tcp
    sudo ufw allow 6881/tcp

**Lakukan**
* Buat folder di shell
```
 mkdir -p /home/share/bittorent/_torrents
 mkdir -p /home/share/bittorent/_actives
 chmod -Rf 777 /home/share
 chown -Rf nobody: /home/share
```
* Klik Settings (roda gigi)
* Directories<br>
    *Location of Downloaded Files<br>*
    Put new downloads in: `/home/share/bittorent/_actives` <br>
    Move completed downloads to: `/home/share/bittorent`

    *Location of .torrents<br>*
    Store .torrents in: `/home/share/bittorent/_torrents`<br>
    Move .torrents for finished jobs to: `/home/share/bittorent/_torrents`<br>
    Automatically load .torrents from: `/home/share/bittorent/_torrents`<br>

* Web UI<br>
    Authentication<br>
    username admin<br>
    password 123456789<br>

    Connectivity 9090

## Referensi
* https://www.linuxbabe.com/ubuntu/install-utorrent-ubuntu-20-04
* https://www.linuxsec.org/2019/11/cara-install-utorrent-server-di-ubuntu.html
* https://www.youtube.com/watch? KINNycq1YDA
* https://lms.onnocenter.or.id/wiki/index.php/UTorrent:_Install_di_Ubuntu_18.04

