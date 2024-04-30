#CPSSOFT


Mobile Development Test

Penulis: Taufiq Nur Bahtiar

Email: taufiknurbachtiyar@gmail.com

Phone: 087766226999




###############################################

![Simulator Screenshot - iPhone 15 Pro Max - 2024-05-01 at 04 17 40](https://github.com/bachtiyar93/accurate/assets/37733982/53c66b1f-c420-4eb3-bac7-2ec0eb29af1e)

![Simulator Screenshot - iPhone 15 Pro Max - 2024-05-01 at 04 17 52](https://github.com/bachtiyar93/accurate/assets/37733982/4cdd8c4c-c5c6-467f-9d1d-eae8aa472fdc)

![Simulator Screenshot - iPhone 15 Pro Max - 2024-05-01 at 04 16 39](https://github.com/bachtiyar93/accurate/assets/37733982/476ba625-a60d-4c30-b276-c86631353585)

![Simulator Screenshot - iPhone 15 Pro Max - 2024-05-01 at 04 18 04](https://github.com/bachtiyar93/accurate/assets/37733982/d9c8a632-edc7-4d83-96c0-35ae02a09255)

##################################################

Project Specification:

SDK Flutter 3.19.5

DevTools 1.31.1

Java OpenJDK 17.0.9

XCode 15

Project Installations:
1. clone this project url
2. ketik flutter pub get pada terminal
3. ketik flutter packages pub run build_runner build --delete-conflicting-outputs pada terminal
4. ketik flutter run

Penjelasan Apps:
1. App terdiri UI Base dan Home
2. Saat App dibuka akan menampilkan splashscreen 1 detik, dan di alihkan ke route Home.
3. Pada route Home, AppStarted dipicu untuk mengambil data User dan Kota, selama proses ini disajikan loading screen berupa shimmer.
4. Setelah mendapatkan data akan disajikan data user, bilah Pencarian, sortir, dan filter kota serta button add user pada appBar agar user experince yang didapatkan menyenangkan dan mudah.
5. Dalam pencarian data user, cukup ketik yang ingin dicari berdasarkan nama kemudian tap icon kaca pembesar dan akan otomatis divalidasi multicase sehingga tidak terpengaruh jenis huruf besar ataupun kecil.
6. Untuk mengembalikan ke data keseluruhan tap icon silang pengganti icon kaca pembesar, semua data filter dan pencarian akan di clear dan di set ulang.
7. Sortir dan filter berupa dropdown yang langsung mengeksekusi data setelah filter dipilih.
8. Untuk menambah data user cukup tap icon add user, akan menampilkan dialog pengisian form kemudian simpan.

Penjelasan Struktur Apps
1. Base adalah component initstate yang dapat diisi berbagai keperluan inisiasi data, dalam kasus ini UI seharusnya sama dengan Native Splashscreen, dalam project ini native splashscreen belum diterapkan seharusnya berada di runner (ios) dan res (android)
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
4. Routes Getx memiliki banyak boilerplate dikarenakan GetX itu sendiri adalah state management.
5. API post mengembalikan statuscode 201 seharusnya 200 secara default dan atau mengembalikan kode validasi tertentu.
6. City memiliki data user pada output json.
7. User memiliki json multi string quote pada key query


Solusi:
1. Menggunakan state management official agar tidak mengalami masalah perubahan kode yang significant (kasus bloc saat flutter null safety)
2. Menggnukan state management dengan dukungan MultiProvider ini sangat kuat untuk flutter MultiProvider itu sendiri dapat digabung dengan bloc, getX, riverpod ataupun provider
3. Menggunakkan state yang memiliki  ChangeNotifierProvider (CNP), CNP memiliki kemampuan dispose otomatis sehingga minim kebocoran memory
4. Alih alih menggunakan getX, MaterialApp sendiri memiliki kelas routes bawaan yang fungsi dan penggunaanya sama dengan autoroutes ataupun getX itu sendiri.
