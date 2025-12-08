# QRSense

Project UAS membuat aplikasi absensi mahasiswa dengan QR code. Tetapi saya menambahkan validasi berupa lokasi menggunakan geolocator untuk memastikan mahasiswa berada di area kampus.

## ToDo Next (Priority)
1. Integrasikan dengan API firebase/supabase (done)
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

## Need
Library/Tools :
- [GetX](https://pub.dev/packages/get)
- [Get_CLI](https://pub.dev/packages/get_cli)
- [Geolocator](https://pub.dev/packages/geolocator)
- [Mobile_Scanner](https://pub.dev/packages/mobile_scanner)

Extention (VScode) :
- Error Lens
- GetX Snippet
- Pubspec Assist

## Update
- 7-12-25 => Selesai membuat validasi secara statis untuk lokasi menggunakan geolocator dan sudah bisa scan QR Code. Untuk sekarang QR Code dibuat lewat Canva saja, masih belum saya tambahkan fitur untuk membuat QR code sendiri. Isi dari QR code itu sendiri untuk sekarang adalah 'SESSION_xxx"
- 8-12-25 => Selesai menyambungkan ke Firebase project QRSense. aku juga membuat page testing buat ngetes dan add data. desain masih simpel tapi untuk saat ini sudah berfungsi dengan baik. Reference : [Kuldi_Project_Firebase_Eps4](https://youtu.be/E3eZ_AqVbn4?si=5TCi9iq7VsjfMWQC)
