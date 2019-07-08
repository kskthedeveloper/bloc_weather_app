import 'dart:async';
import 'package:bloc_weather_app/com/me/repository/weather_repository.dart';
import 'package:bloc_weather_app/com/me/widget/combined_weather_temperature.dart';
import 'package:bloc_weather_app/com/me/widget/last_updated_widget.dart';
import 'package:bloc_weather_app/com/me/widget/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherWidget extends StatefulWidget {
  final WeatherRepository weatherRepository;

  WeatherWidget({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fultter Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute());
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(),
              );
            },
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Center(
                child: LocationWidget(
                  location: "Yangon",
                ),
              ),
            ),
            Center(
              child: LastUpdatedWidget(dateTime: DateTime.now()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombineWeatherTemperatureWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

