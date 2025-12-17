import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

class HasilQrController extends GetxController {
  final GlobalKey qrKey = GlobalKey();

  /// get token
  String get token {
    final args = Get.arguments as Map<String, dynamic>?;
    final sessionId = args?['sessionId']?.toString() ?? '';
    return sessionId.isEmpty ? '' : 'SESSION_$sessionId';
  }

  Future<Uint8List?> _captureQrPng() async {
    try {
      final boundary =
          qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return null;

      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (_) {
      return null;
    }
  }

  /// SHARE QR
  Future<void> shareQr() async {
    await Future.delayed(const Duration(milliseconds: 50));

    final t = token;
    if (t.isEmpty) {
      Get.snackbar('Gagal', 'sessionId tidak ditemukan');
      return;
    }

    final pngBytes = await _captureQrPng();
    if (pngBytes == null) {
      Get.snackbar('Gagal', 'QR gagal diambil sebagai gambar');
      return;
    }

    final dir = await getTemporaryDirectory();
    final file = File(
      '${dir.path}/qr_${DateTime.now().millisecondsSinceEpoch}.png',
    );
    await file.writeAsBytes(pngBytes);

    await Share.shareXFiles([XFile(file.path)], text: 'QR Presensi: $t');
  }
}
