HOW TO USE
----------------------

1. cd ke root directory custom app, copykan init-project.sh dan push-update.
sh. kemudian jalankan berikut

    `sudo chown {nama user anda}:frappe init-project.sh`
   
    `sudo chown {nama user anda}:frappe push-update.sh`

3. jika sebelumnya ada inisialisasi git, jalankan perintah berikut

    `rm -rf .git`

4. apabila sudah, lakukan inisialisasi git, dengan menjalankan

    `/.init-project.sh`

5. jalankan perintah berikut untuk push ke server

    `/.push-update.sh`
