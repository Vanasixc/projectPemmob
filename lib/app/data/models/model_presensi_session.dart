// To parse this JSON data, do
//
//     final presensiSession = presensiSessionFromJson(jsonString);

import 'dart:convert';

PresensiSession presensiSessionFromJson(String str) =>
    PresensiSession.fromJson(json.decode(str));

String presensiSessionToJson(PresensiSession data) =>
    json.encode(data.toJson());

class PresensiSession {
  String mk;
  int pertemuan;
  String createdBy;
  DateTime createdAt;
  bool isActive;
  double lat;
  double lng;
  int radius;

  PresensiSession({
    required this.mk,
    required this.pertemuan,
    required this.createdBy,
    required this.createdAt,
    required this.isActive,
    required this.lat,
    required this.lng,
    required this.radius,
  });

  factory PresensiSession.fromJson(Map<String, dynamic> json) =>
      PresensiSession(
        mk: json["mk"],
        pertemuan: json["pertemuan"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        isActive: json["isActive"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        radius: json["radius"],
      );

  Map<String, dynamic> toJson() => {
    "mk": mk,
    "pertemuan": pertemuan,
    "createdBy": createdBy,
    "createdAt": createdAt.toIso8601String(),
    "isActive": isActive,
    "lat": lat,
    "lng": lng,
    "radius": radius,
  };
}
