import 'package:belajar_getx/app/models/model_mahasiswa.dart';
import 'package:belajar_getx/app/services/services_mahasiswa.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddMahasiswaController extends GetxController {
  //TODO: Implement AddMahasiswaController

  //Visibility icon
  final RxBool isHidden = true.obs;

  //Dropdown
  List<String> listRole = ['Mahasiswa', 'Dosen', 'Admin'];
  List<int> listSemester = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
  RxString selectedRole = ''.obs;
  RxnInt selectedSemester = RxnInt();

  //Textfield controller
  final nimController = TextEditingController();
  final fakultasController = TextEditingController();
  final namaController = TextEditingController();
  final passwordController = TextEditingController();
  final prodiController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Code untuk mengirim data mahasiswa ke database firebase
  final _service = ServicesMahasiswa();

  Future<void> addMahasiswa() async {
    final nama = namaController.text.trim();
    final nim = nimController.text.trim();
    final pass = passwordController.text.trim();
    final fakultas = fakultasController.text.trim();
    final prodi = prodiController.text.trim();
    final semester = selectedSemester.value;

    // cek role
    if (selectedRole.value.isEmpty) {
      Fluttertoast.showToast(msg: 'Harap pilih role terlebih dahulu');
      return;
    }

    if (semester == null) {
      Fluttertoast.showToast(msg: 'Harap pilih semester terlebih dahulu');
      return;
    }

    // cek field kosong
    if (nama.isEmpty) {
      Fluttertoast.showToast(msg: 'Nama tidak boleh kosong');
      return;
    } else if (nim.isEmpty) {
      Fluttertoast.showToast(msg: 'NIM tidak boleh kosong');
      return;
    } else if (pass.isEmpty) {
      Fluttertoast.showToast(msg: 'Password tidak boleh kosong');
      return;
    } else if (fakultas.isEmpty) {
      Fluttertoast.showToast(msg: 'Fakultas tidak boleh kosong');
      return;
    } else if (prodi.isEmpty) {
      Fluttertoast.showToast(msg: 'Prodi tidak boleh kosong');
      return;
    }

    final newMhs = modelMahasiswa(
      nim: nim,
      fakultas: fakultas,
      nama: nama,
      password: pass,
      prodi: prodi,
      semester: semester,
      role: selectedRole.value,
    );

    try {
      await _service.addMahasiswa(newMhs);
      Fluttertoast.showToast(msg: 'Data: ${newMhs.nama} berhasil ditambahkan');
      clearForm();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Gagal menambahkan data');
    }
  }

  //Untuk clear form
  void clearForm() {
    nimController.clear();
    fakultasController.clear();
    namaController.clear();
    passwordController.clear();
    prodiController.clear();
    selectedSemester.value = null;
    selectedRole.value = '';
  }
}
