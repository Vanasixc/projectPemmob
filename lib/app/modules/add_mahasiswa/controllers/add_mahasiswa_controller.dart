import 'package:belajar_getx/app/data/models/model_mahasiswa.dart';
import 'package:belajar_getx/app/services/services_mahasiswa.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../data/data_univ.dart';

class AddMahasiswaController extends GetxController {
  //Visibility icon
  final RxBool isHidden = true.obs;

  //Ambil data dari DataUniv
  final dataUniv = Get.find<DataUniv>();

  //Textfield controller
  final nimController = TextEditingController();
  final fakultasController = TextEditingController();
  final namaController = TextEditingController();
  final passwordController = TextEditingController();
  final prodiController = TextEditingController();

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
    final fakultas = dataUniv.selectedFakultas.value;
    final prodi = dataUniv.selectedProdi.value;
    final semester = dataUniv.selectedSemester.value;

    // cek role
    if (dataUniv.selectedRole.value == null) {
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
      role: dataUniv.selectedRole.value!,
      profilePath: '',
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
    namaController.clear();
    nimController.clear();
    passwordController.clear();
    dataUniv.selectedSemester.value = null;
    dataUniv.selectedRole.value = null;
    dataUniv.selectedFakultas.value = '';
    dataUniv.selectedProdi.value = '';
  }
}
