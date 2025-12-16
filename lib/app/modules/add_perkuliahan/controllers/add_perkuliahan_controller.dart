import 'package:belajar_getx/app/data/models/model_mahasiswa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddPerkuliahanController extends GetxController {
  final firestore = FirebaseFirestore.instance;

  late final String userId;
  late final String prodiMahasiswa;
  late final int semesterMahasiswa;

  @override
  void onInit() {
    super.onInit();
    final mhs = Get.arguments as modelMahasiswa;

    userId = mhs.uId!;
    prodiMahasiswa = mhs.prodi;
    semesterMahasiswa = mhs.semester; // pastikan di model int
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamMK() {
    return firestore
        .collection('mata_kuliah')
        .where('prodi', isEqualTo: prodiMahasiswa)
        .where('aktif', isEqualTo: true)
        .where('semester', isEqualTo: semesterMahasiswa)
        .snapshots();
  }

  Future<void> tambahMK(DocumentSnapshot<Map<String, dynamic>> mkDoc) async {
    final data = mkDoc.data();
    if (data == null) return;

    await firestore
        .collection('mahasiswa')
        .doc(userId)
        .collection('perkuliahan')
        .doc(mkDoc.id) // biar unik per MK
        .set({
          'kode': (data['kode'] ?? '').toString(),
          'nama': (data['nama'] ?? '').toString(),
          'prodi': (data['prodi'] ?? '').toString(),
          'hari': (data['hari'] ?? '-').toString(),
          'semester': (data['semester'] as num?)?.toInt() ?? semesterMahasiswa,
          'joinedAt': FieldValue.serverTimestamp(),
        });

    Get.back();
    Get.snackbar('Berhasil', 'Mahasiswa ditambahkan ke mata kuliah');
  }
}
