import 'package:belajar_getx/app/controllers/profile_controller.dart';
import 'package:belajar_getx/app/data/models/model_mahasiswa.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:belajar_getx/app/services/services_mahasiswa.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DetailMahasiswaController extends GetxController {
  //TODO: Implement DetailMahasiswaController

  //handler profile image
  final profileImage = Get.find<ProfileController>();
  RxString photoPath = ''.obs;

  //Data dari list_mahasiswa dengan model
  final modelMahasiswa mhs = Get.arguments;

  final service = Get.find<ServicesMahasiswa>();

  //Textfield Controller
  final namaController = TextEditingController();
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

  Future<void> deleteMahasiswa() async {
    if (mhs.uId == null) {
      Fluttertoast.showToast(msg: 'Data tidak ada');
      return;
    }
    Get.offNamed(Routes.LIST_MAHASISWA);
    return service.deleteMahasiswa(mhs);
  }
}
