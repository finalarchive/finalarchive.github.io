#!/bin/bash
# LABEL: Remove Snap Packages
# CATEGORY: -
# WAJIB: no


echo "📦 Mengambil daftar semua Snap terinstal..."
snaps=$(snap list | awk 'NR>1 {print $1}')

echo "🧹 Menghapus semua Snap satu per satu..."
for snap in $snaps; do
  echo "➤ Menghapus $snap..."
  sudo snap remove --purge "$snap" || echo "⚠️ Gagal menghapus $snap atau sudah tidak ada."
done

echo "🛑 Menonaktifkan dan menghapus Snap..."
sudo systemctl stop snapd.socket snapd.service 2>/dev/null
sudo systemctl disable snapd.socket snapd.service 2>/dev/null

sudo apt purge -y snapd
sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd

echo "🚫 Mencegah Snap terinstal kembali..."
sudo mkdir -p /etc/apt/preferences.d
echo -e "Package: snapd\nPin: release a=*\nPin-Priority: -10" | sudo tee /etc/apt/preferences.d/nosnap.pref > /dev/null

echo "✅ Semua Snap telah dihapus secara dinamis dan Snap diblokir."
