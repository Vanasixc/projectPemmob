import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  size: 100,
                ),
              ),
              SizedBox(height: 20),
              Card(
                color: Color(0xffFFF6DA),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mata Kuliah: ${controller.mataKuliah}'),
                      Text('Pertemuan: ${controller.pertemuan.toString()}'),
                      Text('Tanggal: ${controller.waktu.split(' ')[0]}'),
                      Text(
                        'Waktu : ${controller.waktu.split(' ')[1].split(".")[0]}',
                      ),
                      Text('Status: ${done ? "Berhasil" : "Gagal"}'),
                      Text('Keterangan: ${controller.keterangan}'),
                    ],
                  ),
                ),
              ),

              Spacer(),

              ElevatedButton(
                onPressed: () => Get.offAllNamed(Routes.HOME),
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 15.h),
                  ),
                  elevation: WidgetStatePropertyAll(0),
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  minimumSize: WidgetStatePropertyAll(Size(344.w, 40.h)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
