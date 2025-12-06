import 'package:belajar_getx/app/controllers/auth_controllers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AbsensiController extends GetxController {
  //TODO: Implement AbsensiController
  final authC = Get.find<AuthControllers>();
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void qrDetection(String code) {
    Fluttertoast.showToast(msg: 'QR Tedeteks: $code');
  }
}
