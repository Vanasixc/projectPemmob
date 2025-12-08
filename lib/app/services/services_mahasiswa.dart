import 'package:belajar_getx/app/models/model_mahasiswa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String collectionName = "mahasiswa";

class ServicesMahasiswa {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late final CollectionReference _mahasiswa;

  //Constructor
  ServicesMahasiswa() {
    _mahasiswa = _firestore
        .collection(collectionName)
        .withConverter<modelMahasiswa>(
          fromFirestore: (snapshot, _) =>
              modelMahasiswa.fromJson(snapshot.data()!),
          toFirestore: (mahasiswa, _) => mahasiswa.toJson(),
        );
  }

  //Services
  //Add data
  Future<void> addMahasiswa(modelMahasiswa mahasiswa) async {
    await _mahasiswa.add(mahasiswa);
  }

  //Delete data
  Future<void> deleteMahasiswa(String nim) async {
    await _mahasiswa.doc(nim).delete();
  }

  //Update data
  Future<void> updateMahasiswa(modelMahasiswa mahasiswa) async {
    await _mahasiswa.doc(mahasiswa.nim).update(mahasiswa.toJson());
  }
}
