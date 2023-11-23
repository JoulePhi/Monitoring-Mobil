# Aplikasi montitoring kendaraan

Technologies :

-   Laravel 10
-   Vue Js 3
-   Inertia Js
-   Tailwind CSS
-   MySQL 8.1
-   PHP 8.1

Users:

Admin :

-   email: admin@mail.com
-   pass : bandung

Atasan / Approval :

-   email: atasan1@mail.com pass: bandung
-   email: atasan2@mail.com pass: bandung
-   email: atasan3@mail.com pass: bandung
-   email: atasan4@mail.com pass: bandung

# Instalasi

1. clone repository ini
2. jalankan composer install / composer update
3. buat .env file yang isinya diambil dari .env.example dan sesuaikan
4. sesuaikan nama database dan user di .env
5. import file test_sekawan.sql ke database
6. jalankan php artisan key:generate
7. jalankan npm i
8. jalankan npm run dev
9. jalankan php artisan serve
10. Buka di browser
11. done

## Cara penggunaan

1.  Login menggunakan akun users, bisa sebagai admin atau sebagai atasan/approvals
    ![Login](https://firebasestorage.googleapis.com/v0/b/itsmejoule.appspot.com/o/sekawan%2FLogin%20-%20Laravel.png?alt=media&token=108e6e55-8921-4c1a-a2fe-39b320f6aa7c)

2.  Jika login sebagai admin maka sidebar akan menampilkan menu "Reservation"

![Reservation](https://firebasestorage.googleapis.com/v0/b/itsmejoule.appspot.com/o/sekawan%2FReservation%20-%20Laravel.png?alt=media&token=12e377bc-e007-4bba-b023-5c9c1380edcd)

Di menu ini admin adapat memesankan kendaraan dengan cara:

1. Pilih user yang mau memesan kendaraan
2. Pilih kendaraan yang akan dipesan, (Jika kendaraan sudah dipesan user lain, maka kendaraan tidak bisa di pakai lagi hingga pesanan selesai)
3. Pilih driver(Jika driver sudah dipesan user lain, maka driver tidak bisa di pakai lagi hingga pesanan selesai)
4. Pilih pihak yang akan menyetujui peminjaman, penyetuju tidak bisa sama
5. Klik "Reserve"

6. Jika berhasil maka list pemesanan berada di bawah
   ![Reservation](<https://firebasestorage.googleapis.com/v0/b/itsmejoule.appspot.com/o/sekawan%2FReservation%20-%20Laravel%20(1).png?alt=media&token=347b5306-a034-4692-b67d-b5a00e66f20b>)

7. Di list pemesanan ini admin dapat melihat detail dari pemesanan yang sudah dibuat, selain itu jika pemesanan sudah selesai admin dapat mengklik button done, kemudian mobil dan driver yang tadi dipesan sudah dapat di pesan lagi.

8. Admin juga dapat mengeksport laporan periodik pemesanan dalam bentuk excel file di list pemesanan ini dengan mengklik tombol eksport

9. Status peminjaman akan berstatus "APPROVED" apabila 2 pihak penyetuju sudah menyetujui

10. Jika login sebagai atasan/approval maka sidebar akan menampilkan menu "Approval"

![Setuju](https://firebasestorage.googleapis.com/v0/b/itsmejoule.appspot.com/o/sekawan%2FReservation%20-%20Laravel%20approved.png?alt=media&token=2d2ab629-8640-405f-b378-299f208ebd66)

![Menolak](https://firebasestorage.googleapis.com/v0/b/itsmejoule.appspot.com/o/sekawan%2FReservation%20-%20Laravel%20rejected.png?alt=media&token=f0183d55-cd27-496c-b673-f8d55dcd3603)

11. Di menu ini pihak penyetuju dapat menentukan apakah setuju dengan pemesanan ataupun menolak

12. Menu dashboard bisa diakses oleh akun dengan status apapun

![Dashboard](https://firebasestorage.googleapis.com/v0/b/itsmejoule.appspot.com/o/sekawan%2FDashboard%20-%20Laravel.png?alt=media&token=09dfd412-9628-4c2c-9640-c5342c68bd51)

Di menu ini admin atau pun atasan dapat melihat grafik pemakaian kendaraan setiap minggunya.

13. Di setiap menu juga terdapat statustotal user, total kendaraan, total driver, dan total penggunaan bahan bakar.

![Stats](https://firebasestorage.googleapis.com/v0/b/itsmejoule.appspot.com/o/sekawan%2Fstats.png?alt=media&token=9b194990-5d25-4822-a0f7-0fa0fb647753)

14. Di menu vehicle, admin atau pun atasan dapat melihat list semua kendaraan yang beroperasi

![Vehicle](https://firebasestorage.googleapis.com/v0/b/itsmejoule.appspot.com/o/sekawan%2FVehicles%20-%20Laravel.png?alt=media&token=0e79c853-77f4-4ab2-a2ae-9f679e2f0b78)
