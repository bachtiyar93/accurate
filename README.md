# cpssoft

Mobile Development Test
Penulis: Taufiq Nur Bahtiar
Email: taufiknurbachtiyar@gmail.com
Phone: 087766226999

Penjelasan Apps:
1. App terdiri UI Base dan Home
2. Saat App dibuka akan menampilkan splashscreen 1 detik, dan di alihkan ke route Home.
3. Pada route Home, AppStarted dipicu untuk mengambil data User dan Kota, selama proses ini disajikan loading screen berupa shimmer.
4. Setelah mendapatkan data akan disajikan data user, bilah Pencarian, sortir, dan filter kota serta button add user.
5. Dalam pencarian data user, cukup ketik yang ingin dicari berdasarkan nama kemudian tap icon kaca pembesar dan akan otomatis divalidasi multicase.
6. Untuk mengembalikan ke data keseluruhan tap icon silang pengganti icon kaca pembesar.
7. Sortir dan filter berupa dropdown yang langsung mengeksekusi data setelah filter dipilih.
8. Untuk menambah data user cukup tap icon add user, akan menampilkan dialog pengisian form kemudian simpan.

Penjelasan Struktur Apps
1. Base adalah component initstate yang dapat diisi berbagai keperluan inisiasi data, dalam kasus ini UI seharusnya sama dengan Native Splashscreen,
    dalam project ini native splashscreen belum diterapkan seharusnya berada di runner (ios) dan res (android)
2. Base seharusnya bergantung pada banyaknya dan lamanya inisiasi data, namun agar base terlihat disini dibuat delay 1 detik.
3. UI selalu berada pada struktur folde lib/UI
4. Dalam kasus penggunaan bloc, controller bloc berada pada masing masing UI agar tidak menyebebkan kebingungan
5. Setiap component yang masing berkaitan dalam satu bidang akan tetap berada pada struktur folder
6. Apabila dalam kasus component digunakan secara global akan berada pada depedency injection exp Api Service
7. Model akan selalu berada pada lib/model
8. Data data depedency akan selalu berada di lib/helper
9. Dalam kasus tambahan seperti adanya database local atau jenis key value lainnya akan memiliki struktur folder sendiri dan penggunaan penamaan sesuai penggunaan

Concern:
1. Bloc adalah state management popular flutter tetapi bukan state management yang ditulis dan di dukung penuh oleh flutter
2. Bloc memiliki struktur modular tetapi dalam skala besar menyebabkan boilerplate karena banyaknya kode yang sama pada masing masing bloc
3. Sulitnya melakukan close bloc alih alih tetap menggunakan Stateless justru menggunakan Statefull agar metode dispose dapat dipanggil
4. Routes Getx memiliki banyak boilerplate dikarenakan GetX itu sendiri adalah state management


Solusi:
1. Menggunakan state management official agar tidak mengalami masalah perubahan kode yang significant (kasus bloc saat flutter null safety)
2. Menggnukan state management dengan dukungan MultiProvider ini sangat kuat untuk flutter MultiProvider itu sendiri dapat digabung dengan blco, getX, riverpod ataupun provider
3. Menggunakkan state yang memiliki  ChangeNotifierProvider (CNP), CNP memiliki kemampuan dispose otomatis sehingga minim kebocoran memory
4. Alih alih menggunakan getX, MaterialApp sendiri memiliki kelas routes bawaan yang fungsi dan penggunaanya sama dengan autoroutes ataupun getX itu sendiri.


