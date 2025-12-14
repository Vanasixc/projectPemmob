import 'package:belajar_getx/app/controllers/profile_controller.dart';
import 'package:belajar_getx/app/services/services_mahasiswa.dart';
import 'package:get/get.dart';

import '../controllers/edit_mahasiswa_controller.dart';
import '../../../data/data_univ.dart';

class EditMahasiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMahasiswaController>(
      () => EditMahasiswaController(),
    );
    Get.put<DataUniv>(DataUniv());
    Get.put<ServicesMahasiswa>(ServicesMahasiswa());
    Get.put<ProfileController>(ProfileController());
  }
}
