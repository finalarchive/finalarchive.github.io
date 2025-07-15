#!/bin/bash
set -e  # Keluar jika terjadi error

echo "🔄 Memperbarui sistem..."
sudo apt update

echo "📦 Menginstal dependensi..."
sudo apt install -y wget gpg curl git