#!/bin/bash

POST_DIR="./posts"
OUTPUT_FILE="README.md"

# Header awal
echo "# ARCHIVE" > "$OUTPUT_FILE"
echo "**Berikut adalah daftar semua postingan:**" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Kumpulkan semua entri dalam format: kategori|tanggal|relatif_path
entries=$(find "$POST_DIR" -type f -name "*.md" | while read -r filepath; do
  rel_path="${filepath#"$POST_DIR/"}"
  category="${rel_path%%/*}"
  filename=$(basename "$rel_path" .md)
  tanggal="${filename%%_*}"
  echo "$category|$tanggal|$rel_path"
done)

# Ambil daftar kategori unik dan urutkan alfabet
categories=$(echo "$entries" | cut -d'|' -f1 | sort -u)

# Untuk setiap kategori, ambil entri dan urutkan tanggal secara descending
while read -r category; do
  echo "" >> "$OUTPUT_FILE"
  echo "#### ${category^}" >> "$OUTPUT_FILE"
  echo "---" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"

  echo "$entries" | grep "^$category|" | sort -t'|' -k2,2r | while IFS='|' read -r _ tanggal rel_path; do
    filename=$(basename "$rel_path" .md)
    judul_raw="${filename#*_}"
    judul=$(echo "$judul_raw" | sed -r 's/[-_]/ /g' | sed -r 's/\b(.)/\u\1/g')
    echo "* $tanggal | [$judul](/posts/$rel_path)" >> "$OUTPUT_FILE"
  done
done <<< "$categories"

echo ""
echo "README.md berhasil dibuat."


# PUSH KE GITHUB
# Ambil tanggal dan jam sekarang dalam format: yyyymmdd hh:mm
commit_message=$(date +"%Y%m%d %H:%M")

# Tambahkan semua perubahan
git add .

# Commit dengan pesan waktu saat ini
git commit -m "$commit_message"

# Push ke branch main
git push origin main

