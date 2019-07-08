import 'package:bloc_weather_app/com/me/model/weather.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class WeatherConditionWidget extends StatelessWidget {
  final WeatherCondition condition;

  WeatherConditionWidget({Key key, @required this.condition})
      : assert(condition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(condition);

  Image _mapConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.CLEAR:
      case WeatherCondition.LIGHT_CLOUD:
        image = Image.asset('assets/clear.png');
        break;
      case WeatherCondition.HAIL:
      case WeatherCondition.SNOW:
      case WeatherCondition.SLEET:
        image = Image.asset('assets/snow.png');
        break;
      case WeatherCondition.HEAVY_CLOUD:
        image = Image.asset('assets/cloudy.png');
        break;
      case WeatherCondition.HEAVY_RAIN:
      case WeatherCondition.LIGHT_RAIN:
      case WeatherCondition.SHOWERS:
        image = Image.asset('assets/rainy.png');
        break;
      case WeatherCondition.THUNDERSTORM:
        image = Image.asset('assets/thunderstorm.png');
        break;
      case WeatherCondition.UNKNOWN:
        image = Image.asset('assets/clear.png');
        break;
    }
    return image;
  }

}