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
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.streamPerkuliahanMahasiswa(),
        builder: (context, snapJoined) {
          if (snapJoined.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapJoined.hasError) {
            return Center(child: Text('Error: ${snapJoined.error}'));
          }

          // yang sudah diikuti (pakai docId mata_kuliah karena kamu simpan doc(mkDoc.id))
          final joinedDocs = snapJoined.data?.docs ?? [];
          final joinedMkIds = joinedDocs.map((e) => e.id).toSet();

          return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: controller.streamMK(),
            builder: (context, snapMk) {
              if (snapMk.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapMk.hasError) {
                return Center(child: Text('Error: ${snapMk.error}'));
              }

              final mkDocs = snapMk.data?.docs ?? [];
              if (mkDocs.isEmpty) {
                return const Center(
                  child: Text('Tidak ada mata kuliah tersedia'),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: mkDocs.length,
                itemBuilder: (context, i) {
                  final mkDoc = mkDocs[i];
                  final data = mkDoc.data();

                  final kode = (data['kode'] ?? '').toString();
                  final nama = (data['nama'] ?? '').toString();
                  final hari = (data['hari'] ?? '-').toString();

                  final sudahIkut = joinedMkIds.contains(mkDoc.id);

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text('$kode - $nama'),
                      subtitle: Text('Hari: $hari'),
                      trailing: ElevatedButton(
                        onPressed: sudahIkut
                            ? null
                            : () => controller.tambahMK(mkDoc),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: sudahIkut
                              ? Colors.grey
                              : Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(sudahIkut ? 'Mengikuti' : 'Tambah'),
                      ),
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
