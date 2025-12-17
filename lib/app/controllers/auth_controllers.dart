import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthControllers extends GetxController {
  RxnString nimLogin = RxnString();
  RxnString passLogin = RxnString();
  RxnString namaLogin = RxnString();
  RxnString mhsProdi = RxnString();
  RxnString docId = RxnString();

  Future<bool> login(String nim, String password) async {
    if (nim.isEmpty) {
      Fluttertoast.showToast(msg: 'NIM tidak boleh kosong');
      return false;
    }

    if (password.isEmpty) {
      Fluttertoast.showToast(msg: 'Password tidak boleh kosong');
      return false;
    }

    // get data by NIM
    final get = await FirebaseFirestore.instance
        .collection('mahasiswa')
        .where('NIM', isEqualTo: nim)
        .limit(1)
        .get();

    final doc = get.docs.first;
    final data = doc.data();

    nimLogin.value = data['NIM'];
    namaLogin.value = data['nama'];
    passLogin.value = data['password'];
    mhsProdi.value = data['prodi'];
    docId.value = doc.id;

    Fluttertoast.showToast(msg: 'Selamat datang ${namaLogin.value}');
    return true;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?> getMahasiswa() async {
    if (docId.value == null) return null;

    return FirebaseFirestore.instance
        .collection('mahasiswa')
        .doc(docId.value)
        .get();
  }
}
