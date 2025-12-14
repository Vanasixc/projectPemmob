import 'package:belajar_getx/app/controllers/profile_controller.dart';
import 'package:belajar_getx/app/services/services_mahasiswa.dart';
import 'package:get/get.dart';

import '../controllers/detail_mahasiswa_controller.dart';

class DetailMahasiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMahasiswaController>(() => DetailMahasiswaController());
    Get.put<ProfileController>(ProfileController());
    Get.put<ServicesMahasiswa>(ServicesMahasiswa()); }
}
