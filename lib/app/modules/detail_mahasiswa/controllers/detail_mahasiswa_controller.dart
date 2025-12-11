import 'package:belajar_getx/app/data/models/model_mahasiswa.dart';
import 'package:belajar_getx/app/services/services_mahasiswa.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailMahasiswaController extends GetxController {
  //TODO: Implement DetailMahasiswaController

  //Data dari list_mahasiswa dengan model
  final modelMahasiswa mhs = Get.arguments;



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

  Future<void> deleteMahasiswa(String nim) async{
    await Get.find<ServicesMahasiswa>().deleteMahasiswa(nim);
  }
}
