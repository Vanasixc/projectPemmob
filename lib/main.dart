import 'package:belajar_getx/app/controllers/auth_controllers.dart';
import 'package:belajar_getx/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthControllers(), permanent: true);
      }),
      debugShowCheckedModeBanner: false,
      title: "QRSense",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
