import 'package:belajar_getx/app/data/models/model_mahasiswa.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_mahasiswa_controller.dart';

class ListMahasiswaView extends GetView<ListMahasiswaController> {
  const ListMahasiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.snapMhs(),
        builder: (context, snapMhs) {
          if (snapMhs.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapMhs.data!.docs.isEmpty) {
            return Center(child: Text('Data masih kosong'));
          }

          List<modelMahasiswa> listMhs = [];
          for (var element in snapMhs.data!.docs) {
            if(element.data()['role'] != 'Mahasiswa') continue;
            listMhs.add(modelMahasiswa.fromJson(element.data()));
          }
          return ListView.builder(
            itemCount: listMhs.length,
            padding: EdgeInsets.all(20),
            itemBuilder: (context, index) {
              modelMahasiswa mhs = listMhs[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(9),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 130,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${mhs.nim.toString()}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text('Nama: ${mhs.nama}'),
                              Text('Prodi: ${mhs.prodi}'),
                              Text('Semester: ${mhs.semester}'),
                            ],
                          ),
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Get.toNamed(Routes.DETAIL_MAHASISWA),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
