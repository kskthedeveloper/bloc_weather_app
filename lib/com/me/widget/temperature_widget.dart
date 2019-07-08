import 'package:bloc_weather_app/com/me/bloc/setting/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class TemperatureWidget extends StatelessWidget {
  final double temperature;
  final double low;
  final double high;
  final TemperatureUnit unit;

  TemperatureWidget({Key key, this.temperature, this.low, this.high, this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            '${_formattedTemperature(temperature)}°',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w600),
          ),
        ),
        Column(
          children: [
            Text(
              'max: ${_formattedTemperature(high)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              'min: ${_formattedTemperature(low)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
              ),
            )
          ],
        )
      ],
    );
  }

  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

  int _formattedTemperature(double t) =>
      unit == TemperatureUnit.FAHRENHEIT ? _toFahrenheit(t) : t.round();
}
