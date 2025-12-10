import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_mahasiswa_controller.dart';

class DetailMahasiswaView extends GetView<DetailMahasiswaController> {
  const DetailMahasiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailMahasiswaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailMahasiswaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
