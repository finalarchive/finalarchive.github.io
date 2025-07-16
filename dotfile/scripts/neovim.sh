#!/bin/bash
# LABEL: Neovim
# CATEGORY: Editor
# WAJIB: no

echo "🚀 Menghapus Neovim lama..."
sudo apt remove neovim -y

echo "⬇️  Mengunduh Neovim versi terbaru dari GitHub..."
cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc
source ~/.bashrc
nvim --version
