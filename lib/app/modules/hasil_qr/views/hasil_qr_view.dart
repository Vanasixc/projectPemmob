import 'package:belajar_getx/app/modules/hasil_qr/controllers/hasil_qr_controller.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HasilQrView extends GetView<HasilQrController> {
  const HasilQrView({super.key});

  @override
  Widget build(BuildContext context) {
    final token = controller.token;

    if (token.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('sessionId tidak ditemukan')),
      );
    }

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
              RepaintBoundary(
                key: controller.qrKey,
                child: QrImageView(
                  data: token,
                  size: 250,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                token,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.shareQr,
                    child: const Text('Share QR'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => Get.offNamed(Routes.HOME),
                    child: const Text('Home'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
