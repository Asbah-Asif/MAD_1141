import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  static const String apiKey = '05c9aea841f2869704ad99ad77ed0c11';

  // ✅ 1. Fetch Weather using lat/lon
  Future<Weather> fetchWeather(double lat, double lon) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return Weather.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // ✅ 2. Get coordinates from city name
  Future<Map<String, double>> getCoordinates(String city) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data.isNotEmpty) {
        return {
          'lat': (data[0]['lat'] as num).toDouble(),
          'lon': (data[0]['lon'] as num).toDouble(),
        };
      } else {
        throw Exception('City not found');
      }
    } else {
      throw Exception('Failed to fetch coordinates');
    }
  }
}