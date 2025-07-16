#!/bin/bash
set -e  # Keluar jika terjadi error

echo "🔄 Memperbarui sistem..."
sudo apt update

echo "📦 Menginstal dependensi..."
sudo apt install -y wget gpg curl git dialog


SCRIPT_DIR="./scripts"  # Ganti sesuai kebutuhan

# Simpan list pilihan
CHOICES=$(dialog --stdout \
  --checklist "Pilih script instalasi yang ingin dijalankan:" 0 0 0 \
  $(for f in "$SCRIPT_DIR"/*.sh; do
      name=$(basename "$f")
      echo "\"$f\" \"$name\" off"
    done))

# Jika user batal atau tidak memilih apa-apa
[ $? -ne 0 ] && echo "Dibatalkan." && exit 1
[ -z "$CHOICES" ] && echo "Tidak ada yang dipilih." && exit 1

# Jalankan satu per satu
for script in $CHOICES; do
  # Hapus tanda kutip
  script=$(echo "$script" | tr -d '"')
  echo "Menjalankan: $script"
  chmod +x "$script"
  bash "$script"
done
