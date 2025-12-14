import 'package:belajar_getx/app/data/models/model_mahasiswa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

const String collectionName = "mahasiswa";

class ServicesMahasiswa {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late final CollectionReference _mahasiswa;

  //Constructor
  ServicesMahasiswa() {
    _mahasiswa = firestore
        .collection(collectionName)
        .withConverter<modelMahasiswa>(
          fromFirestore: (snapshot, _) =>
              modelMahasiswa.fromJson(snapshot.data()!, uId: snapshot.id),
          toFirestore: (mahasiswa, _) => mahasiswa.toJson(),
        );
  }

  //Services
  //Add data
  Future<void> addMahasiswa(modelMahasiswa mahasiswa) async {
    await _mahasiswa.add(mahasiswa);
  }

  //Delete data

  Future<void> deleteMahasiswa(modelMahasiswa mahasiswa) async {
    if (mahasiswa.uId != null) {
      await _mahasiswa.doc(mahasiswa.uId).delete();
    } else {
      Fluttertoast.showToast(msg: 'Data tidak ada');
    }
  }

  //Update data
  Future<void> updateMahasiswa(modelMahasiswa mahasiswa) async {
    if (mahasiswa.uId == null) {
      throw Exception('Mahasiswa id (docId) null, tidak bisa update');
    }

    await firestore
        .collection(collectionName)
        .doc(mahasiswa.uId)
        .update(mahasiswa.toJson());
  }
}
