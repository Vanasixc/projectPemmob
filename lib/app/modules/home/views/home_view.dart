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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 50),
                Text(
                  // 'Halo ${controller.username}! Selamat datang di aplikasi kami',
                  'Selamat datang di aplikasi kami',
                  style: TextStyle(fontSize: 21, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  'Fakultas: Matematika dan Ilmu Pengetahuan Alam',
                  style: TextStyle(fontSize: 21, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  'Prodi: Ilmu Komputer',
                  style: TextStyle(fontSize: 21, color: Colors.white),
                ),
                SizedBox(height: 15),
                Text(
                  'Semester: 5',
                  style: TextStyle(fontSize: 21, color: Colors.white),
                ),
                SizedBox(height: 15),
              ],
            ),
            SizedBox(height: 27),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(
                                  msg: 'Nah ini ke halaman absen',
                                );
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        'https://img.icons8.com/?size=100&id=vfiytIbdyR2f&format=png&color=000000',
                                        scale: 1.6,
                                      ),
                                      Text(
                                        'Absensi',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(
                                  msg: 'Fitur ini masih dikembangkan',
                                );
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        'https://img.icons8.com/?size=100&id=12776&format=png&color=000000',
                                        scale: 1.6,
                                      ),
                                      Text(
                                        'Perkuliahan',
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(
                                  msg: 'Fitur ini masih dikembangkan',
                                );
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        'https://img.icons8.com/?size=100&id=20749&format=png&color=000000',
                                        scale: 1.6,
                                      ),
                                      Text(
                                        'Profile',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(
                                  msg:
                                      'Ini harusnya muncul semacam pop up buat confirm log out',
                                );
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        'https://img.icons8.com/?size=100&id=119068&format=png&color=000000',
                                        scale: 1.6,
                                      ),
                                      Text(
                                        'Logout',
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
