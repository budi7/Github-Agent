#!/bin/bash

# 1. Baca REPO_PATH dari .env
if [ ! -f .env ]; then
  echo "❌ File .env tidak ditemukan. Harap jalankan init-project.sh terlebih dahulu."
  exit 1
fi

source .env

# 2. Input identitas user (opsional, kalau mau tetap konsisten)
read -p "Nama kamu (Git user.name): " git_name
read -p "Email kamu (Git user.email): " git_email

git config user.name "$git_name"
git config user.email "$git_email"

# 3. Minta PAT
read -s -p "Masukkan GitHub PAT: " token
echo

# 4. Remote URL sementara
remote_url="https://$token@github.com/$REPO_PATH.git"

# 5. Tambah remote sementara dan pull
git remote add temp-origin "$remote_url" 2>/dev/null
git pull temp-origin main

# 6. Hapus remote sementara
git remote remove temp-origin

echo "✅ Perubahan berhasil di-pull dari GitHub ($REPO_PATH)."
