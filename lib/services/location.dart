import 'package:geolocator/geolocator.dart';

class Location {
  static double latitude = 0;
  static double longitude = 0;

  static Future<void> getCurrentLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
