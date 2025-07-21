#!/bin/bash

# Pastikan identitas commit di-set secara lokal
read -p "Nama kamu (Git user.name): " git_name
read -p "Email kamu (Git user.email): " git_email

git config user.name "$git_name"
git config user.email "$git_email"

# Tambah perubahan dan commit
git add .
read -p "Commit message: " commit_msg
git commit -m "$commit_msg"

# Minta input repo GitHub
read -p "GitHub repo (contoh: username/repo): " repo_path

# Minta PAT
read -s -p "Masukkan GitHub PAT: " token
echo

# Remote URL sementara
remote_url="https://$token@github.com/$repo_path.git"

# Tambahkan remote, push, lalu hapus remote agar token tidak tersimpan
git remote add origin "$remote_url" 2>/dev/null
git push origin main
git remote remove origin

echo "✅ Perubahan berhasil di-push ke GitHub oleh $git_name <$git_email>."
