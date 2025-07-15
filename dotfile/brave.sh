#!/bin/bash
set -e  # Keluar jika terjadi error

echo "🔄 Memperbarui sistem..."
sudo apt update

# Menginstal Brave Browser...
echo "🔄 Menginstal Brave Browser..."
curl -fsS https://dl.brave.com/install.sh | sh

echo "✅ Instalasi Brave selesai. Jalankan Brave dengan perintah: brave-browser"