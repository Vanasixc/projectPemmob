import 'package:belajar_getx/app/modules/hasil_qr/controllers/hasil_qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HasilQrView extends GetView<HasilQrController> {
  const HasilQrView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final token = args['token'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Presensi'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(data: token, size: 250),
              const SizedBox(height: 20),
              Text(
                token,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // nanti bisa screenshot / share
                  Get.back();
                },
                child: const Text('Simpan QR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
