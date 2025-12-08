import 'package:belajar_getx/app/controllers/auth_controllers.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Future<QuerySnapshot<Map<String, dynamic>>> getData() async =>
      await FirebaseFirestore.instance.collection('mahasiswa').get();

  @override
  Widget build(BuildContext context) {

    final authC = Get.find<AuthControllers>();

    return Scaffold(
      backgroundColor: Colors.amber,
      body: FutureBuilder<DocumentSnapshot?>(
        future: authC.getMahasiswa(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (!snapshot.hasData) {
            return Center(child: Text('Data tidak ada'));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 50),
                      Text(
                        'Selamat datang di QRSense',
                        style: TextStyle(fontSize: 21, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Halo ${snapshot.data!.get('nama')}!',
                        style: TextStyle(fontSize: 21, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'NIM: ${snapshot.data!.get('NIM')}',
                        style: TextStyle(fontSize: 21, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Fakultas: ${snapshot.data!.get('fakultas')}',
                        style: TextStyle(fontSize: 21, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Prodi: ${snapshot.data!.get('prodi')}',
                        style: TextStyle(fontSize: 21, color: Colors.white),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Semester: ${snapshot.data!.get('semester'.toString())}',
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
                                      Get.toNamed(Routes.ABSENSI);
                                    },
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      child: Card(
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                      Get.defaultDialog(
                                        title:
                                            'Apakah anda yakin ingin keluar?',
                                        middleText:
                                            'Setelah keluar, anda perlu Login kembali',
                                        textCancel: 'Batal',
                                        textConfirm: 'Keluar',
                                        buttonColor: Colors.red[400],
                                        cancelTextColor: Colors.black,

                                        onConfirm: () =>
                                            Get.offNamed(Routes.LOGIN),
                                      );
                                    },
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      child: Card(
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
