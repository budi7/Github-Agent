#!/bin/bash

# 1. Inisialisasi Git repo
git init

# 2. Set identitas lokal (bukan global)
read -p "Nama kamu (Git user.name): " git_name
read -p "Email kamu (Git user.email): " git_email

git config user.name "$git_name"
git config user.email "$git_email"

# 3. Tambah semua file dan commit awal
git add .
read -p "Commit message pertama: " commit_msg
git commit -m "$commit_msg"

# 4. Minta input repo GitHub
read -p "GitHub repo (contoh: username/repo): " repo_path

# 5. Minta input PAT
read -s -p "Masukkan GitHub PAT (Personal Access Token): " token
echo

# 6. Set remote URL sementara dengan token
remote_url="https://$token@github.com/$repo_path.git"

# 7. Tambahkan remote dan push pertama kali
git remote add origin "$remote_url"
git branch -M main
git push -u origin main

# 8. Hapus remote agar token tidak tersimpan
git remote remove origin

echo "REPO_PATH=$repo_path" > .env

echo "✅ Proyek berhasil diinisialisasi dan di-push ke GitHub oleh $git_name <$git_email>."
