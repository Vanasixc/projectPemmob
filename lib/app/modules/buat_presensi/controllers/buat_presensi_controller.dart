import 'package:belajar_getx/app/data/models/model_mata_kuliah.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:belajar_getx/app/data/data_univ.dart';
import 'package:belajar_getx/app/helper/start_end_presensi.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';

class BuatPresensiController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final dataUniv = Get.find<DataUniv>();

  final mkList = <MataKuliah>[].obs;
  final mkLoading = false.obs;
  final mkError = RxnString();

  final selectedMk = Rxn<MataKuliah>();

  // lokasi
  final latController = TextEditingController();
  final lngController = TextEditingController();

  final List<int> radiusOptions = [10, 50, 100, 500, 1000];
  RxInt selectedRadius = 100.obs;

  RxBool loadingLokasi = false.obs;

  Rxn<DateTime> startAt = Rxn<DateTime>();
  Rxn<DateTime> endAt = Rxn<DateTime>();

  @override
  void onInit() {
    super.onInit();
    fetchMataKuliah();
  }

  Future<void> fetchMataKuliah() async {
    mkLoading.value = true;
    mkError.value = null;

    try {
      final snap = await firestore
          .collection('mata_kuliah')
          .where('aktif', isEqualTo: true)
          .get();

      final temp = <MataKuliah>[];
      for (final doc in snap.docs) {
        final data = doc.data();
        temp.add(MataKuliah.fromJson(data));
      }

      temp.sort((a, b) => a.kode.compareTo(b.kode));

      mkList.assignAll(temp);
    } catch (e) {
      mkError.value = e.toString();
    } finally {
      mkLoading.value = false;
    }
  }

  Future<void> pickStart(BuildContext context) async {
    final picked = await pickDateTime(context, initial: DateTime.now());
    if (picked == null) return;
    startAt.value = picked;

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

  Future<void> createPresensi(String id) async {
    if (selectedMk.value == null || dataUniv.selectedPertemuan.value == null) {
      Fluttertoast.showToast(msg: 'Mata kuliah atau pertemuan wajib diisi');
      return;
    }
    if (startAt.value == null || endAt.value == null) {
      Fluttertoast.showToast(msg: 'Waktu mulai & berakhir wajib diisi');
      return;
    }

    final lat = double.tryParse(latController.text);
    final lng = double.tryParse(lngController.text);
    if (lat == null || lng == null) {
      Fluttertoast.showToast(msg: 'Lokasi belum valid');
      return;
    }

    final mk = selectedMk.value!;
    final pertemuan = dataUniv.selectedPertemuan.value!;

    // simpan session
    final docRef = await firestore.collection('presensi_sessions').add({
      'mk': mk.kode,
      'mkName': '${mk.kode} - ${mk.nama}',
      'prodi': mk.prodi,
      'semesterMk': mk.semester,

      'pertemuan': pertemuan,
      'createdBy': id,
      'createdAt': Timestamp.now(),
      'isActive': true,

      'lat': lat,
      'lng': lng,
      'radius': selectedRadius.value,
      'startAt': Timestamp.fromDate(startAt.value!),
      'endAt': Timestamp.fromDate(endAt.value!),
    });

    Get.toNamed(
      Routes.HASIL_QR,
      arguments: {
        'sessionId': docRef.id,
        'mk': mk.kode,
        'pertemuan': pertemuan,
      },
    );
  }

  @override
  void onClose() {
    latController.dispose();
    lngController.dispose();
    dataUniv.selectedPertemuan.value = null;
    selectedMk.value = null;
    super.onClose();
  }
}
