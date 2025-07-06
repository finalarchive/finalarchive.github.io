# Pengunaan Alias di Bash
 
Alias Bash adalah shortcut untuk mempermudah kita mengakses perintah terminal melalui kata yang lebih mudah diingat dan juga lebih singkat.

## Membuat Alias Bash

Pertama, buka file ~/.bashrc lalu pastika baris berikut tidak dikomentari:

```
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
```

Baris tersebut bermaksud untuk membaca file bernama `.bash_aliases`. Jika file ini ada, maka kita dapat mulai menulis alias yang diinginkan didalamnya. Jika belum ada, maka buat sebuah file bernama `~/.bash_aliases`

    nano ~/.bash_aliases

lalu tambahkan alias:

    alias alias_name="nama_perintah"

ex

    alias ll="ls -la"

Simpan lalu jalankan perintah berikut di terminal.

    source ~/.bashrc

## Membuat Bash Alias dengan Argumen (bash functions)
Terkadang Anda mungkin perlu membuat alias yang menerima satu atau lebih argumen, di situlah fungsi bash menjadi berguna.

Sintaks untuk membuat fungsi bash sangat mudah. Mereka dapat dideklarasikan dalam dua format berbeda:
```
function_name () {
  [perintah]
}
```
atau
```
function function_name {
  [perintah]
}
```
Untuk meneruskan sejumlah argumen ke fungsi bash cukup letakkan tepat setelah nama fungsi, dipisahkan dengan spasi. Parameter yang diteruskan adalah $1, $2, $3, dll, sesuai dengan posisi parameter setelah nama fungsi. Variabel $0 dicadangkan untuk nama fungsi.

Mari kita buat fungsi bash sederhana yang akan membuat direktori (dengan perintah mkdir) lalu masuk ke dalamnya (dengan perintah cd) :

    nano ~/.bashrc

```
mkcd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}
```
Sama seperti dengan alias, tambahkan fungsi ke file `~/.bashrc` dan jalankan `source ~/.bash_profile` untuk memuat ulang file.

Sekarang alih-alih menggunakan mkdir untuk membuat direktori baru dan kemudian cd untuk masuk ke direktori tersebut , cukup mengetik:

    mkcd direktori_baru

Jika Anda bertanya-tanya apa yang `--` dan `&&` lakukan di sini?, ini adalah penjelasan singkat.

* `--` – tambahan ke perintah. Misalnya, jika mencoba membuat direktori yang dimulai dengan `-` (tanda hubung), jika tanpa menggunakan `-` nama direktori akan ditafsirkan sebagai argumen perintah.
* `&&` – memastikan bahwa perintah kedua hanya berjalan jika perintah pertama berhasil.


## Referensi
* <https://www.codepolitan.com/cara-menggunakan-bash-alias-5a4d964105599>
* <https://www.linuxid.net/32839/tutorial-membuat-alias-di-bash-linux-terminal/>


















