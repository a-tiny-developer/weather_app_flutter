import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:clima_flutter/services/services.dart';
import 'package:http/http.dart' as http;

class Location {
  static const _apiKey = 'd9fef39db70df40005846c93a1725360';
  static const _baseURl = 'api.openweathermap.org';

  static final currentWeatherController =
      StreamController<CurrentWeather?>.broadcast();
  static final currentWeatherSgream = currentWeatherController.stream;

  static Future<Position> _getCurrentPosition() async {
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    return position;
  }

  static Future<CurrentWeather> getCurrentWeather() async {
    final Position pos = await _getCurrentPosition();
    final url = Uri.https(_baseURl, "data/2.5/weather", {
      'lat': pos.latitude.toString(),
      'lon': pos.longitude.toString(),
      'appid': _apiKey,
      'units': 'metric',
    });
    final response = await http.get(url);
    return CurrentWeather.fromJson(response.body);
  }

  static Future<CurrentWeather> getCityWeather(String city) async {
    final url = Uri.https(_baseURl, "data/2.5/weather", {
      'q': city,
      'appid': _apiKey,
      'units': 'metric',
    });
    final response = await http.get(url);
    return CurrentWeather.fromJson(response.body);
  }

  static Future<void> updateCurrentWeather([String? city]) async {
    currentWeatherController.addError(StreamBuilderProgress());

    try {
      city == null
          ? currentWeatherController.add(await getCurrentWeather())
          : currentWeatherController.add(await getCityWeather(city));
    } catch (_) {
      currentWeatherController.addError(HttpError);
    }
  }
}

class StreamBuilderProgress extends Error {}

class HttpError extends Error {}
