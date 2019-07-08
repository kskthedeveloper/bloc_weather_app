import 'package:meta/meta.dart';

import 'package:bloc_weather_app/com/me/model/weather.dart';
import 'package:bloc_weather_app/com/me/repository/weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}