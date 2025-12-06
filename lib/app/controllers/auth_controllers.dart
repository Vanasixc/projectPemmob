import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthControllers extends GetxController {
  RxString username = ''.obs;
  RxString password = ''.obs;

  bool login(String username, String password) {
    if (username == '' || password == '') {
      Fluttertoast.showToast(msg: 'Username atau password tidak boleh kosong');
      return false;
    } else if (username == 'admin' && password == 'admin') {
      Fluttertoast.showToast(msg: 'Selamat datang $username');
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Anda gagal login');
      return false;
    }
  }
}
