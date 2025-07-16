## Operator pada Python

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

## Penjelasan Percabangan dan Perulangan pada Python

### Percabangan
Percabangan adalah fitur dalam pemrograman yang memungkinkan program memilih satu dari beberapa aksi berdasarkan kondisi tertentu. Dengan percabangan, program bisa "memutuskan" apa yang harus dilakukan sesuai situasi.

**Contoh sederhana:**
```python
umur = 18
if umur >= 17:
    print("Boleh membuat KTP")
else:
    print("Belum boleh membuat KTP")
```
Pada contoh di atas, jika nilai `umur` lebih dari atau sama dengan 17, maka program akan mencetak "Boleh membuat KTP". Jika tidak, akan mencetak "Belum boleh membuat KTP".

**Percabangan lebih dari dua kondisi:**
```python
nilai = 70
if nilai >= 85:
    print("Sangat Baik")
elif nilai >= 75:
    print("Baik")
elif nilai >= 65:
    print("Cukup")
else:
    print("Kurang")
```
Program akan memeriksa setiap kondisi secara berurutan dan menjalankan aksi yang sesuai.

### Perulangan
Perulangan adalah fitur yang memungkinkan program menjalankan kode yang sama berulang kali selama kondisi tertentu masih terpenuhi. Perulangan sangat berguna untuk mengolah data yang banyak atau melakukan tugas berulang.

**Contoh perulangan for:**
```python
for i in range(3):
    print("Halo!", i)
```
Kode di atas akan mencetak "Halo!" sebanyak 3 kali, dengan angka 0, 1, dan 2.

**Contoh perulangan while:**
```python
count = 1
while count <= 3:
    print("Hitungan:", count)
    count += 1
```
Kode di atas akan mencetak "Hitungan:" dari 1 sampai 3.

### Kesimpulan
- **Percabangan**: Untuk memilih aksi berdasarkan kondisi (misal: jika hujan, bawa payung).
- **Perulangan**: Untuk mengulang aksi selama kondisi masih benar (misal: menghitung dari 1 sampai 10).

Dengan percabangan dan perulangan, program bisa menjadi lebih dinamis dan mampu menangani berbagai situasi



