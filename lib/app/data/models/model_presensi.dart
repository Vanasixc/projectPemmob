// To parse this JSON data, do
//
//     final presensi = presensiFromJson(jsonString);

import 'dart:convert';

Presensi presensiFromJson(String str) => Presensi.fromJson(json.decode(str));

String presensiToJson(Presensi data) => json.encode(data.toJson());

class Presensi {
    String kelasId;
    String dosenId;
    String matakuliahId;
    int pertemuan;
    String token;
    bool isActive;
    DateTime createdAt;
    DateTime startAt;
    DateTime endAt;

    Presensi({
        required this.kelasId,
        required this.dosenId,
        required this.matakuliahId,
        required this.pertemuan,
        required this.token,
        required this.isActive,
        required this.createdAt,
        required this.startAt,
        required this.endAt,
    });

    factory Presensi.fromJson(Map<String, dynamic> json) => Presensi(
        kelasId: json["kelasId"],
        dosenId: json["dosenId"],
        matakuliahId: json["matakuliahId"],
        pertemuan: json["pertemuan"],
        token: json["token"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        startAt: DateTime.parse(json["startAt"]),
        endAt: DateTime.parse(json["endAt"]),
    );

    Map<String, dynamic> toJson() => {
        "kelasId": kelasId,
        "dosenId": dosenId,
        "matakuliahId": matakuliahId,
        "pertemuan": pertemuan,
        "token": token,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "startAt": startAt.toIso8601String(),
        "endAt": endAt.toIso8601String(),
    };
}
