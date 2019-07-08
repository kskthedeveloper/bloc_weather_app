import 'package:equatable/equatable.dart';

enum WeatherCondition {
  SNOW,
  SLEET,
  HAIL,
  THUNDERSTORM,
  HEAVY_RAIN,
  LIGHT_RAIN,
  SHOWERS,
  HEAVY_CLOUD,
  LIGHT_CLOUD,
  CLEAR,
  UNKNOWN
}

class Weather extends Equatable {
  final WeatherCondition condition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;

  Weather({
    this.condition,
    this.formattedCondition,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.locationId,
    this.created,
    this.lastUpdated,
    this.location,
  }): super([
    condition,
    formattedCondition,
    minTemp,
    maxTemp,
    locationId,
    created,
    lastUpdated,
    location
  ]);

  static Weather fromJson(dynamic json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    return Weather(
      condition: _mapStringToWeatherCondition(
          consolidatedWeather['weather_state_abbr']
      ),
      formattedCondition: consolidatedWeather['weather_state_name'],
      minTemp: consolidatedWeather['min_temp'] as double,
      temp: consolidatedWeather['the_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      locationId: json['woeid'] as int,
      created: consolidatedWeather['created'],
      lastUpdated: DateTime.now(),
      location: json['title'],
    );
  }

  static WeatherCondition _mapStringToWeatherCondition(String input) {
    WeatherCondition state;
    switch (input) {
      case 'sn':
        state = WeatherCondition.SNOW;
        break;
      case 'sl':
        state = WeatherCondition.SLEET;
        break;
      case 'h':
        state = WeatherCondition.HAIL;
        break;
      case 't':
        state = WeatherCondition.THUNDERSTORM;
        break;
      case 'hr':
        state = WeatherCondition.HEAVY_RAIN;
        break;
      case 'lr':
        state = WeatherCondition.LIGHT_RAIN;
        break;
      case 's':
        state = WeatherCondition.SHOWERS;
        break;
      case 'hc':
        state = WeatherCondition.HEAVY_CLOUD;
        break;
      case 'lc':
        state = WeatherCondition.LIGHT_CLOUD;
        break;
      case 'c':
        state = WeatherCondition.SLEET;
        break;
      default:
        state = WeatherCondition.UNKNOWN;
    }
    return state;
  }
}