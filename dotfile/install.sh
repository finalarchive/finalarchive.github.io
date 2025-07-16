#!/bin/bash
set -e  # Keluar jika terjadi error

echo -e "\e[44;97m🔄 Memperbarui sistem...\e[0m"
sudo apt update
sudo apt install -y dialog

SCRIPT_DIR="./scripts"

echo "🔐 Memberi hak eksekusi ke semua script di $SCRIPT_DIR..."
chmod +x "$SCRIPT_DIR"/*.sh

declare -A CATEGORY_LABEL_MAP
declare -A LABEL_PATH_MAP
declare -A LABEL_WAJIB_MAP
ALL_LABELS=()
WAJIB_LABELS=()

# Baca metadata dari setiap file
for f in "$SCRIPT_DIR"/*.sh; do
    label=$(grep '^# LABEL:' "$f" | head -n1 | cut -d':' -f2- | xargs)
    category=$(grep '^# CATEGORY:' "$f" | head -n1 | cut -d':' -f2- | xargs)
    wajib=$(grep '^# WAJIB:' "$f" | head -n1 | cut -d':' -f2- | tr '[:upper:]' '[:lower:]' | xargs)

    [ -z "$label" ] && label=$(basename "$f")
    [ -z "$category" ] && category="Lainnya"
    [ -z "$wajib" ] && wajib="no"

    CATEGORY_LABEL_MAP["$category"]+="$label"$'\n'
    LABEL_PATH_MAP["$label"]="$f"
    LABEL_WAJIB_MAP["$label"]="$wajib"
    ALL_LABELS+=("$label")

    if [[ "$wajib" == "yes" ]]; then
        WAJIB_LABELS+=("$label")
    fi
done

# Urutkan berdasarkan kategori dan label
SORTED_OPTIONS=()
for category in $(printf "%s\n" "${!CATEGORY_LABEL_MAP[@]}" | sort); do
    labels=$(echo "${CATEGORY_LABEL_MAP[$category]}" | sort)
    while IFS= read -r label; do
        [ -z "$label" ] && continue
        if [[ "${LABEL_WAJIB_MAP[$label]}" == "yes" ]]; then
            SORTED_OPTIONS+=("$label" "$category (WAJIB)" "on")
        else
            SORTED_OPTIONS+=("$label" "$category" "off")
        fi
    done <<< "$labels"
done

# Tampilkan dialog checklist
CHOICES=$(dialog --stdout \
  --checklist "Pilih script instalasi yang ingin dijalankan:\n(Script WAJIB akan dijalankan terlebih dahulu walau tidak dicentang)" 0 0 0 \
  "${SORTED_OPTIONS[@]}")

# Batalkan
[ $? -ne 0 ] && echo "❌ Dibatalkan oleh pengguna." && exit 1

# Jalankan semua yang WAJIB terlebih dahulu
for label in "${WAJIB_LABELS[@]}"; do
    script="${LABEL_PATH_MAP[$label]}"
    echo "🚀 Menjalankan WAJIB: $label"
    bash "$script"
done

# Jalankan yang dipilih di dialog, kecuali yang sudah WAJIB (untuk mencegah duplikat)
for label in $CHOICES; do
    label=$(echo "$label" | tr -d '"')
    if [[ "${LABEL_WAJIB_MAP[$label]}" != "yes" ]]; then
        script="${LABEL_PATH_MAP[$label]}"
        echo "➡️  Menjalankan: $label"
        bash "$script"
    fi
done
