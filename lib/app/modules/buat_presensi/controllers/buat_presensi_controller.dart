import 'package:belajar_getx/app/helper/start_end_presensi.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BuatPresensiController extends GetxController {
  final firestore = FirebaseFirestore.instance;

  // Mata kuliah (sementara hardcode / nanti dari Firestore)
  Map<String, String> mataKuliahProdi = {
    'IF204 - Pemrograman Mobile': 'Ilmu Komputer',
    'IF201 - Basis Data': 'Ilmu Komputer',
    'FS101 - Fisika Dasar': 'Fisika',
  };

  List<String> listMataKuliah = [];

  RxString selectedMataKuliah = ''.obs;

  final pertemuanController = TextEditingController();
  final latController = TextEditingController();
  final lngController = TextEditingController();

  final List<int> radiusOptions = [10, 50, 100, 200, 500, 1000];
  RxInt selectedRadius = 100.obs;

  RxBool loadingLokasi = false.obs;

  Rxn<DateTime> startAt = Rxn<DateTime>();
  Rxn<DateTime> endAt = Rxn<DateTime>();

  Future<void> pickStart(BuildContext context) async {
    final picked = await pickDateTime(context, initial: DateTime.now());
    if (picked == null) return;
    startAt.value = picked;

    // opsional: reset endAt kalau endAt jadi invalid
    if (endAt.value != null && !endAt.value!.isAfter(picked)) {
      endAt.value = null;
    }
  }

  Future<void> pickEnd(BuildContext context) async {
    final base = startAt.value ?? DateTime.now();
    final picked = await pickDateTime(
      context,
      initial: base.add(const Duration(hours: 1)),
    );
    if (picked == null) return;
    endAt.value = picked;
  }

  /// Ambil lokasi dosen sekarang
  Future<void> ambilLokasiSekarang() async {
    loadingLokasi.value = true;
    try {
      final enabled = await Geolocator.isLocationServiceEnabled();
      if (!enabled) {
        Get.snackbar('Gagal', 'Location service belum aktif');
        return;
      }

      var perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        perm = await Geolocator.requestPermission();
      }
      if (perm == LocationPermission.denied ||
          perm == LocationPermission.deniedForever) {
        Get.snackbar('Gagal', 'Izin lokasi ditolak');
        return;
      }

      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latController.text = pos.latitude.toStringAsFixed(6);
      lngController.text = pos.longitude.toStringAsFixed(6);
    } finally {
      loadingLokasi.value = false;
    }
  }

  /// CREATE SESSION + PINDAH KE HALAMAN QR
  Future<void> createPresensi(String dosenId) async {
    if (selectedMataKuliah.value.isEmpty || pertemuanController.text.isEmpty) {
      Get.snackbar('Gagal', 'Mata kuliah dan pertemuan wajib diisi');
      return;
    }

    final lat = double.tryParse(latController.text);
    final lng = double.tryParse(lngController.text);
    final pertemuan = int.tryParse(pertemuanController.text);

    if (lat == null || lng == null || pertemuan == null) {
      Get.snackbar('Gagal', 'Data lokasi / pertemuan tidak valid');
      return;
    }

    final mkCode = selectedMataKuliah.value.split(' ').first;

    final selectedMK = selectedMataKuliah.value;
    final prodiMK = mataKuliahProdi[selectedMK];

    if (prodiMK == null) {
      Get.snackbar('Gagal', 'Prodi mata kuliah tidak ditemukan');
      return;
    }

    // 🔥 SIMPAN SESSION KE FIRESTORE
    final docRef = await firestore.collection('presensi_sessions').add({
      'mk': mkCode,
      'mkName': selectedMK,
      'prodi': prodiMK,
      'pertemuan': pertemuan,
      'createdBy': dosenId,
      'createdAt': Timestamp.now(),
      'isActive': true,
      'lat': lat,
      'lng': lng,
      'radius': selectedRadius.value,
      'startAt': Timestamp.fromDate(startAt.value!),
      'endAt': Timestamp.fromDate(endAt.value!),
    });

    final sessionId = docRef.id;

    // PINDAH KE HALAMAN QR
    Get.toNamed(
      Routes.HASIL_QR,
      arguments: {'sessionId': sessionId, 'mk': mkCode, 'pertemuan': pertemuan},
    );
  }

  @override
  void onInit() {
    super.onInit();
    listMataKuliah = mataKuliahProdi.keys.toList();
  }
}
