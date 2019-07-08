import 'package:bloc_weather_app/com/me/model/weather.dart';
import 'package:bloc_weather_app/com/me/widget/temperature_widget.dart';
import 'package:bloc_weather_app/com/me/widget/weather_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CombineWeatherTemperatureWidget extends StatelessWidget {
  final Weather weather;

  CombineWeatherTemperatureWidget({Key key, @required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: WeatherConditionWidget(condition: weather.condition),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TemperatureWidget(
                temperature: weather.temp,
                high: weather.minTemp,
                low: weather.minTemp,
              ),
            )
          ],
        ),
        Center(
          child: Text(
            weather.formattedCondition,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ],
    );
  }
}
