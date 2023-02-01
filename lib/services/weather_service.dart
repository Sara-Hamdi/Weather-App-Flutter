import 'package:http/http.dart' as http;
import 'package:flutter_application_4/models/weather_model.dart';
import 'dart:convert';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '9b03308d640e432898d34424232101';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
      return weather;
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
