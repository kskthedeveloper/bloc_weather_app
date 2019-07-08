import 'package:bloc_weather_app/com/me/widget/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'com/me/repository/weather_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final WeatherRepository weatherRepository;

  MyApp({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Weather App',
      home: WeatherWidget(weatherRepository: widget.weatherRepository),
    );
  }
}
