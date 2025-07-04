#!/bin/bash
#!/bin/bash

# Folder tempat file .md berada
POST_DIR="./posts"
OUTPUT_FILE="README.md"

# Header awal
echo "# ARCHIVE" > "$OUTPUT_FILE"
echo "Berikut adalah daftar semua postingan yang telah saya buat:" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Ambil semua file .md, sort descending berdasarkan tanggal
find "$POST_DIR" -type f -name "*.md" | sort -r | while read -r file; do
  # Ambil nama file tanpa path dan ekstensi
  filename=$(basename -- "$file")
  name="${filename%.*}"

  # Misal: 20250704_docsify → 20250704 + docsify
  tanggal="${name%%_*}" # Ambil bagian sebelum underscore
  judul_raw="${name#*_}" # Ambil bagian setelah underscore

  # Ubah judul ke format kapital awal tiap kata
  judul=$(echo "$judul_raw" | sed -r 's/[-_]/ /g' | sed -r 's/\b(.)/\u\1/g')

  # Buat baris output
  echo "* $tanggal | [$judul](/posts/$name)" >> "$OUTPUT_FILE"
done

echo "README.md berhasil diperbarui."


# PUSH KE GITHUB
# Ambil tanggal dan jam sekarang dalam format: yyyymmdd hh:mm
commit_message=$(date +"%Y%m%d %H:%M")

# Tambahkan semua perubahan
git add .

# Commit dengan pesan waktu saat ini
git commit -m "$commit_message"

# Push ke branch main
git push origin main

