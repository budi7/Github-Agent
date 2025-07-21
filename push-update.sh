#!/bin/bash

# 1. Baca REPO_PATH dari .env
if [ ! -f .env ]; then
  echo "❌ File .env tidak ditemukan. Harap jalankan init-project.sh terlebih dahulu."
  exit 1
fi

source .env

# 2. Input identitas commit
read -p "Nama kamu (Git user.name): " git_name
read -p "Email kamu (Git user.email): " git_email

git config user.name "$git_name"
git config user.email "$git_email"

# 3. Tambah perubahan dan commit
git add .
read -p "Commit message: " commit_msg
git commit -m "$commit_msg"

# 4. Minta PAT
read -s -p "Masukkan GitHub PAT: " token
echo

# 5. Remote URL sementara
remote_url="https://$token@github.com/$REPO_PATH.git"

# 6. Push melalui remote sementara lalu hapus
git remote add temp-origin "$remote_url" 2>/dev/null
git push temp-origin main
git remote remove temp-origin

echo "✅ Perubahan berhasil di-push ke GitHub ($REPO_PATH) oleh $git_name <$git_email>."
