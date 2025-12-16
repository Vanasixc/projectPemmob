import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_perkuliahan_controller.dart';

class AddPerkuliahanView extends GetView<AddPerkuliahanController> {
  const AddPerkuliahanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Perkuliahan'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.streamMK(),
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
              child: Text('Mata kuliah tidak tersedia untuk semester ini'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final doc = docs[i];
              final d = doc.data();

              final kode = (d['kode'] ?? '').toString();
              final nama = (d['nama'] ?? '').toString();
              final hari = (d['hari'] ?? '-').toString();
              final semester = (d['semester'] as num?)?.toInt();

              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text('$kode - $nama'),
                  subtitle: Text('Hari: $hari | Semester: ${semester ?? '-'}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Tambah Perkuliahan',
                        middleText: 'Tambahkan mahasiswa ke:\n$kode - $nama ?',
                        textCancel: 'Batal',
                        textConfirm: 'Tambah',
                        confirmTextColor: Colors.white,
                        onConfirm: () async {
                          Get.back(); // tutup dialog
                          await controller.tambahMK(doc);
                        },
                      );
                    },
                    child: const Text('Tambah'),
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
