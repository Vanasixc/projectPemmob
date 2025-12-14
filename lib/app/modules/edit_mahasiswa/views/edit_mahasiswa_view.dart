import 'dart:io';

import 'package:belajar_getx/app/helper/costume_widgets.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../controllers/edit_mahasiswa_controller.dart';

class EditMahasiswaView extends GetView<EditMahasiswaController> {
  const EditMahasiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Mahasiswa'),
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
              Column(
                children: [
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
                        backgroundImage: AssetImage(
                          'assets/default_profile.jpg',
                        ),
                      );
                    }
                  }),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () {
                      controller.choiceImage(controller.mhs.nim);
                    },
                    icon: const Icon(Icons.photo, size: 20),
                    label: const Text(
                      'Ganti Foto',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),

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
                      CusTextField(controller: controller.namaController),
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
                      CusTextField(controller: controller.nimController),
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
                      Obx(
                        () => CusDropDown<String>(
                          hint: 'Pilih Fakultas',
                          items: controller.dataUniv.listFakultas,
                          selectedValue:
                              controller.dataUniv.selectedFakultas.value.isEmpty
                              ? null
                              : controller.dataUniv.selectedFakultas.value,
                          onChanged: (value) {
                            controller.dataUniv.selectedFakultas.value = value!;
                            controller.dataUniv.selectedProdi.value = "";
                          },
                        ),
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
                      Obx(
                        () => CusDropDown<String>(
                          hint:
                              controller.dataUniv.selectedFakultas.value.isEmpty
                              ? 'Pilih Fakultas Terlebih Dahulu'
                              : 'Pilih Prodi',
                          items: controller.dataUniv.currentProdi,
                          selectedValue:
                              controller.dataUniv.selectedProdi.value.isEmpty
                              ? null
                              : controller.dataUniv.selectedProdi.value,
                          onChanged: (value) {
                            controller.dataUniv.selectedProdi.value = value!;
                          },
                        ),
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
                      Obx(
                        () => CusDropDown<int>(
                          hint: 'Pilih Semester',
                          items: controller.dataUniv.listSemester,
                          selectedValue:
                              controller.dataUniv.selectedSemester.value,
                          onChanged: (value) {
                            controller.dataUniv.selectedSemester.value = value;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                height: 50,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await controller.updateMahasiswa();
                          Get.offNamed(Routes.LIST_MAHASISWA);
                          Fluttertoast.showToast(msg: 'Update Berhasil');
                        } catch (e) {
                          Get.snackbar('Gagal Update', e.toString());
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[700],
                      ),
                      child: Text(
                        'Update',
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
