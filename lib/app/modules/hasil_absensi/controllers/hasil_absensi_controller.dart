import 'package:get/get.dart';

class HasilAbsensiController extends GetxController {
  //TODO: Implement HasilAbsensiController
  late final String mataKuliah;
  late final int pertemuan;
  late String waktu;
  late final bool status;
  late final String keterangan;
  late final String sessionId;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments as Map<String, dynamic>;

    mataKuliah = args['mataKuliah'];
    pertemuan = args['pertemuan'];
    waktu = args['waktu'];
    status = args['status'];
    keterangan = args['keterangan'];
    sessionId = args['sessionId'];
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
