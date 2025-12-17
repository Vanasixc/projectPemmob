# QRSense

Project UAS membuat aplikasi absensi mahasiswa dengan QR code. Tetapi saya menambahkan validasi berupa lokasi menggunakan geolocator untuk memastikan mahasiswa berada di area kampus.

## ToDo Next (Priority)
1. Create editMahasiswa Page and apply Firebase database for image profile
2. Buat reuse widget sendiri agar tidak berulang (ongoing)
3. Perbaharui UI (-)
4. [Khusus Role Dosen dan Admin]
Membuat halaman untuk delete data (otomatis get data dari database) dan show data mahasiswa (bisa pilih berdasarkan semester atau all) (-)
5. Membedakan isi home dari role mahasiswa dengan Dosen dan Admin (-)
6. Hanya admin yang bisa akses add dan delete data(-)

## ToDo Next (Optional)
home_view.dart :
- Layout menu 4 kotak bisa pakai GridView.count biar lebih rapi daripada 2 Row.
- Image.network untuk icon → kalau offline bakal kosong, nanti bisa diganti asset lokal.

## ToDo Done
1. Integrasikan dengan API firebase/supabase (done)✔️


## Need
Library/Tools :
- [GetX](https://pub.dev/packages/get) => State Management
- [Get_CLI](https://pub.dev/packages/get_cli) => Building Management
- [Geolocator](https://pub.dev/packages/geolocator) => Untuk validasi lokasi absen
- [Mobile_Scanner](https://pub.dev/packages/mobile_scanner) => Untuk Scan QR
- [Cloud_Firestore](https://pub.dev/packages/cloud_firestore) => API Firebase Firestore
- [Cupertino_Icons](https://pub.dev/packages/cupertino_icons) => Icons
- [Firebase_Core](https://pub.dev/packages/firebase_core) => API Firebase
- [Flutter_Screenutil](https://pub.dev/packages/firebase_core) => Untuk adapting screen
- [Fluttertoast](https://pub.dev/packages/fluttertoast) => Untuk pop up notif
- [Image_Picker](https://pub.dev/packages/image_picker) => Untuk bisa mengambil gambar dari library
- [Path_Provider](https://pub.dev/packages/path_provider) => Untuk memudahkan mencari path system
- [Qr_Flutter](https://pub.dev/packages/qr_flutter) => Generate QR
- [Share_Plus](https://pub.dev/packages/share_plus) => Untuk bisa share something

Extention (VScode) :
- Error Lens
- GetX Snippet
- Pubspec Assist

## Update
- 7-12-25 => Selesai membuat validasi secara statis untuk lokasi menggunakan geolocator dan sudah bisa scan QR Code. Untuk sekarang QR Code dibuat lewat Canva saja, masih belum saya tambahkan fitur untuk membuat QR code sendiri. Isi dari QR code itu sendiri untuk sekarang adalah 'SESSION_xxx"
- 8-12-25 => Selesai menyambungkan ke Firebase project QRSense. aku juga membuat page testing buat ngetes dan add data. desain masih simpel tapi untuk saat ini sudah berfungsi dengan baik. Reference : [Kuldi_Project_Firebase_Eps4](https://youtu.be/E3eZ_AqVbn4?si=5TCi9iq7VsjfMWQC)
- 10-12-25 => Selesai membuat untuk stream di list mahasiswa. next aku ingin coba membuat page detail berdasarkan mahasiswanya dan bisa ngedit si mahasiswa agar service update bisa digunakan. semoga untuk image juga bisa selesai besok. Reference : [Kuldi_Project_All_Product](https://www.youtube.com/watch?v=GIxNwCeD5TM)
- 18-12-25 => Done all for prototipe kecuali profile wkwkw