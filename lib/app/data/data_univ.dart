import 'package:get/get.dart';

class DataUniv extends GetxController {
  //Dropdown
  List<String> listRole = ['Mahasiswa', 'Dosen', 'Admin'];
  List<int> listSemester = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
  List<String> listFakultas = [
    "Matematika dan Ilmu Pengetahuan Alam",
    "Teknik",
    "Ekonomi Bisnis",
  ];

  Map<String, List<String>> listProdi = {
    "Matematika dan Ilmu Pengetahuan Alam": [
      "Matematika",
      "Fisika",
      "Kimia",
      "Biologi",
      "Ilmu Komputer",
      "Statistika",
    ],
    "Teknik": [
      "Teknik Informatika",
      "Teknik Mesin",
      "Teknik Elektro",
      "Teknik Industri",
    ],
    "Ekonomi Bisnis": ["Akuntansi", "Manajemen", "Ilmu Ekonomi"],
  };


  //Selected Data
  RxnString selectedRole = RxnString();
  RxnInt selectedSemester = RxnInt();
  RxString selectedFakultas = RxString("");
  RxString selectedProdi = RxString("");

  List<String> get currentProdi {
    if (selectedFakultas.value.isEmpty) {
      return [];
    } else {
      return listProdi[selectedFakultas.value] ?? [];
    }
  }
}
