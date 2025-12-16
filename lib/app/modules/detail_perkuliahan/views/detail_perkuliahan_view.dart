import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_perkuliahan_controller.dart';

class DetailPerkuliahanView extends GetView<DetailPerkuliahanController> {
  const DetailPerkuliahanView({super.key});

  String fmt(DateTime? dt) {
    if (dt == null) return '-';
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(dt.day)}-${two(dt.month)}-${dt.year} ${two(dt.hour)}:${two(dt.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    final userId = controller.userId;

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.mkTitle),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.streamSessions(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final docs = snap.data?.docs ?? [];
          if (docs.isEmpty) {
            return const Center(
              child: Text('Belum ada sesi presensi untuk MK ini'),
            );
          }

          // ✅ Sort di client (desc pertemuan) biar nggak perlu index
          docs.sort((a, b) {
            final pa = (a.data()['pertemuan'] as num?)?.toInt() ?? 0;
            final pb = (b.data()['pertemuan'] as num?)?.toInt() ?? 0;
            return pb.compareTo(pa);
          });

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final doc = docs[i];
              final data = doc.data();

              final pertemuan = (data['pertemuan'] as num?)?.toInt() ?? 0;
              final startAt = (data['startAt'] as Timestamp?)?.toDate();
              final endAt = (data['endAt'] as Timestamp?)?.toDate();

              final recordRef = FirebaseFirestore.instance
                  .collection('presensi_sessions')
                  .doc(doc.id)
                  .collection('records')
                  .doc(userId);

              // ✅ Realtime status hadir
              return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: recordRef.snapshots(),
                builder: (context, recordSnap) {
                  final now = DateTime.now();
                  final hadir = recordSnap.data?.exists ?? false;

                  String statusText = 'Belum';
                  Color statusColor = Colors.grey;

                  DateTime? scanAt;
                  if (hadir) {
                    statusText = 'Hadir';
                    statusColor = Colors.green;

                    final r = recordSnap.data?.data();
                    final scanTs = r?['scanAt'] as Timestamp?;
                    scanAt = scanTs?.toDate();
                  } else if (endAt != null && now.isAfter(endAt)) {
                    statusText = 'Tidak Hadir';
                    statusColor = Colors.red;
                  }

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.orange.shade200),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pertemuan ke-$pertemuan',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text('Mulai  : ${fmt(startAt)}'),
                              Text('Selesai: ${fmt(endAt)}'),
                              if (hadir) ...[
                                const SizedBox(height: 6),
                                Text(
                                  'Scan at: ${fmt(scanAt)}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            statusText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
