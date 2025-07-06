# Operator Shell

Ini disebut operator shell dan ya, ada lebih banyak dari mereka. Saya akan memberikan gambaran singkat tentang yang paling umum di antara dua kelas utama, operator kontrol dan operator pengalihan , dan bagaimana mereka bekerja sehubungan dengan bash shell.


## Kontrol operator

Dalam bahasa perintah shell, token yang melakukan fungsi kontrol.
Ini adalah salah satu dari simbol berikut:

``&   &&   (   )   ;   ;;   <newline>   |   ||`` Dan `|&` dalam bash.

Sebuah `!` adalah tidak operator control tapi Reserved Firman . Ini menjadi BUKAN [operator negasi] logis di dalam Ekspresi Aritmatika dan konstruksi uji dalam (sementara masih membutuhkan pembatas ruang).

### Daftar terminator

`;` : Akan menjalankan satu perintah setelah yang lain selesai, terlepas dari hasil yang pertama.

      command1 ; command2

Pertama command1dijalankan, di latar depan, dan setelah selesai, command2akan dijalankan.

Baris baru yang tidak dalam string literal atau setelah kata kunci tertentu tidak setara dengan operator titik koma. Daftar `;` perintah sederhana terbatas masih merupakan daftar - karena dalam parser shell masih harus terus membaca dalam perintah sederhana yang mengikuti `;` perintah sederhana terbatas sebelum dieksekusi, sedangkan baris baru dapat membatasi seluruh daftar perintah - atau daftar daftar. Perbedaannya halus, tetapi rumit: mengingat shell tidak memiliki keharusan sebelumnya untuk membaca data mengikuti baris baru, baris baru menandai titik di mana shell dapat mulai mengevaluasi perintah-perintah sederhana yang sudah dibaca, sedangkan ;semi-colon tidak tidak.

`&` : Ini akan menjalankan perintah di latar belakang, memungkinkan Anda untuk terus bekerja di shell yang sama.

      command1 & command2

Di sini, command1diluncurkan di latar belakang dan command2mulai berjalan di latar depan segera, tanpa menunggu untuk command1keluar.

Baris baru setelahnya command1 adalah opsional.

### Operator logis

`&&` : Digunakan untuk membangun DAN daftar, ini memungkinkan Anda untuk menjalankan satu perintah hanya jika yang lain berhasil keluar.

      command1 && command2

Di sini, command2akan dijalankan setelah command1selesai dan hanya jika command1berhasil (jika kode keluarnya adalah 0). Kedua perintah dijalankan di latar depan.

Perintah ini juga bisa ditulis
```
if command1
then command2
else false
fi
```
atau hanya `if command1; then command2; fi` jika status pengembalian diabaikan.

`||` : Digunakan untuk membuat daftar ATAU, ini memungkinkan Anda untuk menjalankan satu perintah hanya jika yang lain tidak berhasil.

      command1 || command2

Di sini, `command2` hanya akan berjalan jika `command1` gagal (jika mengembalikan status keluar selain 0). Kedua perintah dijalankan di latar depan.

Perintah ini juga bisa ditulis
```
if command1
then true
else command2
fi
```
atau dengan cara yang lebih pendek `if ! command1; then command2; fi`.

Perhatikan itu `&&`dan `||` asosiatif kiri; lihat diutamakan operator logika shell &&, || untuk informasi lebih lanjut.

`!`: Ini adalah kata yang dilindungi undang-undang yang bertindak sebagai operator "bukan" (tetapi harus memiliki pembatas), digunakan untuk meniadakan status pengembalian suatu perintah - mengembalikan 0 jika perintah mengembalikan status bukan nol, mengembalikan 1 jika mengembalikan status 0 Juga TIDAK logis untuk testutilitas.
```
! command1

[ ! a = a ]

Dan operator BUKAN yang sebenarnya dalam Ekspresi Aritmatika:

$ echo $((!0)) $((!23))
1 0
```
### Operator pipa

`|`: Operator pipa, meneruskan output dari satu perintah sebagai input ke yang lain. Perintah yang dibangun dari operator pipa disebut pipeline .

      command1 | command2

Output apa pun yang dicetak oleh command1diteruskan sebagai input command2.

`|&`: Ini adalah singkatan untuk 2>&1 |dalam bash dan zsh. Ini melewati standar output dan standard error dari satu perintah sebagai input ke perintah lainnya.

      command1 |& command2

### Tanda baca daftar lainnya

``;;`` digunakan hanya untuk menandai akhir dari pernyataan kasus . Ksh, bash dan zsh juga mendukung ;&untuk masuk ke kasus berikutnya dan `;;&`(tidak di ATT ksh) untuk melanjutkan dan menguji kasus-kasus berikutnya.

`(`dan `)`digunakan untuk mengelompokkan perintah dan meluncurkannya dalam subkulit. `{` dan `}` juga perintah grup, tetapi jangan meluncurkannya dalam subkulit. Lihat jawaban ini untuk diskusi tentang berbagai jenis kurung, kurung dan kurung kurawal dalam sintaksis shell.
## Operator Pengalihan

Operator Pengalihan

Dalam bahasa perintah shell, token yang melakukan fungsi pengalihan. Ini adalah salah satu dari simbol berikut:

      <     >     >|     <<     >>     <&     >&     <<-     <>

Ini memungkinkan Anda untuk mengontrol input dan output dari perintah Anda. Mereka dapat muncul di mana saja dalam perintah sederhana atau dapat mengikuti perintah. Pengalihan diproses sesuai urutan kemunculannya, dari kiri ke kanan.

* `<` : Memberikan input ke perintah.

      command < file.txt

   Di atas akan mengeksekusi commandpada isi file.txt.

* `<>`: sama seperti di atas, tetapi file terbuka dalam mode baca + tulis alih-alih hanya baca :

      command <> file.txt

  Jika file tidak ada, itu akan dibuat.

  Operator itu jarang digunakan karena perintah umumnya hanya membaca dari stdin mereka, meskipun itu bisa berguna dalam sejumlah situasi tertentu .

* `>` : Mengarahkan output perintah ke file.

            command > out.txt

  Di atas akan menyimpan output commandsebagai out.txt. Jika file ada, isinya akan ditimpa dan jika tidak ada maka akan dibuat.

  Operator ini juga sering digunakan untuk memilih apakah sesuatu harus dicetak ke kesalahan standar atau output standar :

            command >out.txt 2>error.txt

  Pada contoh di atas, >akan mengarahkan output standar dan 2>mengarahkan ulang kesalahan standar. Output juga dapat diarahkan menggunakan 1>tetapi, karena ini adalah default, 1biasanya dihilangkan dan ditulis hanya sebagai >.

  Jadi, untuk menjalankan commandpada file.txtdan menyimpan output dalam out.txtdan pesan kesalahan di error.txtAnda akan menjalankan:

      command < file.txt > out.txt 2> error.txt

* `>|`: Apakah sama dengan >, tetapi akan menimpa target, bahkan jika shell telah dikonfigurasi untuk menolak menimpa (dengan set -Catau set -o noclobber).

            command >| out.txt

  Jika out.txtada, output dari commandakan mengganti kontennya. Jika tidak ada maka akan dibuat.

* `>>`: Apakah sama dengan >, kecuali bahwa jika file target ada, data baru ditambahkan.

            command >> out.txt

  Jika out.txtada, output dari commandakan ditambahkan padanya, setelah apa pun yang sudah ada di dalamnya. Jika tidak ada maka akan dibuat.

* `&>`, `>&`, `>>&`Dan `&>>`: (non-standar). Arahkan masing-masing kesalahan standar dan output standar, menggantikan atau menambahkan.

            command &> out.txt

  Baik standard error dan output standar commandakan disimpan out.txt, menimpa isinya atau membuatnya jika tidak ada.

      command &>> out.txt

  Seperti di atas, kecuali jika out.txtada, output dan kesalahan commandakan ditambahkan padanya.

  The `&>`varian berasal bash, sedangkan `>&`varian berasal dari csh (dekade sebelumnya). Keduanya bertentangan dengan operator shell POSIX lain dan tidak boleh digunakan dalam shskrip portabel .

* `<<`: Dokumen di sini. Ini sering digunakan untuk mencetak string multi-line.

      command << WORD
            Text
      WORD

  Di sini, commandakan mengambil semuanya hingga menemukan kemunculan berikutnya WORD, Textdalam contoh di atas, sebagai input. Meskipun WORDsering EoFatau variasi daripadanya, itu bisa berupa string alfanumerik (dan bukan hanya) yang Anda suka. Ketika WORDdikutip, teks dalam dokumen di sini diperlakukan secara harfiah dan tidak ada ekspansi yang dilakukan (pada variabel misalnya). Jika tidak dikutip, variabel akan diperluas. Untuk detail lebih lanjut, lihat manual bash .

  Jika Anda ingin menyalurkan output command << WORD ... WORDlangsung ke perintah atau perintah lain, Anda harus meletakkan pipa pada baris yang sama dengan << WORD, Anda tidak dapat meletakkannya setelah KATA penghentian atau pada baris berikutnya. Sebagai contoh:
```
      command << WORD | command2 | command3...
            Text
      WORD
```
* `<<<`: Berikut string, mirip dengan dokumen di sini, tetapi dimaksudkan untuk satu baris. Ini hanya ada di port Unix atau rc (dari mana asalnya), zsh, beberapa implementasi ksh, yash dan bash.

      command <<< WORD

  Apa pun yang diberikan saat WORDdiperluas dan nilainya diteruskan sebagai input command. Ini sering digunakan untuk meneruskan konten variabel sebagai input ke perintah. Sebagai contoh:

      ```
      $ foo="bar"
      $ sed 's/a/A/' <<< "$foo"
      bAr
      # as a short-cut for the standard:
      $ printf '%s\n' "$foo" | sed 's/a/A/'
      bAr
      # or
      sed 's/a/A/' << EOF
      $foo
      EOF
      ```

Beberapa operator lain ( >&-, x>&y x<&y) dapat digunakan untuk menutup atau menggandakan deskriptor file. Untuk detailnya, silakan lihat bagian yang relevan dari manual shell Anda (di sini misalnya untuk bash).

Itu hanya mencakup operator paling umum dari kerang mirip Bourne. Beberapa shell memiliki beberapa operator pengalihan tambahan mereka sendiri.

Ksh, bash dan zsh juga memiliki konstruksi <(…), >(…)dan =(…)(yang terakhir zshhanya dalam konstruksi ). Ini bukan pengalihan, tetapi proses substitusi .


## Referensi
* <https://qastack.id/unix/159513/what-are-the-shells-control-and-redirection-operators>