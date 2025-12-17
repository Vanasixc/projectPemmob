// To parse this JSON data, do
//
//     final mataKuliah = mataKuliahFromJson(jsonString);

import 'dart:convert';

MataKuliah mataKuliahFromJson(String str) =>
    MataKuliah.fromJson(json.decode(str));

String mataKuliahToJson(MataKuliah data) => json.encode(data.toJson());

class MataKuliah {
  String kode;
  String nama;
  int semester;
  String prodi;
  bool aktif;

  MataKuliah({
    required this.kode,
    required this.nama,
    required this.semester,
    required this.prodi,
    required this.aktif,
  });

  factory MataKuliah.fromJson(Map<String, dynamic> json) => MataKuliah(
    kode: json["kode"],
    nama: json["nama"],
    semester: json["semester"],
    prodi: json["prodi"],
    aktif: json["aktif"],
  );

  Map<String, dynamic> toJson() => {
    "kode": kode,
    "nama": nama,
    "semester": semester,
    "prodi": prodi,
    "aktif": aktif,
  };
}
