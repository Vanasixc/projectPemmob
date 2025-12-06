import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
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
      // mengirim data username ke halaman home
      // Get.offNamed digunakan agar user tidak bisa kembali ke halama login (tidak ada tombol back di pojok kiri atas home)
      Get.offNamed(Routes.HOME, arguments: usernameController.text);
    } else {
      Fluttertoast.showToast(msg: 'Anda gagal login');
    }
  }

  
}
