import 'package:belajar_getx/app/helper/costume_widgets.dart';
import 'package:belajar_getx/app/modules/buat_presensi/controllers/buat_presensi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuatPresensiView extends GetView<BuatPresensiController> {
  const BuatPresensiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Presensi'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mata Kuliah',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Obx(
                      () => CusDropDown<String>(
                        hint: 'Pilih Mata Kuliah',
                        items: controller.listMataKuliah,
                        selectedValue:
                            controller.selectedMataKuliah.value.isEmpty
                            ? null
                            : controller.selectedMataKuliah.value,
                        onChanged: (val) {
                          controller.selectedMataKuliah.value = val!;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      'Kelas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    CusTextField(
                      controller: controller.kelasController,
                      label: 'Contoh: 2.3.1',
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      'Pertemuan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    CusTextField(
                      controller: controller.pertemuanController,
                      isAngka: true,
                      label: 'Pertemuan ke-',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.createPresensi();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[700],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Create Presensi',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
