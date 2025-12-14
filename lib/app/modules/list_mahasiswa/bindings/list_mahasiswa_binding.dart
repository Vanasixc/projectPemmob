import 'package:belajar_getx/app/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/list_mahasiswa_controller.dart';

class ListMahasiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListMahasiswaController>(() => ListMahasiswaController());
    Get.put<ProfileController>(ProfileController());
  }
}
