import 'package:get/get.dart';

import '../controllers/add_mahasiswa_controller.dart';
import '../../../data/data_univ.dart';

class AddMahasiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMahasiswaController>(
      () => AddMahasiswaController(),
    );
    Get.put<DataUniv>(DataUniv());
  }
}
