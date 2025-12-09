import 'package:belajar_getx/app/helper/costume_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.qr_code_2, color: Colors.white, size: 50),
                Text(
                  'QRSense',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
                      SizedBox(height: 30),
                      CusTextField(
                        controller: controller.nimController,
                        label: 'NIM',
                        isAngka: true,
                        usePrefixIcon: true,
                        prefixIcon: Icon(Icons.email),
                      ),
                      SizedBox(height: 30),
                      Obx(
                        () => CusTextField(
                          controller: controller.passwordController,
                          label: 'Password',
                          isHidden: controller.isHidden.value,
                          isPassword: true,
                          usePrefixIcon: true,
                          prefixIcon: Icon(Icons.password),
                          onToggleVisibility: () =>
                              controller.isHidden.toggle(),
                        ),
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: WidgetStatePropertyAll(5),
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.amber,
                            ),
                          ),
                          onPressed: () async => controller.isLogin(),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
