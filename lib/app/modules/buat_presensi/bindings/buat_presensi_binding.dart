import 'package:get/get.dart';

import '../controllers/buat_presensi_controller.dart';

class BuatPresensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuatPresensiController>(
      () => BuatPresensiController(),
    );
  }
}
