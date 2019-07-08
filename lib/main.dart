import 'package:bloc_weather_app/com/me/bloc/setting/setting_bloc.dart';
import 'package:bloc_weather_app/com/me/repository/weather_api_client.dart';
import 'package:bloc_weather_app/com/me/widget/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;
import 'com/me/repository/weather_repository.dart';

void main() {
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client()
    )
  );

  runApp(MyApp(weatherRepository: weatherRepository));
}

class MyApp extends StatefulWidget {
  final WeatherRepository weatherRepository;

  MyApp({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SettingBloc _settingBloc = SettingBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _settingBloc,
      child: MaterialApp(
        title: 'Flutter Bloc Weather App',
        home: WeatherWidget(weatherRepository: widget.weatherRepository),
      ),
    );
  }

  @override
  void dispose() {
    _settingBloc.dispose();
    super.dispose();
  }
}
