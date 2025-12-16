import 'package:get/get.dart';

import '../controllers/detail_perkuliahan_controller.dart';

class DetailPerkuliahanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPerkuliahanController>(
      () => DetailPerkuliahanController(),
    );
  }
}
