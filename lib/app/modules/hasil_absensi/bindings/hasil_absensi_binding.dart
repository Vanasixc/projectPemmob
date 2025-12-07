import 'package:get/get.dart';

import '../controllers/hasil_absensi_controller.dart';

class HasilAbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HasilAbsensiController>(
      () => HasilAbsensiController(),
    );
  }
}
