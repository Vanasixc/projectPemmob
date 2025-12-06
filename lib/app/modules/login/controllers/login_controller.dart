import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../controllers/auth_controllers.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  final authC = Get.put(AuthControllers());
  //TODO: Implement HomeController

  final count = 0.obs;
  // textfield variable
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  void isLogin() {
    String nama = usernameController.text;
    String pass = passwordController.text;

    if (authC.login(nama, pass)) {
      Get.offNamed(Routes.HOME);
    }
  }
}
