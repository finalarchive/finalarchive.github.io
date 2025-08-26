
# Dokumentasi REST API MikroTik (Versi Indonesia)

Diterjemahkan dari dokumentasi resmi MikroTik, disusun agar lebih mudah dipahami.

## Ringkasan (Overview)
REST API adalah antarmuka untuk mengakses RouterOS lewat protokol **HTTP/HTTPS** dengan format **JSON**.  
Mulai RouterOS v7.1beta4, API ini hadir sebagai pembungkus JSON dari Console API. Dengan REST API kita bisa:
- Membuat (Create)
- Membaca (Read)
- Memperbarui (Update)
- Menghapus (Delete)
- Menjalankan perintah konsol

### Akses REST API
- Jika service **www-ssl** aktif → akses via: `https://<IP-Router>/rest`
- Jika service **www** aktif (mulai v7.9) → akses via: `http://<IP-Router>/rest` (⚠️ tidak aman, hanya untuk uji coba).

**Catatan:** Jangan gunakan HTTP di produksi, karena user & password bisa disadap.

### Alat yang bisa digunakan:
- `curl`
- `wget`
- `fetch` bawaan RouterOS

## Autentikasi (Authentication)
- Gunakan **HTTP Basic Auth**
- Username & password sama dengan login CLI (default: `admin`, tanpa password)
- Jika pakai HTTPS dengan sertifikat self-signed:
  - Import sertifikat ke root CA
  - Untuk uji coba bisa gunakan: `curl -k` atau `wget --no-check-certificate`

## Format JSON
- Semua nilai dikembalikan dalam bentuk **string** (walau aslinya angka/boolean).
- Angka bisa dalam format:
  - Octal (awalan `0`)
  - Hexadecimal (awalan `0x`)
  - Decimal (default)
- **Exponent** tidak didukung.

## HTTP Methods

| Metode | Fungsi | CLI Setara | Keterangan |
|--------|--------|------------|------------|
| GET    | Baca data | `print`  | Mengambil data/record |
| PATCH  | Update data | `set` | Ubah data tertentu |
| PUT    | Tambah data | `add` | Buat record baru |
| DELETE | Hapus data | `remove` | Hapus record |
| POST   | Jalankan command | semua perintah CLI | Akses penuh ke semua perintah |

## GET
- Untuk melihat semua data di menu tertentu.  
Contoh: melihat daftar IP Address (setara `ip/address/print`):

```bash
curl -k -u admin: https://10.155.101.214/rest/ip/address
```

- Untuk lihat 1 record pakai `.id`:
```bash
curl -k -u admin: https://10.155.101.214/rest/ip/address/*1
```

- Bisa juga pakai **nama interface**:
```bash
curl -k -u admin: https://10.155.101.214/rest/interface/ether1
```

- Mendukung **filter**:
```bash
curl -k -u admin: "https://10.155.101.214/rest/ip/address?network=10.155.101.0&dynamic=true"
```

- Menampilkan hanya properti tertentu dengan `.proplist`:
```bash
curl -k -u admin: https://10.155.101.214/rest/ip/address?.proplist=address,disabled
```

## PATCH
Update record tertentu dengan JSON body.

Contoh menambahkan komentar pada IP:
```bash
curl -k -u admin: -X PATCH https://10.155.101.214/rest/ip/address/*3   
--data '{"comment": "test"}' 
-H "content-type: application/json"
```

## PUT
Tambah record baru.  
Contoh menambahkan IP ke interface `dummy`:

```bash
curl -k -u admin: -X PUT https://10.155.101.214/rest/ip/address   
--data '{"address": "192.168.111.111", "interface": "dummy"}' 
-H "content-type: application/json"
```

## DELETE
Menghapus record berdasarkan `.id`.

```bash
curl -k -u admin: -X DELETE https://10.155.101.214/rest/ip/address/*9
```

Jika dihapus lagi → akan muncul error `404 Not Found`.

## POST
Metode universal untuk menjalankan command RouterOS.  
Contoh ganti password user aktif:

```bash
POST https://router/rest/password
{"old-password":"old","new-password":"N3w", "confirm-new-password":"N3w"}
```

Respon REST mengikuti format API RouterOS:
- `!re` → daftar object
- `!done` → object tunggal
- Kosong → list kosong

### `.proplist`
Batasi properti yang ditampilkan:
```bash
POST https://router/rest/interface/print
{".proplist":["name","type"]}
```

### `.query`
Filter data menggunakan kondisi:
```bash
POST https://router/rest/interface/print
{".query":["type=ether","type=vlan","#|!"]}
```

Gabungan query + proplist:
```bash
POST https://router/rest/ip/address/print   
--data '{".proplist": [".id","address","interface"], ".query": ["network=192.168.111.111","dynamic=true","#|"]}'
```

## Timeout
- Default timeout = **60 detik**
- Jika command jalan terus (misal `ping` tanpa batas), koneksi akan diputus dengan error.

Solusi: batasi command dengan parameter.  
Contoh `ping` hanya 4 kali:
```bash
curl -k -u admin: -X POST https://10.155.101.214/rest/ping   
--data '{"address":"10.155.101.1","count":"4"}'
```

## Errors
- Indikasi error lewat HTTP status code (>=400)
- Body berisi JSON detail error.  
Contoh hapus interface:
```json
{"error":406,"message":"Not Acceptable","detail":"no such command or directory (remove)"}
```

## Contoh Perintah (Examples)

### Membuat log entry
```bash
curl -k -u <username>:<password> -X POST http://<ip-address>/rest/execute   
--data '{"script":"/log/info test"}' 
-H "content-type: application/json"
```

### Jalankan script
```bash
curl -k -u <username>:<password> https://<ip-address>/rest/system/script/run   
--data '{".id":"*1"}' 
-H "content-type: application/json"
```

### Monitor LTE sekali jalan
```bash
curl -k -u <username>:<password> https://<ip-address>/rest/interface/lte/monitor   
-d '{"numbers":"0", "once":""}' 
-H "content-type: application/json"
```

### Monitor WiFi sekali jalan
```bash
curl -k -u <username>:<password> -X POST "http://<ip-address>/rest/interface/wifi/monitor"   
-H "Content-Type: application/json" 
-d '{ "numbers": "wifi1", "once":"" }'
```

### Export konfigurasi
```bash
curl -k -u <username>:<password> https://<ip-address>/rest/export   
--data '{"compact":"","file":"test.rsc"}' 
-H "content-type: application/json"
```

### Pindah posisi firewall rule
```bash
curl -k -u <username>:<password> -X POST http://<ip-address>/rest/ip/firewall/nat/move   
--data '{".id":"*9",".id":"*C"}' 
-H "content-type: application/json"
```

### Update firmware LTE
```bash
curl -k -u <username>:<password> -X POST 'http://<ip-address>/rest/interface/lte/firmware-upgrade'   
--data '{"number":"lte2"}' 
-H "content-type: application/json"
```

### Ambil OID dari /system resource
```bash
curl -k -u <username>:<password> -X POST http://<ip-address>/rest/system/resource/print   
--data '{"oid":""}' 
-H "content-type: application/json"
```

### Gunakan fetch untuk jalankan REST API ke Router lain
```bash
/tool fetch http-method=post url="http://<ip-address>/rest/execute"
http-data="{\"script\":\"/log info fetchtest\"}"
http-header-field="Content-Type:application/json"
output=user user=<username> password=<password>
```

## Catatan Penting
- Tidak ada perintah "monitor" terus-menerus via REST. Gunakan parameter `once`.
- REST API cocok untuk **otomatisasi, integrasi, dan monitoring** lewat HTTP/JSON.
