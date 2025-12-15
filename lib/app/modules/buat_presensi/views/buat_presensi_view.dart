import 'package:belajar_getx/app/controllers/auth_controllers.dart';
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
                    const SizedBox(height: 20),
                    const Text(
                      'Waktu Mulai',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 5),
                    Center(
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: () => controller.pickStart(context),
                          child: Text(
                            controller.startAt.value == null
                                ? 'Pilih waktu mulai'
                                : controller.startAt.value.toString(),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Waktu Berakhir',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: () => controller.pickEnd(context),
                          child: Text(
                            controller.endAt.value == null
                                ? 'Pilih waktu berakhir'
                                : controller.endAt.value.toString(),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Center(
                      child: Obx(
                        () => ElevatedButton.icon(
                          onPressed: controller.loadingLokasi.value
                              ? null
                              : controller.ambilLokasiSekarang,
                          icon: const Icon(Icons.my_location),
                          label: const Text('Ambil Lokasi Sekarang'),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Latitude',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    CusTextField(
                      controller: controller.latController,
                      readOnly: true,
                      boldLabel: true,
                    ),

                    const SizedBox(height: 20),
                    const Text(
                      'Longitude',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    CusTextField(
                      controller: controller.lngController,
                      readOnly: true,
                      boldLabel: true,
                    ),

                    const SizedBox(height: 20),
                    const Text(
                      'Radius (meter)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Obx(
                      () => CusDropDown<int>(
                        hint: 'Pilih Radius',
                        items: controller.radiusOptions,
                        selectedValue: controller.selectedRadius.value,
                        onChanged: (val) {
                          if (val != null)
                            controller.selectedRadius.value = val;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.createPresensi(
                      Get.find<AuthControllers>().docId.value!, // id dosen
                    );
                  },
                  child: const Text('Create Presensi'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
