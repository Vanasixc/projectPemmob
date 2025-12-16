import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../controllers/check_lokasi.dart';
import '../../../controllers/auth_controllers.dart';

class AbsensiController extends GetxController {
  bool _isProcessing = false;

  Future<void> _goResult({
    required String mk,
    required int pertemuan,
    required DateTime now,
    required bool status,
    required String ket,
    required String sessionId,
  }) async {
    Get.offNamed(
      Routes.HASIL_ABSENSI,
      arguments: {
        'mataKuliah': mk,
        'pertemuan': pertemuan,
        'waktu': now.toString(),
        'status': status,
        'keterangan': ket,
        'sessionId': sessionId,
      },
    );
  }

  Future<void> qrDetection(String code) async {
    if (_isProcessing) return;
    _isProcessing = true;

    final now = DateTime.now();

    try {
      if (code.isEmpty) {
        Get.snackbar('Gagal Scan', 'QR Tidak Valid');
        return;
      }
      if (!code.startsWith('SESSION_')) {
        Get.snackbar('Gagal Scan', 'Format QR tidak dikenal');
        return;
      }

      final sessionId = code.replaceFirst('SESSION_', '').trim();

      // 1) ambil session dari firestore
      final doc = await FirebaseFirestore.instance
          .collection('presensi_sessions')
          .doc(sessionId)
          .get();

      if (!doc.exists) {
        await _goResult(
          mk: '-',
          pertemuan: 0,
          now: now,
          status: false,
          ket: 'Session presensi tidak ditemukan',
          sessionId: sessionId,
        );
        return;
      }

      final data = doc.data()!;

      final mk = (data['mk'] ?? '-').toString();
      final pertemuan = (data['pertemuan'] is num)
          ? (data['pertemuan'] as num).toInt()
          : 0;
      final isActive = (data['isActive'] ?? false) as bool;

      if (!isActive) {
        await _goResult(
          mk: mk,
          pertemuan: pertemuan,
          now: now,
          status: false,
          ket: 'Presensi sudah ditutup',
          sessionId: sessionId,
        );
        return;
      }

      // 2) validasi waktu (aman dari null)
      final startTs = data['startAt'];
      final endTs = data['endAt'];

      if (startTs == null || endTs == null) {
        await _goResult(
          mk: mk,
          pertemuan: pertemuan,
          now: now,
          status: false,
          ket: 'Data presensi belum lengkap (startAt/endAt kosong)',
          sessionId: sessionId,
        );
        return;
      }

      final startAt = (startTs as Timestamp).toDate();
      final endAt = (endTs as Timestamp).toDate();

      if (now.isBefore(startAt)) {
        await _goResult(
          mk: mk,
          pertemuan: pertemuan,
          now: now,
          status: false,
          ket: 'Presensi belum dibuka',
          sessionId: sessionId,
        );
        return;
      }

      if (now.isAfter(endAt)) {
        await _goResult(
          mk: mk,
          pertemuan: pertemuan,
          now: now,
          status: false,
          ket: 'Presensi sudah berakhir',
          sessionId: sessionId,
        );
        return;
      }

      // 3) validasi lokasi (aman dari null)
      final rawLat = data['lat'];
      final rawLng = data['lng'];
      final rawRadius = data['radius'];

      if (rawLat == null || rawLng == null || rawRadius == null) {
        await _goResult(
          mk: mk,
          pertemuan: pertemuan,
          now: now,
          status: false,
          ket: 'Data lokasi presensi belum lengkap (lat/lng/radius kosong)',
          sessionId: sessionId,
        );
        return;
      }

      final lat = (rawLat as num).toDouble();
      final lng = (rawLng as num).toDouble();
      final radius = (rawRadius as num).toDouble();

      final lokasiOk = await checkLokasi(lat, lng, radius);

      if (!lokasiOk) {
        await _goResult(
          mk: mk,
          pertemuan: pertemuan,
          now: now,
          status: false,
          ket: 'Anda berada di luar jangkauan',
          sessionId: sessionId,
        );
        return;
      }

      // 4) simpan absensi ke subcollection records/{userId}
      final authC = Get.find<AuthControllers>();

      final userId = authC.docId.value;
      final nim = authC.nimLogin.value;
      final nama = authC.namaLogin.value;

      if (userId == null || userId.isEmpty) {
        await _goResult(
          mk: mk,
          pertemuan: pertemuan,
          now: now,
          status: false,
          ket: 'User belum login (docId kosong)',
          sessionId: sessionId,
        );
        return;
      }

      final recordRef = FirebaseFirestore.instance
          .collection('presensi_sessions')
          .doc(sessionId)
          .collection('records')
          .doc(userId);

      final sessionProdi = (data['prodi'] ?? '').toString();
      final mhsProdi = authC.mhsProdi.value;

      if (mhsProdi != sessionProdi) {
        await _goResult(
          mk: mk,
          pertemuan: pertemuan,
          now: now,
          status: false,
          ket: 'Presensi tidak sesuai dengaan prodi Anda',
          sessionId: sessionId,
        );
        return;
      }
      

      final recordSnap = await recordRef.get();
      if (recordSnap.exists) {
        await _goResult(
          mk: mk,
          pertemuan: pertemuan,
          now: now,
          status: false,
          ket: 'Anda sudah melakukan absensi untuk sesi ini',
          sessionId: sessionId,
        );
        return;
      }

      await recordRef.set({
        'nama': (nama ?? '-').toString(),
        'nim': (nim ?? '-').toString(),
        'scanAt': FieldValue.serverTimestamp(),
      });

      // sukses
      await _goResult(
        mk: mk,
        pertemuan: pertemuan,
        now: now,
        status: true,
        ket: '',
        sessionId: sessionId,
      );
    } catch (e) {
      await _goResult(
        mk: '-',
        pertemuan: 0,
        now: now,
        status: false,
        ket: e.toString(),
        sessionId: '',
      );
    } finally {
      _isProcessing = false;
    }
  }
}
