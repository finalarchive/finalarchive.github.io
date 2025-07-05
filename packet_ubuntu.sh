#!/bin/bash
set -e  # Keluar jika terjadi error
echo "🔄 Memperbarui sistem..."
sudo apt update

echo "📦 Menginstal dependensi..."
sudo apt install -y wget gpg curl git


# instalasi Visual Studio Code di Ubuntu
echo "🔑 Mengunduh dan mengatur GPG key Microsoft..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
rm packages.microsoft.gpg

echo "➕ Menambahkan repository VS Code ke sources list..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
sudo tee /etc/apt/sources.list.d/vscode.list

echo "🔄 Memperbarui daftar paket..."
sudo apt update

echo "📥 Menginstal Visual Studio Code..."
sudo apt install -y code

echo "✅ Instalasi selesai. Jalankan VS Code dengan perintah: code"
