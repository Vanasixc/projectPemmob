import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/add_mahasiswa_controller.dart';

class AddMahasiswaView extends GetView<AddMahasiswaController> {
  const AddMahasiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: Obx(
        () => SafeArea(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: controller.namaController,
                    decoration: InputDecoration(
                      label: Text('Nama'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controller.nimController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      label: Text('NIM'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: controller.isHidden.value,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      label: Text('Password'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffix: IconButton(
                        icon: Icon(
                          controller.isHidden.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () => controller.isHidden.value =
                            !controller.isHidden.value,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controller.fakultasController,
                    decoration: InputDecoration(
                      label: Text('Fakultas'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controller.prodiController,
                    decoration: InputDecoration(
                      label: Text('Prodi'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InputDecorator(
                    decoration: InputDecoration(
                      label: Text('Semester'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Pilih Semester'),
                      value: controller.selectedSemester.value,
                      items: controller.listSemester.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedSemester.value = value;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  InputDecorator(
                    decoration: InputDecoration(
                      label: Text('Role'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Pilih role'),
                      value: controller.selectedRole.value.isEmpty
                          ? null
                          : controller.selectedRole.value,
                      items: controller.listRole.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedRole.value = value.toString();
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
      ),
    );
  }
}
