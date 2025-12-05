import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
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
                Icon(Icons.add, color: Colors.white, size: 30),
                Text(
                  'Absensi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 90),
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ), // Warna bayangan dan transparansi
                              spreadRadius:
                                  5, // Seberapa jauh bayangan menyebar
                              blurRadius: 5, // Tingkat keburaman
                              offset: Offset(
                                0,
                                3,
                              ), // Pergeseran bayangan (x, y)
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ), // Warna bayangan dan transparansi
                              spreadRadius:
                                  5, // Seberapa jauh bayangan menyebar
                              blurRadius: 5, // Tingkat keburaman
                              offset: Offset(
                                0,
                                3,
                              ), // Pergeseran bayangan (x, y)
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
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
                          onPressed: () {
                            controller.login(
                              controller.usernameController.text,
                              controller.passwordController.text,
                            );
                          },
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
