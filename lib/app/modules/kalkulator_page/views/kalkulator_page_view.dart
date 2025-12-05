import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kalkulator_page_controller.dart';

class KalkulatorPageView extends GetView<KalkulatorPageController> {
  const KalkulatorPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KalkulatorPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Selamat datang', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
