import 'dart:io';

import 'package:geolocator/geolocator.dart';

class SetLocation {
  static Future<Position?> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return null;
    }
    Position? position;
    if (Platform.isAndroid) {
      position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(accuracy: LocationAccuracy.high),
      );
    } else if (Platform.isIOS) {
      position = await Geolocator.getCurrentPosition(
        locationSettings: AppleSettings(accuracy: LocationAccuracy.best),
      );
    }
    return position;
  }
}
