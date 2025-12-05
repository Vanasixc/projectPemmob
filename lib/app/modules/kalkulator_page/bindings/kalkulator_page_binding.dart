import 'package:get/get.dart';

import '../controllers/kalkulator_page_controller.dart';

class KalkulatorPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KalkulatorPageController>(
      () => KalkulatorPageController(),
    );
  }
}
