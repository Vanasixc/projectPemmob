import 'package:belajar_getx/app/data/data_univ.dart';
import 'package:get/get.dart';

import '../controllers/buat_presensi_controller.dart';

class BuatPresensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuatPresensiController>(() => BuatPresensiController());
    Get.put<DataUniv>(DataUniv());
  }
}
