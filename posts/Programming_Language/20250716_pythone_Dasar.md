# Pytthon Dasar

## 1. Penggenalan Python

Python adalah bahasa pemrograman yang mudah dipelajari, digunakan untuk berbagai keperluan seperti pengolahan data, web, otomatisasi, dan banyak lagi.


## 2. Tipe Data pada Python

Sebelum menulis kode, penting memahami tipe data yang digunakan untuk menyimpan nilai dalam variabel.

### Tipe Data Dasar:
- **int** : Bilangan bulat  
  Contoh: `umur = 20`
- **float** : Bilangan desimal  
  Contoh: `tinggi = 170.5`
- **str** : Teks atau string  
  Contoh: `nama = "Andi"`
- **bool** : Nilai logika (True/False)  
  Contoh: `is_active = True`
- **list** : Kumpulan data dalam satu variabel  
  Contoh: `buah = ["apel", "jeruk", "mangga"]`
- **tuple** : Mirip list, tapi tidak bisa diubah  
  Contoh: `koordinat = (10, 20)`
- **dict** : Data pasangan kunci-nilai  
  Contoh: `siswa = {"nama": "Andi", "umur": 20}`

**Contoh penggunaan tipe data:**
```python
angka = 10           # int
desimal = 3.14       # float
teks = "Python"      # str
benar = True         # bool
daftar = [1, 2, 3]   # list
pasangan = (4, 5)    # tuple
data = {"a": 1, "b": 2} # dict
```


## 3. Cara Memasukkan Variabel pada Python

Variabel adalah tempat untuk menyimpan data atau nilai yang bisa digunakan dalam program. Untuk memasukkan variabel di Python, cukup tulis nama variabel diikuti tanda sama dengan (`=`) dan nilai yang ingin disimpan.

**Contoh:**
```python
nama = "Andi"      # Menyimpan teks ke variabel nama
umur = 20          # Menyimpan angka ke variabel umur
tinggi = 170.5     # Menyimpan angka desimal ke variabel tinggi
```

Kamu bisa menggunakan variabel tersebut dalam operasi atau mencetaknya:
```python
print(nama)
print("Umur saya:", umur)
print("Tinggi:", tinggi, "cm")
```

**Catatan:**
- Nama variabel tidak boleh diawali angka dan tidak boleh mengandung spasi.
- Gunakan huruf, angka, dan garis bawah (_).


## 4. Mekanisme Penulisan Script Python

- Setiap baris kode Python ditulis tanpa tanda titik koma (;) di akhir baris, kecuali jika menulis beberapa perintah dalam satu baris.
- Indentasi (spasi/tab di awal baris) sangat penting untuk menandai blok kode, seperti di dalam fungsi, perulangan, atau percabangan.
- Komentar ditulis dengan tanda pagar `#` di awal baris. Komentar tidak akan dijalankan oleh Python.

**Contoh script sederhana:**
```python
# Ini adalah komentar
nama = "Andi"
umur = 20

if umur >= 17:
    print(nama, "sudah cukup umur")
else:
    print(nama, "belum cukup umur")
```

**Tips:**
- Simpan file dengan ekstensi `.py`
- Jalankan script dengan perintah `python nama_file.py`
- Gunakan editor teks yang mendukung penyorotan sintaks Python agar lebih mudah membaca kode


## 5. Memulai Python

Setelah memahami tipe data dan variabel, kamu bisa mulai menggunakan Python dengan dua cara utama:

### a. Mode Interaktif di Terminal

Buka terminal (Linux/macOS) atau Command Prompt (Windows), lalu ketik:
```bash
python
```
Kamu akan masuk ke mode interaktif Python (ditandai dengan tanda `>>>`). Di sini kamu bisa langsung mengetik perintah Python dan melihat hasilnya.

**Contoh:**
```python
>>> print("Halo, Python!")
Halo, Python!
```

### b. Menulis Script Python

Script adalah file berisi kode Python yang disimpan dengan ekstensi `.py`. Kamu bisa menulis script menggunakan editor teks seperti VS Code, Notepad, atau nano.

**Langkah-langkah:**
1. Buat file baru, misal: `hello.py`
2. Tulis kode Python di dalamnya:
   ```python
   print("Halo, dunia!")
   ```
3. Simpan file tersebut.
4. Jalankan script lewat terminal:
   ```bash
   python hello.py
   ```


## 6. Operator pada Python

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


## 7. Penjelasan Percabangan dan Perulangan pada Python

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


## 8. Fungsi pada Python

Fungsi-fungsi pada Python adalah blok kode yang dapat digunakan berulang kali untuk melakukan tugas tertentu. Fungsi membantu membuat program lebih terstruktur, mudah dibaca, dan efisien.

### Jenis Fungsi di Python

1. **Fungsi Bawaan (Built-in Function)**
   Fungsi yang sudah tersedia di Python, seperti:
   - `print()` : Menampilkan output ke layar
   - `len()` : Menghitung jumlah elemen
   - `type()` : Menampilkan tipe data
   - `input()` : Mengambil input dari pengguna
   - `range()` : Membuat urutan angka
   - `int()`, `float()`, `str()` : Konversi tipe data

2. **Fungsi Buatan Sendiri (User-defined Function)**
   Fungsi yang dibuat sendiri sesuai kebutuhan program.
   ```python
   def sapa(nama):
       print("Halo,", nama)
   
   sapa("Andi")
   ```

3. **Fungsi dari Modul/Pustaka**
   Fungsi yang berasal dari modul eksternal, misal:
   - `math.sqrt()` : Menghitung akar kuadrat
   - `random.randint()` : Mengambil angka acak

### Cara Membuat Fungsi Sendiri

```python
def nama_fungsi(parameter):
    # blok kode
    return hasil
```

**Contoh:**
```python
def tambah(a, b):
    return a + b

hasil = tambah(3, 5)
print(hasil)  # Output: 8
```

Fungsi digunakan untuk mengelompokkan kode yang sering dipakai, sehingga program lebih rapi


## 9. Kesimpulan

- **Tipe data**: Menentukan jenis nilai yang bisa disimpan dan diolah.
- **Variabel**: Tempat menyimpan data untuk digunakan dalam program.
- **Operator**: Untuk melakukan operasi pada data.
- **Percabangan**: Untuk memilih aksi berdasarkan kondisi.
- **Perulangan**: Untuk mengulang aksi selama kondisi masih benar.
- **Fungsi**: Untuk mengelompokkan kode yang melakukan tugas tertentu.
- Dengan memahami urutan konsep di atas, kamu bisa mulai menulis program Python yang dinamis dan mampu menangani berbagai situasi secara otomatis.




