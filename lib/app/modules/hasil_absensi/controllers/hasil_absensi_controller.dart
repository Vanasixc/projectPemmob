import 'package:get/get.dart';

class HasilAbsensiController extends GetxController {
  late final String mataKuliah;
  late final int pertemuan;
  late final String waktu;
  late final bool status;
  late final String keterangan;
  late final String sessionId;

  @override
  void onInit() {
    super.onInit();

    final args = (Get.arguments ?? {}) as Map;

    mataKuliah = (args['mataKuliah'] ?? '-').toString();
    pertemuan = (args['pertemuan'] is num)
        ? (args['pertemuan'] as num).toInt()
        : 0;
    waktu = (args['waktu'] ?? '').toString();
    status = (args['status'] ?? false) as bool;
    keterangan = (args['keterangan'] ?? '').toString();
    sessionId = (args['sessionId'] ?? '').toString();
  }
}
