import 'package:belajar_getx/app/controllers/auth_controllers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PerkuliahanController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final authC = Get.find<AuthControllers>();

  Stream<QuerySnapshot<Map<String, dynamic>>> streamPerkuliahan() {
    final uid = authC.docId.value;
    if (uid == null || uid.isEmpty) {
      // stream kosong biar ga crash
      return const Stream.empty();
    }

    return firestore
        .collection('mahasiswa')
        .doc(uid)
        .collection('perkuliahan')
        .snapshots();
  }
}
