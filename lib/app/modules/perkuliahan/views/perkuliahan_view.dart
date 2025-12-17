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
      appBar: AppBar(
        title: const Text('Perkuliahan'),
        backgroundColor: Colors.amber,
      ),
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final d = docs[i].data();

              final kode = (d['kode'] ?? '').toString();
              final nama = (d['nama'] ?? '').toString();
              final hari = (d['hari'] ?? '-').toString();

              return Card(
                color: const Color(0xFFFFECB2),
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Get.toNamed(
                      Routes.DETAIL_PERKULIAHAN,
                      arguments: {
                        'mkCode': kode,
                        'mkTitle': '$kode - $nama',
                        'hari': hari,
                      },
                    );
                  },
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    leading: const Icon(
                      Icons.menu_book_rounded,
                      color: Colors.black87,
                    ),
                    title: Text(
                      nama,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('Kode: $kode'),
                    trailing: Chip(
                      label: Text(
                        hari.toUpperCase(),
                        style: const TextStyle(fontSize: 12),
                      ),
                      backgroundColor: Colors.white.withOpacity(0.85),
                      side: BorderSide(color: Colors.black.withOpacity(0.08)),
                    ),
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
