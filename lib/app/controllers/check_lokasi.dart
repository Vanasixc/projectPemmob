import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> checkLokasi(
  double kampusLat,
  double kampusLng,
  double radius,
) async {
  
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    Fluttertoast.showToast(msg: 'Harap nyalakan GPS Handphone anda');
    return false;
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      Fluttertoast.showToast(msg: 'Izin lokasi ditolak');
      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    Fluttertoast.showToast(
      msg: 'Harap nyalakan pengaturan izin lokasi di menu setting',
    );
    return false;
  }

  final posisiSekarang = await Geolocator.getCurrentPosition();

  final jarak = Geolocator.distanceBetween(
    posisiSekarang.latitude,
    posisiSekarang.longitude,
    kampusLat,
    kampusLng,
  );

  debugPrint('Jarak dari kampus: $jarak');

  return jarak <= radius;
}
