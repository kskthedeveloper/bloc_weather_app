import 'package:bloc_weather_app/com/me/model/weather.dart';
import 'package:bloc_weather_app/com/me/widget/temperature_widget.dart';
import 'package:bloc_weather_app/com/me/widget/weather_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CombineWeatherTemperatureWidget extends StatelessWidget {

  CombineWeatherTemperatureWidget({Key key})
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
              child: WeatherConditionWidget(condition: WeatherCondition.LIGHT_CLOUD),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TemperatureWidget(
                temperature: 30,
                high: 35,
                low: 20,
              ),
            )
          ],
        ),
        Center(
          child: Text(
            "CLOUDY",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
