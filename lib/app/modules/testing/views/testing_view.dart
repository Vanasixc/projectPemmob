import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/testing_controller.dart';

class TestingView extends GetView<TestingController> {
  const TestingView({super.key});
  @override
  Widget build(BuildContext context) {
    final documentId = Get.arguments as String;

    CollectionReference mahasiswa = FirebaseFirestore.instance.collection(
      'mahasiswa',
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing data di firestore'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: mahasiswa.doc(documentId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }
              if (snapshot.hasData && !snapshot.data!.exists) {
                return Center(child: Text('Data tidak ada'));
              }

              if(snapshot.connectionState == ConnectionState.done){
                final data = snapshot.data!.data() as Map<String, dynamic>;
                return Center(
                  child: Column(
                    children: [
                      Text(data['nama']),
                      Text(data['NIM']),
                      Text(data['prodi']),
                      Text(data['fakultas']),
                      Text(data['semester'].toString()),
                    ],
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
      ),
    );
  }
}
