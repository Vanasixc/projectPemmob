import 'package:belajar_getx/app/controllers/auth_controllers.dart';
import 'package:get/get.dart';

import '../controllers/perkuliahan_controller.dart';

class PerkuliahanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerkuliahanController>(() => PerkuliahanController());
    Get.put<AuthControllers>(AuthControllers());
  }
}
