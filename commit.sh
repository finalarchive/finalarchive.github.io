#!/bin/bash

POST_DIR="./posts"
OUTPUT_FILE="README.md"

# Header awal
echo "# ARCHIVE" > "$OUTPUT_FILE"
echo "Berikut adalah daftar semua postingan yang telah saya buat:" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Ambil semua file, format: "20250704_docsify"
# Urutkan berdasarkan: tanggal descending, lalu judul ascending
find "$POST_DIR" -type f -name "*.md" | while read -r f; do
  basename "$f" .md
done | sort -k1.1,1.8r -k1.10 | while read -r name; do
  tanggal="${name%%_*}"
  judul_raw="${name#*_}"
  
  # Kapitalisasi judul
  judul=$(echo "$judul_raw" | sed -r 's/[-_]/ /g' | sed -r 's/\b(.)/\u\1/g')

  echo "* $tanggal | [$judul](/posts/$name)" >> "$OUTPUT_FILE"
done

echo "README.md berhasil dibuat dan urut berdasarkan tanggal terbaru."



# PUSH KE GITHUB
# Ambil tanggal dan jam sekarang dalam format: yyyymmdd hh:mm
commit_message=$(date +"%Y%m%d %H:%M")

# Tambahkan semua perubahan
git add .

# Commit dengan pesan waktu saat ini
git commit -m "$commit_message"

# Push ke branch main
git push origin main

