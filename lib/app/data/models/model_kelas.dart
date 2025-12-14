// To parse this JSON data, do
//
//     final kelas = kelasFromJson(jsonString);

import 'dart:convert';

Kelas kelasFromJson(String str) => Kelas.fromJson(json.decode(str));

String kelasToJson(Kelas data) => json.encode(data.toJson());

class Kelas {
    String dosenId;
    String matakuliahId;
    String namaKelas;

    Kelas({
        required this.dosenId,
        required this.matakuliahId,
        required this.namaKelas,
    });

    factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        dosenId: json["dosenId"],
        matakuliahId: json["matakuliahId"],
        namaKelas: json["namaKelas"],
    );

    Map<String, dynamic> toJson() => {
        "dosenId": dosenId,
        "matakuliahId": matakuliahId,
        "namaKelas": namaKelas,
    };
}
