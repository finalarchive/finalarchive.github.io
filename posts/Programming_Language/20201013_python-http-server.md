# Http Server Transfer File Linux - Android

## Cek IP
   
    ifconfig | more
   
## Buat Server
pindah ke directory yang akan di jadikan server

    cd /home/user/

Python 2

    python -m SimpleHTTPServer 8000
 
Python 3

    python3 -m http.server 8000
   
## Penggunaan
  
    http://[IP SERVER]:8000

ex

    http://192.168.100.1:8000
   
## Referensi
 * <https://docs.python.org/2/library/simplehttpserver.html>

# Operator pada Python

Operator adalah simbol yang digunakan untuk melakukan operasi pada nilai atau variabel. Berikut jenis-jenis operator di Python:

### Operator Aritmatika
- `+` : Penjumlahan
- `-` : Pengurangan
- `*` : Perkalian
- `/` : Pembagian
- `//` : Pembagian bulat
- `%` : Modulus (sisa bagi)
- `**` : Pangkat

### Operator Perbandingan
- `==` : Sama dengan
- `!=` : Tidak sama dengan
- `>` : Lebih besar
- `<` : Lebih kecil
- `>=` : Lebih besar atau sama dengan
- `<=` : Lebih kecil atau sama dengan

### Operator Logika
- `and` : Dan
- `or` : Atau
- `not` : Tidak

### Operator Penugasan
- `=` : Penugasan
- `+=`, `-=`, `*=`, `/=`, dll : Penugasan dengan operasi

### Operator Bitwise
- `&` : AND
- `|` : OR
- `^` : XOR
- `~` : NOT
- `<<` : Geser kiri
- `>>` : Geser kanan

### Operator Keanggotaan
- `in`
- `not in`

### Operator Identitas
- `is`
- `is not`
