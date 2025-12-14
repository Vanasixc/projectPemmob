import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buat_presensi_controller.dart';

class BuatPresensiView extends GetView<BuatPresensiController> {
  const BuatPresensiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuatPresensiView'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'BuatPresensiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
