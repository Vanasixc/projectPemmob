import 'package:belajar_getx/app/controllers/auth_controllers.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 30.h,
                      horizontal: 30.w,
                    ),
                    width: 484.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -25,
                          right: 0,
                          child: Image.asset(
                            'assets/Mhs.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang di QRSense',
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 37.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 22.w,
                                vertical: 30.h,
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFECB2),
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'NAMA',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        'NIM',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        'FAKULTAS',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        'PRODI',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        'SEMESTER',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 15.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snapshot.data!.get('nama')}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        '${snapshot.data!.get('NIM')}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      SizedBox(
                                        width: 250.w,
                                        child: Text(
                                          '${snapshot.data!.get('fakultas')}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        '${snapshot.data!.get('prodi')}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        '${snapshot.data!.get('semester')}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                          Center(
                            child: Text(
                              'MENU',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Ganti
                                      if (snapshot.data!.get('role') ==
                                          'Admin') {
                                        Get.toNamed(Routes.BUAT_PRESENSI);
                                      } else {
                                        Get.toNamed(Routes.ABSENSI);
                                      }
                                    },
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      child: Card(
                                        color: Color(0xFFFFECB2),
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
                                              // ganti
                                              snapshot.data!.get('role') ==
                                                      'Admin'
                                                  ? 'Buat Presensi'
                                                  : 'Absensi',
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
                                      if (snapshot.data!.get('role') ==
                                          'Admin') {
                                        Get.toNamed(Routes.LIST_MAHASISWA);
                                      } else {
                                        final authC =
                                            Get.find<AuthControllers>();
                                        debugPrint(
                                          'DOC ID: ${authC.docId.value}',
                                        );
                                        Get.toNamed(Routes.PERKULIAHAN);
                                      }
                                    },
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      child: Card(
                                        color: Color(0xFFFFECB2),
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
                                              snapshot.data!.get('role') ==
                                                      'Admin'
                                                  ? 'List Mahasiswa'
                                                  : 'Perkuliahan',
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
                                      if (snapshot.data!.get('role') ==
                                          'Admin') {
                                        Get.toNamed(Routes.ADD_MAHASISWA);
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: 'Fitur ini masih dikembangkan',
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      child: Card(
                                        color: Color(0xFFFFECB2),
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
                                              snapshot.data!.get('role') ==
                                                      'Admin'
                                                  ? 'Add Mahasiswa'
                                                  : 'Profile',
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
                                        color: Color(0xFFFFECB2),
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
