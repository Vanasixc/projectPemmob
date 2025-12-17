import 'package:get/get.dart';

class DataUniv extends GetxController {
  //Dropdown
  List<String> listRole = ['Mahasiswa', 'Dosen', 'Admin'];

  List<int> listSemester = List.generate(14, (i) => i + 1);
  List<int> pertemuan = List.generate(16, (i) => i + 1);

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

  Map<String, String> listMkProdi = {
    'IF204 - Pemrograman Mobile': 'Ilmu Komputer',
    'IF201 - Basis Data': 'Ilmu Komputer',
    'FS101 - Fisika Dasar': 'Fisika',
  };

  // selected Data
  RxnString selectedRole = RxnString();
  RxnInt selectedSemester = RxnInt();
  RxString selectedFakultas = RxString("");
  RxString selectedProdi = RxString("");
  RxnInt selectedPertemuan = RxnInt();

  List<String> get currentProdi {
    if (selectedFakultas.value.isEmpty) {
      return [];
    } else {
      return listProdi[selectedFakultas.value] ?? [];
    }
  }
}
