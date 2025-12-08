import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hasil_absensi_controller.dart';

class HasilAbsensiView extends GetView<HasilAbsensiController> {
  const HasilAbsensiView({super.key});
  @override
  Widget build(BuildContext context) {
    final bool done = controller.status;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Status Absensi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: done ? Colors.green : Colors.red,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Icon(
                  done ? Icons.check : Icons.close,
                  color: done ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mata Kuliah: ${controller.mataKuliah}'),
                      Text('Pertemuan: ${controller.pertemuan.toString()}'),
                      Text('Waktu: ${controller.waktu}'),
                      Text('Status: ${done ? "Berhasil" : "Gagal"}'),
                      Text('Keterangan: ${controller.keterangan}'),
                    ],
                  ),
                ),
              ),
        
              Spacer(),
        
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.HOME),
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
