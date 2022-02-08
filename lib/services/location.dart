import 'package:geolocator/geolocator.dart';
import 'package:clima_flutter/services/services.dart';
import 'package:http/http.dart' as http;

class Location {
  static const _apiKey = 'd9fef39db70df40005846c93a1725360';
  static const _baseURl = 'api.openweathermap.org';

  static Future<Position> _getCurrentPosition() async {
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    return position;
  }

  static Future<Weather> getCurrentWeather() async {
    final pos = await _getCurrentPosition();
    final url = Uri.https(_baseURl, "data/2.5/weather", {
      'lat': pos.latitude.toString(),
      'lon': pos.longitude.toString(),
      'appid': _apiKey,
    });
    final response = await http.get(url);
    final currentWeather = CurrentWeather.fromJson(response.body);
    return currentWeather.weather[0];
  }
}
