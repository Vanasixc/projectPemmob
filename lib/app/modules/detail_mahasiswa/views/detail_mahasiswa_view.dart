import 'dart:io';

import 'package:belajar_getx/app/helper/costume_widgets.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../controllers/detail_mahasiswa_controller.dart';

class DetailMahasiswaView extends GetView<DetailMahasiswaController> {
  const DetailMahasiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image Profile
              Obx(() {
                if (controller.photoPath.value.isNotEmpty) {
                  return CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(
                      File(controller.photoPath.value),
                    ),
                  );
                } else {
                  return CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/default_profile.jpg'),
                  );
                }
              }),

              SizedBox(height: 40),
              // Data diri mahasiswa
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Nama',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      CusTextField(
                        controller: controller.namaController,
                        label: '${controller.mhs.nama}',
                        readOnly: true,
                        boldLabel: true,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'NIM',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      CusTextField(
                        controller: controller.namaController,
                        label: '${controller.mhs.nim}',
                        readOnly: true,
                        boldLabel: true,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Fakultas',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      CusTextField(
                        controller: controller.namaController,
                        label: '${controller.mhs.fakultas}',
                        readOnly: true,
                        boldLabel: true,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Prodi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      CusTextField(
                        controller: controller.namaController,
                        label: '${controller.mhs.prodi}',
                        readOnly: true,
                        boldLabel: true,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Semester',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      CusTextField(
                        controller: controller.namaController,
                        label: '${controller.mhs.semester}',
                        readOnly: true,
                        boldLabel: true,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title:
                              'Apakah anda yakin ingin menghapus data: \n${controller.mhs.nama}\n${controller.mhs.nim}?',
                          textCancel: 'Batal',
                          textConfirm: 'Hapus',
                          buttonColor: Colors.red[400],
                          cancelTextColor: Colors.black,
                          middleText: '',
                          onConfirm: () {
                            controller.deleteMahasiswa();
                            Fluttertoast.showToast(msg: 'Data telah dihapus');
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Get.toNamed(
                        Routes.EDIT_MAHASISWA,
                        arguments: controller.mhs,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Get.toNamed(
                        Routes.ADD_PERKULIAHAN,
                        arguments: controller.mhs,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Perkuliahan',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
