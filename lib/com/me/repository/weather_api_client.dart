import 'dart:convert';

import 'package:bloc_weather_app/com/me/model/weather.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;


class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com/';
  static const locationUrl = '$baseUrl/api/location';
  final http.Client httpClient;

  WeatherApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<int> getLocationId(String city) async {
    final cityUrl = '$locationUrl/search/?query=$city';
    final locationResponse = await this.httpClient.get(cityUrl);

    if(locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;

    return (locationJson.first)['woeid'];
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = '$locationUrl/$locationId';
    final weatherResponse = await this.httpClient.get(weatherUrl);

    if(weatherResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }
}