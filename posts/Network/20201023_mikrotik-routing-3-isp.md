# Mikrotik: Routing 3 ISP

## Intro
Berdasarkan data TOP Sites dari [ALEXA](https://www.alexa.com/topsites/countries/ID), dibawah ini adalah daftar websites yang paling banyak diakses di indonesia

![img](/img/1.jpg)

3 dari daftar website diatas adalah yang paling boros makan bandwidth termasuk teman-temannya yang lain: Instagram, TikTok, Viu, Spotify, Joox, Deezer, etc.
Pasti pusing dong mikirin penggunaan kuota yang besar. Apalagi kalo GSM. Tapi dengan adanya paket unlimited Apps dari Telkomsel,  kita dapat menekan biaya pengeluaran pembelian kuota jadi lebih murah. Nah agar lebih efektif, paket Unlimited ini akan kita kombinasikan dengan Koneksi Umum dan Koneksi Game, sehingga nantinya Koneksi Umum hanya akan melayani koneksi diluar koneksi Unlimited Apps. Jadi lebih hemat pastinya :) Doakan saja paket Unlimited Apps ini akan ada terus yaaa..

All right, study case kali ini kita akan menggunakan 3 ISP / 3 Modem, dengan rincian sbb:
* Modem 1/ISP Umum sebagai koneksi utama, 
* Modem 2/ISP Game untuk koneksi game,
* Modem 3/ISP Unlimited Apps  untuk  koneksi sosmed (Youtube, Facebook, Whatsapp, Instagram dkk)

![img](/img/2.jpg)

**Simulasi Paket** 
```
Ether1-ISPUMUM -> Kartu Byu Reguler/Unlimited
Ether2-ISPGAME -> Tsel GameMax/Tri H3ro Games/Kuota Reguler
Ether3-ISPUNLIAPPS -> Kartu Tsel Combo Sakti Unlimited Apps + Youtube
```
Contoh pembagian IP dan Gateway nya sebagai berikut:

![img](/img/3.jpg)
```
Ether1-ISPUMUM - >  IP Gateway: 192.168.4.1
Ether2-ISPGAME -> IP Gateway: 192.168.9.254
Ether3-ISPUNLIAPPS -> IP Gateway 192.168.7.254
Ether4-IP-KOMPUTER -> IP Gateway 192.168.2.1
Ether5-IP-HOTSPOT -> IP Gateway 192.168.3.1
```
Initial Configuration
Langkah pertama yang akan kita lakukan adalah, menambahkan IP LOKAL yaitu (IP LAN dan Hotspot) kedalam address list di firewall.
```
/ip firewall address-list
add address=192.168.3.0/24 list=LOKAL
add address=192.168.2.0/24 list=LOKAL
```
Sesuaikan dengan IP LOKAL Kalian masing2.

![img](/img/4.jpg)

![img](/img/5.jpg)

Setelah ditambahkan<br>
Address List Lokal

## Pemisahan Jalur Game

Untuk memisahkan jalur game kita bisa menggunakan metode matching port atau content baik di rule mangle, raw, atau pun layer7.  Kali ini kita akan menggunakan port game di table raw agar lebih ringan. Bagi yang koneksi gamenya ga dipisah jalur(cuma ada 2 modem), skip aja tahap ini langsung ke tahap 2. Pemisahan Jalur Sosmed dibawah.

### Konfigurasi RAW
Disini kita akan menambahkan port game tcp dan udp ke dalam raw, tambahkan rule baru di raw, pilih protocolnya TCP dan masukkan port game nya.
Menambahkan Port Game
Karena di field dst. port dibatasi hanya muat 15 port berbeda, maka jika kolom port penuh, silahkan copy rule yang sama dan lanjutkan isi kolom port dengan port game yang tersisa
Untuk list port game ada dibawah ini:
```
PORT GAME
---------------------
PUBG
TCP : 7889,10012,17500,18081
UDP : 8011,9030,10010-10650,11000-14000,17000,20000,20001,20002

FREE FIRE
TCP : 7006,14000,20561,39698,39779,39003
UDP : 7008,10000-10009,17000

MOBILE LEGENDS
TCP : 5500-5700,8001,30000-30300,9000-9010,30097-30147,30000-30150,9001,30101-30105,5057,5228,5001-5009,5520-5529,5551,5651,5153
UDP : 5000-5200,5500-5700,8001,30000-30300,9000-9010,5601-5602,5025,5605,5005,5503,5101-5109,5001-5009,30101,5520-5529,5020-5024,5501-5509,5517

CALL OF DUTY MOBILE
TCP : 3013,18082,65010,65050
UDP : 7500-7700,17000-20100

POINT BLANK
TCP : 39190-39200,49001-49190
UDP : 40000-40010

AOV
TCP : 10001-10094
UDP : 10101-10201,10080-10110,17000-18000

GARENA LEAGUE OF LEGEND (LOL)
TCP : 2080-2099
UDP : 5100

DOTA 2 
TCP : 9100-9200,8230-8250,8110-8120,27000-28998
UDP : 27000-28998,39000

FIFA ONLINE
TCP : 7770-7790
UDP : 16300-16350

LYTO CROSS FIRE
TCP : 10009,13008,16666,28012
UDP : 12060-12070,13000-13080

ORIGIN APEX LEGENDS
TCP: 9960-9969,1024-1124,3216,18000,18120,18060,27900,28910,29900
UDP: 1024-1124,18000,29900,37000-40000

GRAND CHASE
TCP : 9300,9400,9700
UDP : 9401,9600,16440-16450

WORLD IN AYODANCE
TCP : 52510,53100-53110,54100,55100

Clash of God
TCP : 9430-9450,5220-5230

CABAL INDONESIA
TCP : 63000-64000,38101,38110-38130

DRAGON NEST INDONESIA
TCP : 14300-15512
UDP : 15000-15500

LOST SAGA
TCP : 14000-14010
UDP : 14000-14010

SWORD OF ANGELS
TCP : 15490-15510

WARFLARE
TCP : 64990-65010

LEAGUE OF ANGELS 2
TCP : 51700-51715

Left4Dead 2 Steam
UDP : 4360-4390
```
![img](/img/6.jpg)

Jangan lupa kasih pengecualian di dst. Address List nya
Untuk source address list isi dengan LOKAL dan destination address list isi dengan pengecualian LOKAL

![img](/img/7.jpg)

Pada 

tab action pilih add dst to adress list, lalu adress listnya beri nama dengan IP-GAME

![img](/img/8.jpg)

Jangan lupa kasih comment dengan nama Game yang sesuai. misal “MOBILE LEGENDS” untuk memudahkan jika ada penambahan atau update port.

### Protocol UDP

![img](/img/9.jpg)

Sama seperti diatas, pilih protocol UDP dan masukkna port Game nya.

Di tab Advanced, tambahkan src address list LOKAL dan dst adress list dengan pengecualian LOKAL

![img](/img/10.jpg)

Pada tab Action pilih add dst to adress list, lalu adress listnya beri nama dengan IP-GAME

![img](/img/11.jpg)

Lanjutkan dengan Game yang lain, FF, COD, PUBG dkk. Kalau mau cepat copy aja rulesnya. 
Sekilas hasilnya akan seperti ini:

![img](/img/12.jpg)

### Konfigurasi Mangle
Setelah filtering ip port game masuk kedalam adress list, langkah selanjutnya adalah kita akan menandai adress list tadi ke dalam mark routing. 

Masuk ke dalam mangle, buat rule baru. chain prerouting

![img](/img/13.jpg)

Pada dst adress list pilih IP-GAME

![img](/img/14.jpg)

Actionnya pilih mark routing, 

![img](/img/15.jpg)

untuk New Routing Mark buat Routing-Game

![img](/img/16.jpg)

Jangan lupa kasih commentnya ROUTING GAME biar enak diliat.
Hasilnya akan seperti ini:

![img](/img/17.jpg)



### Konfigurasi IP Routes
Setelah menambahkan raw dan mangle, langkah terakhir adalah meroutingkan atau menambahkan ip gateway modem ke dalam ip routes, tambahkan route baru. Masukkan IP Gateway Modem (192.168.9.254) set check gatewaynya ke ping. lalu pilih routing mark: Routing-Game yang kita buat tadi. 

![img](/img/18.jpg)

Routing Game Done!

Bagi yang ga mau ribet bisa paste script dibawah ini, tinggal sesuaikan dengan nama address list Lokal kalian dan Gateway IP Modem khusus Game masing2.
```
/ip firewall raw

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting comment="MOBILE LEGENDS" dst-address-list=!LOKAL \
    dst-port=\
    30097-30147,30000-30150,30101-30106,5057,5228,5001-5009,5520-5529 \
    protocol=tcp src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting dst-address-list=!LOKAL dst-port=\
    5153,5543,5500-5700,8001,30000-30300,9000-9010,30101-30105 protocol=tcp \
    src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting dst-address-list=!LOKAL dst-port=\
    5601-5602,5025,5605,5005,5101-5109,5001-5009,30101,5520-5529,5020-5024 \
    protocol=udp src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting dst-address-list=!LOKAL dst-port=\
    5501-5509,5517,5510,5650,5000-5200,5500-5700,8001,30000-30300,9000-9010 \
    protocol=udp src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting comment=FREEFIRE dst-address-list=!LOKAL dst-port=\
    7006,39003,39698,39779,6006,7889,8001,10012,8006,9006,10006,11006,13006 \
    protocol=tcp src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting dst-address-list=!LOKAL dst-port=\
    10012,6006,6008,7008,2000,20001,10100,8008,9008,10001-10008,11008,13008 \
    protocol=udp src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting comment=PUBG dst-address-list=!LOKAL dst-port=\
    7889,10012,13004,17500,18081,20371 protocol=tcp src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting comment=COD dst-address-list=!LOKAL dst-port=\
    8013,8085,20000,3013,18082,65010,65050 protocol=tcp src-address-list=\
    LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting dst-address-list=!LOKAL dst-port=\
    7500-7700,17000-20100 protocol=udp src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting comment=AOV dst-address-list=!LOKAL dst-port=\
    10001-10094 protocol=tcp src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting dst-address-list=!LOKAL dst-port=\
    10101-10201,10080-10110,17000-18000 protocol=udp src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting comment="PORT RINGAN" dst-address-list=!LOKAL \
    dst-port="10147,10491,10010,10013,10612,20002,20001,20000,12235,13748,1397\
    2,13894,11455,10096,10039" protocol=udp src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-GAME address-list-timeout=\
    1h chain=prerouting dst-address-list=!LOKAL dst-port=\
    8011,9030,10010-10650,11000-14000,17000,10289,10451,19305 protocol=udp \
    src-address-list=LOKAL	

/ip firewall mangle	
add action=mark-routing chain=prerouting comment="ROUTING GAME" \
    dst-address-list=IP-GAME new-routing-mark=Routing-Game passthrough=yes \
    src-address-list=""	

/ip route
add check-gateway=ping distance=1 gateway=192.168.9.254 routing-mark=\
    "Routing-Game"
```



## PEMISAHAN JALUR SOSMED (YT,FB,IG,WA,DKK)

Untuk pemisahan jalur sosmed langkahnya hampir sama dengan routing game diatas, tapi kali ini kita menggunakan matcher content, kenapa ga pake layer7? biar lebih ringan aja :D 


### Konfigurasi RAW
Tambahkan rules baru, dengan chain prerouting 

![img](/img/19.jpg)

Src. Address list atur ke LOKAL, dst. Addresslist nya juga LOKAL dengan pengecualian. 

![img](/img/20.jpg)

Lalu isi content nya dengan domain dibawah ini: 

```
.youtube.com
.googlevideo.com
.ytimg.com.facebook.com
.facebook.net
.fbcdn.net
.fbsbx.com
.whatsapp.com
.whatsapp.net
.line.me
.line-scdn.net
.naver.jp
.instagram.com
.cdninstagram.com
.akamaihd.net
.tiktokv.com gunakan tiktok jika memang ada paket tiktoknya, kalo ga ntar lemot
.tiktokcdn.com
.joox.com
.spotify.com
.deezer.com
.dzcdn.net
.langitmusik.co.id
.svara.id
.suararadio.com
.svara.fm
.smule.com
.vidio.com
.viu.com
.segment.io
.wzrkt.com
.iflix.com
```

Actionnya pilih add dst adress to adress list, di adress list kasih nama dengan IP-SOSMED

![img](/img/21.jpg)

Jangan lupa kasih comment juga misal “SOSMED”

![img](/img/22.jpg)

Lanjut dengan domain content yang lain, copy aja rulenya biar cepat lalu ganti isi content nya dengan list domain diatas. Hasilnya nanti kira2 akan seperti ini:

![img](/img/23.jpg)

Setelah semuanya masuk ke adress list lanjut ke mangle.

### Konfigurasi Mangle
Masuk ke dalam mangle, buat rule baru. chain prerouting, 

![img](/img/24.jpg)

di dst adress list pilih IP-SOSMED

![img](/img/25.jpg)

Kemudian actionnya pilih mark routing, new routing mark buat Routing-Sosmed. 

![img](/img/26.jpg)

Kasih comment dengan nama Routing-Sosmed

![img](/img/27.jpg)

### Konfigurasi IP Routes
Setelah menambahkan raw dan mangle, langkah terakhir adalah menambahkan ip gateway modem ISPUNLIAPPS tadi ke dalam ip routes, tambahkan route baru, tambahkan ip gateway modemnya (192.168.7.254) set check gatewaynya ke ping. lalu pada pilihan routing mark, pilih Routing-Sosmed yang kita buat tadi. 

![img](/img/28.jpg)

Done. 

Bagi yang ga mau ribet bisa pake script dibawah ini sesuaikan dengan nama address list  Lokal dan IP Gateway Modem UnlimitedApps kalian masing2.
```
add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting comment=SOSMED content=\
    .youtube.com dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.googlevideo.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.ytimg.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.facebook.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.facebook.net \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.fbsbx.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.tiktokcdn.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.tiktokv.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.akamaihd.net \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.cdninstagram.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.instagram.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.whatsapp.net \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.whatsapp.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.fbcdn.net \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.spotify.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.deezer.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.dzcdn.net \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.langitmusik.co.id \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.suararadio.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.svara.id \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.svara.fm \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.joox.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.line.me \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.line-scdn.net \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.naver.jp \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.vidio.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.viu.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.segment.io \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.wzrkt.com \
    dst-address-list=!LOKAL src-address-list=LOKAL

add action=add-dst-to-address-list address-list=IP-SOSMED \
    address-list-timeout=12h chain=prerouting content=.iflix.com \
    dst-address-list=!LOKAL src-address-list=LOKAL	/ip firewall mangle	

add action=mark-routing chain=prerouting comment="ROUTING SOSMED" \
    dst-address-list=IP-SOSMED new-routing-mark=Routing-Sosmed passthrough=\
    yes	/ip routeadd check-gateway=ping distance=1 gateway=192.168.7.254 routing-mark=\
    "Routing-Sosmed"
```

## Setting Failover Recursive Next Hop.

Ini adalah tips tambahan, dengan metode recursive failover ini kita bisa gunakan isp umum (koneksi utama) sebagai backup jika isp game dan unlimited apps sedang down/tidak ada koneksi.

### Recursive Koneski GAME
Pertama yang harus kita lakukan adalah mengedit gateway koneksi game dengan dns yang jarang down misal DNS Cloudflare (1.1.1.1) atau Quad9 DNS (9.9.9.9), lalu arahkan target scope ke scope koneksi utama yang mau dijadikan backup.

![img](/img/29.jpg)

Disini scope koneksi utama saya adalah 30, untuk check gateway ke IP yang ingin dipantau saya tetap gunakan target scope 10

![img](/img/30.jpg)

Setelah itu tambahkan lagi ip gateway modem game tapi kali ini dst adressnya isi dengan dns cloudflare 1.1.1.1 check gateway ping distance samakan dengan gateway koneksi game diawal.

![img](/img/31.jpg)

Done. 

### Recursive Koneksi UnlimitedApps
Langkah selanjutnya yang kita lakukan adalah mengedit gateway koneksi unlimited Apps dengan DNS yang berbeda selain cloudflare tadi, misal quad9, (9.9.9.9) lalu arahkan target-scope ke scope koneksi yang mau dijadikan backup, disini saya juga pilih koneksi utama (Umum) sebagai backupnya.

![img](/img/32.jpg)

Setelah itu tambahkan lagi gateway modem unlimited Apps dengan tambahan dst adressnya dns Quad9 9.9.9.9 check gateway ping distance samakan dengan gateway koneksi unlimited apps diawal.

![img](/img/33.jpg)

Done.

Yang ga mau ribet: 
```
/ip route
add check-gateway=ping distance=1 gateway=1.1.1.1 routing-mark=Routing-Game \
    target-scope=30
add check-gateway=ping distance=1 gateway=9.9.9.9 routing-mark=Routing-Sosmed \
    target-scope=30
add check-gateway=ping distance=1 gateway=192.168.4.1
add check-gateway=ping distance=1 dst-address=1.1.1.1/32 gateway=\
    192.168.9.254
add check-gateway=ping distance=1 dst-address=9.9.9.9/32 gateway=\
    192.168.7.254
```
Sesuaikan dengan IP Gateway Modem Masing2.

Dengan cara ini kita bisa membuat failover yang bekerja tidak hanya ketika kabel putus dimakan tikus tapi ketika kuota habis atau koneksi internet kita sedang down atau rto, sehingga nantinya ketika koneksi putus,  gateway koneksi akan otomatis berpindah memanggil gateway yg lain (recursive) ke koneksi utama yang kita jadikan backup tadi.

Selamat mencoba

Thanks!

## Referensi
* <https://www.facebook.com/notes/pejuang-gsm/tutorial-routing-game-ke-isp-game-routing-yt-fb-wa-ig-viu-spotify-dkk-ke-isp-unl/348847116349713/>