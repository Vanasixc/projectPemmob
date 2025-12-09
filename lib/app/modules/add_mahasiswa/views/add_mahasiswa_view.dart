import 'dart:math';

import 'package:belajar_getx/app/helper/costume_widgets.dart';
import 'package:belajar_getx/app/helper/custome_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/add_mahasiswa_controller.dart';

class AddMahasiswaView extends GetView<AddMahasiswaController> {
  const AddMahasiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Tambah Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CusTextField(
                  controller: controller.namaController,
                  label: 'Nama',
                ),
                SizedBox(height: 20),
                CusTextField(
                  controller: controller.nimController,
                  label: 'NIM',
                  isAngka: true,
                ),
                SizedBox(height: 20),
                Obx(
                  () => CusTextField(
                    controller: controller.passwordController,
                    label: 'Password',
                    isPassword: true,
                    isHidden: controller.isHidden.value,
                    onToggleVisibility: () => controller.isHidden.toggle(),
                  ),
                ),
                SizedBox(height: 20),
                CusTextField(
                  controller: controller.fakultasController,
                  label: 'Fakultas',
                ),
                SizedBox(height: 20),
                CusTextField(
                  controller: controller.prodiController,
                  label: 'Prodi',
                ),
                SizedBox(height: 20),
                Obx(
                  () => CusDropDown(
                    label: 'Semester',
                    hint: 'Pilih Semester',
                    items: controller.listSemester,
                    selectedValue: controller.selectedSemester.value,
                    onChanged: (value) {
                      controller.selectedSemester.value = value;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => CusDropDown(
                    label: 'Role',
                    hint: 'Pilih Role',
                    items: controller.listRole,
                    selectedValue: controller.selectedRole.value,
                    onChanged: (value) {
                      controller.selectedRole.value = value;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addMahasiswa();
                    },
                    child: Text('Tambah Data'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
