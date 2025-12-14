import 'package:get/get.dart';

import '../controllers/hasil_qr_controller.dart';

class HasilQrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HasilQrController>(
      () => HasilQrController(),
    );
  }
}
