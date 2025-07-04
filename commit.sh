#!/bin/bash

# Folder tempat file .md berada
POST_DIR="./post"

# File output (_sidebar.md atau daftar.md sesuai kebutuhan)
OUTPUT_FILE="_sidebar.md"

# Header opsional
echo "* [Beranda](/README.md)" > "$OUTPUT_FILE"
echo "* [Postingan]" >> "$OUTPUT_FILE"

# Loop semua file .md di folder /post
for file in "$POST_DIR"/*.md; do
  # Ambil nama file tanpa path dan ekstensi
  filename=$(basename -- "$file")
  name="${filename%.*}"

  # Ubah format nama jadi judul (underscore/strip -> spasi dan kapitalisasi awal)
  title=$(echo "$name" | sed -r 's/[-_]/ /g' | sed -r 's/\b(.)/\u\1/g')

  # Tambahkan ke file markdown
  echo "  * [$title](/post/$name)" >> "$OUTPUT_FILE"
done

echo "Sidebar berhasil dibuat ke $OUTPUT_FILE"


# PUSH KE GITHUB
# Ambil tanggal dan jam sekarang dalam format: yyyymmdd hh:mm
commit_message=$(date +"%Y%m%d %H:%M")

# Tambahkan semua perubahan
git add .

# Commit dengan pesan waktu saat ini
git commit -m "$commit_message"

# Push ke branch main
git push origin main

