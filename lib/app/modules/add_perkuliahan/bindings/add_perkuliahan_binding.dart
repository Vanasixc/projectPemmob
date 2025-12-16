import 'package:get/get.dart';

import '../controllers/add_perkuliahan_controller.dart';

class AddPerkuliahanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPerkuliahanController>(
      () => AddPerkuliahanController(),
    );
  }
}
