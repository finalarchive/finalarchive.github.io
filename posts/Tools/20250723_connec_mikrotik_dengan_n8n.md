## Setting Mikrotik
Persyaran

Harus menggunakan router OS 7.1+
Aktifkan www port 80 (http)

## ✅ Langkah Implementasi di n8n
ada dua opsi cara menghubungkan Mikrotik dengan n8n
1. Mengunakan Rest API (remcomand)
2. mengunakan SSH `n8n-nodes-sshv2`

pada kesembapatan ini kita akan mengunakan REST API karena
REST API:

🔐 Data langsung JSON (gampang diproses)

💾 Response terstruktur

📡 Tidak butuh parsing string

🧱 Built-in di RouterOS 7+

Sementara SSH CLI:

🔍 Output-nya text biasa, perlu di-parse

🧨 Rentan error parsing kalau format berubah

💣 Tidak semua MikroTik command bisa di-script-kan dengan rapi via SSH

### 🔧 Tambahkan Node HTTP Request
Tambahkan node baru: HTTP Request

Konfigurasikan seperti ini:

🧩 Method:
`GET, POST, PUT,` atau `DELETE` (tergantung endpoint)

🌐 URL:
Misalnya:

```ruby
http://192.168.88.1/rest/ip/address
```

🔐 Authentication:
Pilih `Basic Auth`, lalu isi:

Username: `admin (atau user lain)`

Password: `sesuai`