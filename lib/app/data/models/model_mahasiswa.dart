// To parse this JSON data, do
//
//     final mahasiswa = mahasiswaFromJson(jsonString);

import 'dart:convert';

modelMahasiswa mahasiswaFromJson(String str) => modelMahasiswa.fromJson(json.decode(str));

String mahasiswaToJson(modelMahasiswa data) => json.encode(data.toJson());

class modelMahasiswa {
    String nim;
    String fakultas;
    String nama;
    String password;
    String prodi;
    int semester;
    String role;

    modelMahasiswa({
        required this.nim,
        required this.fakultas,
        required this.nama,
        required this.password,
        required this.prodi,
        required this.semester,
        required this.role,
    });

    factory modelMahasiswa.fromJson(Map<String, dynamic> json) => modelMahasiswa(
        nim: json["NIM"],
        fakultas: json["fakultas"],
        nama: json["nama"],
        password: json["password"],
        prodi: json["prodi"],
        semester: json["semester"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "NIM": nim,
        "fakultas": fakultas,
        "nama": nama,
        "password": password,
        "prodi": prodi,
        "semester": semester,
        "role": role,
    };
}