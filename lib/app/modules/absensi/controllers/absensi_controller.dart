import 'package:belajar_getx/app/controllers/auth_controllers.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../controllers/check_lokasi.dart';

class AbsensiController extends GetxController {
  //TODO: Implement AbsensiController
  // final authC = Get.find<AuthControllers>();

  // koordinat Mipa 2
  final double latMipa2 = -3.4442846676241725;
  final double longMipa2 = 114.8424291883616;
  final double radius = 10;

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

  Future<void> qrDetection(String code) async {
    if (code.isEmpty) {
      Get.snackbar('Gagal Scan', 'QR Tidak Valid');
      return;
    }

    if (!code.startsWith('SESSION_')) {
      Get.snackbar('Gagal Scan', 'Format QR tidak dikenal');
      return;
    }

    // buat ngecek output aj
    debugPrint('Value QR : $code');

    final sessionId = code.replaceFirst('SESSION_', '');

    final lokasi = await checkLokasi(latMipa2, longMipa2, radius);

    // cek bila orang berada di luar radius MIPA
    if (!lokasi) {
      Get.offNamed(
        Routes.HASIL_ABSENSI,
        arguments: {
          'mataKuliah': 'Pemrograman Mobiler',
          'pertemuan': 5,
          'waktu': DateTime.now().toString(),
          'status': false,
          'keterangan': 'Anda berada di luar jangkauan kampus',
          'sessionId': sessionId,
        },
      );
    }

    Get.offNamed(
      Routes.HASIL_ABSENSI,
      arguments: {
        'mataKuliah': 'Pemrograman Mobiler',
        'pertemuan': 5,
        'waktu': DateTime.now().toString(),
        'status': true,
        'keterangan': '',
        'sessionId': sessionId,
      },
    );
  }
}
