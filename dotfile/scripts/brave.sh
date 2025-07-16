#!/bin/bash
# LABEL: Brave
# CATEGORY: Browser
# WAJIB: no

set -e  # Keluar jika terjadi error

# Menginstal Brave Browser...
echo "🔄 Menginstal Brave Browser..."
curl -fsS https://dl.brave.com/install.sh | sh

echo "✅ Instalasi Brave selesai. Jalankan Brave dengan perintah: brave-browser"