import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  late final String username;

  @override
  void onInit() {
    super.onInit();

    username = Get.arguments as String? ?? '';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void increment() => count.value++;
}
