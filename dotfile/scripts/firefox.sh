#!/bin/bash
# LABEL: Mozilla Firefox
# CATEGORY: Browser
# WAJIB: no

set -e  # Keluar jika terjadi error

echo "Menginstal Firefox..."
sudo apt install -y firefox

echo "Pemasangan selesai. Versi Firefox yang terpasang:"
firefox --version
