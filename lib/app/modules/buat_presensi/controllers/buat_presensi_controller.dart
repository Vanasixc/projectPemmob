import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BuatPresensiController extends GetxController {
  // dummy dulu, nanti bisa dari Firestore
  List<String> listMataKuliah = [
    'IF204 - Pemrograman Mobile',
    'IF201 - Basis Data',
  ];

  RxString selectedMataKuliah = ''.obs;

  final kelasController = TextEditingController();
  final pertemuanController = TextEditingController();

  void createPresensi() {
    if (selectedMataKuliah.value.isEmpty ||
        kelasController.text.isEmpty ||
        pertemuanController.text.isEmpty) {
      Get.snackbar('Gagal', 'Semua field wajib diisi');
      return;
    }

    final token = generateToken(
      mkCode: selectedMataKuliah.value.split(' ')[0], // IF204
      pertemuan: pertemuanController.text,
    );

    Get.toNamed(
      Routes.HASIL_QR,
      arguments: {
        'token': token,
        'mataKuliah': selectedMataKuliah.value,
        'kelas': kelasController.text,
        'pertemuan': pertemuanController.text,
      },
    );
  }

  String generateToken({required String mkCode, required String pertemuan}) {
    final now = DateTime.now();
    final date =
        '${now.year % 100}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';

    return 'SESSION_${date}_${mkCode}_$pertemuan';
  }
}
