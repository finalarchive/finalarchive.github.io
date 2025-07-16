#!/bin/bash
# LABEL: Neovim_Lazy
# CATEGORY: Plugin
# WAJIB: no

echo "🚀 Mulai setup Neovim Web IDE..."

# 1. Pastikan git, curl, dan neovim terinstall
echo "📦 Memastikan dependensi terpasang..."
sudo apt update
sudo apt install -y git curl unzip build-essential

# 2. Buat file konfigurasi Neovim
echo "📦 Membuat struktur folder Neovim..."
NVIM_DIR="$HOME/.config/nvim"
mkdir -p "$NVIM_DIR/lua/core"
mkdir -p "$NVIM_DIR/lua/plugins"

echo "⚙️  Membuat file init.lua..."
cat > "$NVIM_DIR/init.lua" << 'EOF'
require("core.options")
require("core.keymaps")
require("core.lazy")
EOF

echo "⚙️  Membuat core/options.lua..."
cat > "$NVIM_DIR/lua/core/options.lua" << 'EOF'
vim.g.mapleader = " "
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.termguicolors = true
EOF

echo "⌨️  Membuat core/keymaps.lua..."
cat > "$NVIM_DIR/lua/core/keymaps.lua" << 'EOF'
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
EOF

echo "🔌 Membuat core/lazy.lua (plugin manager)..."
cat > "$NVIM_DIR/lua/core/lazy.lua" << 'EOF'
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.4", dependencies = { "nvim-lua/plenary.nvim" } },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
})

require("plugins.ui")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.treesitter")
require("plugins.telescope")
EOF

echo "🎨 Membuat plugins/ui.lua..."
cat > "$NVIM_DIR/lua/plugins/ui.lua" << 'EOF'
vim.cmd.colorscheme("catppuccin")
require("lualine").setup()
EOF

echo "🌐 Membuat plugins/lsp.lua..."
cat > "$NVIM_DIR/lua/plugins/lsp.lua" << 'EOF'
require("mason").setup()

require("mason-lspconfig").setup {
  ensure_installed = { "html", "cssls", "tsserver" }, -- tetap tsserver di sini untuk download
}

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP Setup
lspconfig.html.setup { capabilities = capabilities }
lspconfig.cssls.setup { capabilities = capabilities }
lspconfig.ts_ls.setup { capabilities = capabilities } -- GANTI dari tsserver ke ts_ls
EOF

echo "🤖 Membuat plugins/cmp.lua..."
cat > "$NVIM_DIR/lua/plugins/cmp.lua" << 'EOF'
local cmp = require("cmp")
cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
}
EOF

echo "🌈 Membuat plugins/treesitter.lua..."
cat > "$NVIM_DIR/lua/plugins/treesitter.lua" << 'EOF'
require("nvim-treesitter.configs").setup {
  ensure_installed = { "html", "css", "javascript", "lua" },
  highlight = { enable = true },
}
EOF

echo "🔍 Membuat plugins/telescope.lua..."
cat > "$NVIM_DIR/lua/plugins/telescope.lua" << 'EOF'
require("telescope").setup()
EOF

# 3. Install plugin manager Lazy.nvim
echo "🔌 Menginstall Lazy.nvim (plugin manager)..."
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/site/pack/lazy/start/lazy.nvim

echo "✅ Selesai! Silakan buka Neovim dan tunggu plugin terinstall otomatis 🎉"
