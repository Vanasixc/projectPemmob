import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/perkuliahan_controller.dart';

class PerkuliahanView extends GetView<PerkuliahanController> {
  const PerkuliahanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perkuliahan')),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.streamPerkuliahan(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final docs = snapshot.data?.docs ?? [];
          if (docs.isEmpty) {
            return const Center(child: Text('Belum mengikuti perkuliahan'));
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final doc = docs[i];
              final d = doc.data();

              final kode = (d['kode'] ?? '').toString();
              final nama = (d['nama'] ?? '').toString();
              final hari = (d['hari'] ?? '-').toString();

              return InkWell(
                onTap: () {
                  debugPrint('TAP MK: kode=$kode nama=$nama hari=$hari');

                  Get.toNamed(
                    Routes.DETAIL_PERKULIAHAN,
                    arguments: {
                      'mkCode': kode,
                      'mkTitle': '$kode - $nama',
                      'hari': hari,
                    },
                  );
                },

                child: Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(nama),
                    subtitle: Text('Kode: $kode | Hari: ${hari.toUpperCase()}'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
