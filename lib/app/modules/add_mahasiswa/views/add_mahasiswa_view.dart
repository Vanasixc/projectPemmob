import 'package:belajar_getx/app/helper/costume_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                Obx(
                  () => CusDropDown<String>(
                    label: 'Fakultas',
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
                Obx(
                  () => CusDropDown<String>(
                    label: 'Prodi',
                    hint: controller.dataUniv.selectedFakultas.value.isEmpty
                        ? 'Pilih Fakultas'
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
                Obx(
                  () => CusDropDown(
                    label: 'Semester',
                    hint: 'Pilih Semester',
                    items: controller.dataUniv.listSemester,
                    selectedValue: controller.dataUniv.selectedSemester.value,
                    onChanged: (value) {
                      controller.dataUniv.selectedSemester.value = value;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => CusDropDown(
                    label: 'Role',
                    hint: 'Pilih Role',
                    items: controller.dataUniv.listRole,
                    selectedValue: controller.dataUniv.selectedRole.value,
                    onChanged: (value) {
                      controller.dataUniv.selectedRole.value = value;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addMahasiswa();
                    },
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15.h),
                      ),
                      elevation: WidgetStatePropertyAll(0),
                      backgroundColor: WidgetStatePropertyAll(Colors.amber),
                      minimumSize: WidgetStatePropertyAll(
                        Size(double.infinity, 40.h),
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                    child: Text(
                      'Tambah Data',
                      style: TextStyle(color: Colors.white),
                    ),
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
