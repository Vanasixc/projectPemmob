import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../services/services_mahasiswa.dart';

class ListMahasiswaController extends GetxController {
  //TODO: Implement ListMahasiswaController

  Stream<QuerySnapshot<Map<String, dynamic>>> snapMhs() async* {
    yield* ServicesMahasiswa().firestore.collection('mahasiswa').snapshots();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
