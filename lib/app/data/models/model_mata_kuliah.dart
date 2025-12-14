// To parse this JSON data, do
//
//     final mataKuliah = mataKuliahFromJson(jsonString);

import 'dart:convert';

MataKuliah mataKuliahFromJson(String str) => MataKuliah.fromJson(json.decode(str));

String mataKuliahToJson(MataKuliah data) => json.encode(data.toJson());

class MataKuliah {
    String kode;
    String nama;
    int semester;
    String prodi;

    MataKuliah({
        required this.kode,
        required this.nama,
        required this.semester,
        required this.prodi,
    });

    factory MataKuliah.fromJson(Map<String, dynamic> json) => MataKuliah(
        kode: json["kode"],
        nama: json["nama"],
        semester: json["semester"],
        prodi: json["prodi"],
    );

    Map<String, dynamic> toJson() => {
        "kode": kode,
        "nama": nama,
        "semester": semester,
        "prodi": prodi,
    };
}
