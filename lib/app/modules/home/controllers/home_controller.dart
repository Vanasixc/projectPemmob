import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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

  void increment() => count.value++;

  void login(String username, String password) {
    if (username == 'admin' && password == 'admin') {
      Fluttertoast.showToast(msg: 'Selamat datang di $username');
      Get.offNamed(Routes.KALKULATOR_PAGE);
    } else {
      Fluttertoast.showToast(msg: 'Anda gagal login');
    }
  }
}
