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
  final TextEditingController nimController = TextEditingController();
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

  Future<void> isLogin() async {
    String nim = nimController.text;
    String pass = passwordController.text;

    bool done = await authC.login(nim, pass);

    if(done) Get.offNamed(Routes.HOME);
  }
}
