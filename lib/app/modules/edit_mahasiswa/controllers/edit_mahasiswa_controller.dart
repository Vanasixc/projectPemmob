import 'package:belajar_getx/app/controllers/profile_controller.dart';
import 'package:belajar_getx/app/data/data_univ.dart';
import 'package:belajar_getx/app/data/models/model_mahasiswa.dart';
import 'package:belajar_getx/app/services/services_mahasiswa.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditMahasiswaController extends GetxController {
  //Path ke gambar profile
  RxString photoPath = ''.obs;
  final profileImage = Get.find<ProfileController>();

  // get model yang sama dari detail mahasiswa
  final modelMahasiswa mhs = Get.arguments;

  final service = Get.find<ServicesMahasiswa>();

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
    //inisialisasi textfield awal
    namaController.text = mhs.nama;
    nimController.text = mhs.nim;

    //inisialisasi variable dropdown
    dataUniv.selectedFakultas.value = mhs.fakultas;
    dataUniv.selectedProdi.value = mhs.prodi;
    dataUniv.selectedSemester.value = mhs.semester;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> updateMahasiswa() async {
    // ambil nilai terbaru dari form
    final newName = namaController.text.trim();
    final newNim = nimController.text.trim();

    // update model baru dikirim ke services
    mhs.nama = newName;
    mhs.nim = newNim;

    mhs.fakultas = dataUniv.selectedFakultas.value;
    mhs.prodi = dataUniv.selectedProdi.value;
    mhs.semester = dataUniv.selectedSemester.value!;

    if (photoPath.value.isNotEmpty) {
      mhs.profilePath = photoPath.value;
    }

    await service.updateMahasiswa(mhs);
  }

  Future<void> choiceImage(String nim) async {
    final picked = await profileImage.pickImage();
    if (picked == null) return;

    final savedPath = await profileImage.saveImage(picked, nim);
    photoPath.value = savedPath;
  }
}
