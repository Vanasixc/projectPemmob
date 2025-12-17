import 'package:belajar_getx/app/controllers/auth_controllers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PresensiItem {
  final String sessionId;
  final int pertemuan;
  final DateTime startAt;
  final DateTime endAt;
  final bool hadir;
  final DateTime? scanAt;

  PresensiItem({
    required this.sessionId,
    required this.pertemuan,
    required this.startAt,
    required this.endAt,
    required this.hadir,
    required this.scanAt,
  });
}

class DetailPerkuliahanController extends GetxController {
  final firestore = FirebaseFirestore.instance;

  late final String mkCode;
  late final String mkTitle;
  late final String hari;

  final items = <PresensiItem>[].obs;
  final loading = false.obs;
  final error = RxnString();

  late final String userId;
  late final String nim;
  late final String nama;

  @override
  void onInit() {
    super.onInit();

    final authC = Get.find<AuthControllers>();

    final uid = authC.docId.value;
    if (uid == null || uid.isEmpty) {
      mkCode = '';
      mkTitle = 'User belum login';
      hari = '-';
      return;
    }

    userId = uid;
    nim = (authC.nimLogin.value ?? '-').toString();
    nama = (authC.namaLogin.value ?? '-').toString();

    // Get arguments
    final args = Get.arguments;
    if (args == null || args is! Map<String, dynamic>) {
      mkCode = '';
      mkTitle = 'Data tidak valid';
      hari = '-';
      return;
    }

    mkCode = (args['mkCode'] ?? '').toString();
    mkTitle = (args['mkTitle'] ?? mkCode).toString();
    hari = (args['hari'] ?? '-').toString();

    fetch();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamSessions() {
    return firestore
        .collection('presensi_sessions')
        .where('mk', isEqualTo: mkCode)
        .snapshots();
  }

  Future<void> fetch() async {
    loading.value = true;
    error.value = null;

    try {
      final snap = await firestore
          .collection('presensi_sessions')
          .where('mk', isEqualTo: mkCode)
          .orderBy('pertemuan', descending: true)
          .get();

      final temp = <PresensiItem>[];

      for (final doc in snap.docs) {
        final data = doc.data();

        final pertemuan = (data['pertemuan'] as num?)?.toInt() ?? 0;
        final startAtTs = data['startAt'] as Timestamp?;
        final endAtTs = data['endAt'] as Timestamp?;

        if (startAtTs == null || endAtTs == null) continue;

        final startAt = startAtTs.toDate();
        final endAt = endAtTs.toDate();

        // record user
        final recordRef = firestore
            .collection('presensi_sessions')
            .doc(doc.id)
            .collection('records')
            .doc(userId);

        final recordSnap = await recordRef.get();

        bool hadir = recordSnap.exists;
        DateTime? scanAt;

        if (recordSnap.exists) {
          final r = recordSnap.data() as Map<String, dynamic>;
          final scanTs = r['scanAt'] as Timestamp?;
          scanAt = scanTs?.toDate();
        }

        temp.add(
          PresensiItem(
            sessionId: doc.id,
            pertemuan: pertemuan,
            startAt: startAt,
            endAt: endAt,
            hadir: hadir,
            scanAt: scanAt,
          ),
        );
      }

      items.assignAll(temp);
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
    }
  }
}
