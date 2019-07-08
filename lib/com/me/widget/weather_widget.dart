import 'dart:async';
import 'package:bloc_weather_app/com/me/bloc/weather_state.dart';
import 'package:bloc_weather_app/com/me/widget/setting_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_weather_app/com/me/bloc/fetch_weather.dart';
import 'package:bloc_weather_app/com/me/bloc/weather_bloc.dart';
import 'package:bloc_weather_app/com/me/repository/weather_repository.dart';
import 'package:bloc_weather_app/com/me/widget/city_selection_widget.dart';
import 'package:bloc_weather_app/com/me/widget/combined_weather_temperature.dart';
import 'package:bloc_weather_app/com/me/widget/last_updated_widget.dart';
import 'package:bloc_weather_app/com/me/widget/location_widget.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatefulWidget {
  final WeatherRepository weatherRepository;

  WeatherWidget({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  WeatherBloc _weatherBloc;
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    _weatherBloc = WeatherBloc(weatherRepository: widget.weatherRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fultter Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => SettingWidget()
              ));
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySelectionWidget(),
                ),
              );
              if(city != null) {
                _weatherBloc.dispatch(FetchWeather(city: city));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (_, WeatherState state) {

            if(state is WeatherEmpty) {
              return Center (
                child: Text('Pleas Select a Location'),
              );
            }

            if (state is WeatherLoading) {
              return Center (
                child: CircularProgressIndicator(),
              );
            }

            if (state is WeatherLoaded) {
              final weather = state.weather;

              _refreshCompleter?.complete();
              _refreshCompleter = Completer();

              return RefreshIndicator(
                onRefresh: () {
                  _weatherBloc.dispatch(
                    RefreshWeather(city: state.weather.location)
                  );
                  return _refreshCompleter.future;
                },
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Center(
                        child: LocationWidget(
                          location: weather.location,
                        ),
                      ),
                    ),
                    Center(
                      child: LastUpdatedWidget(dateTime: weather.lastUpdated),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.0),
                      child: Center(
                        child: CombineWeatherTemperatureWidget(
                          weather: weather
                        ),
                      ),
                    )
                  ],
                ),
              );
            }

            if(state is WeatherError) {
              return Text(
                'Something went wrong',
                style: TextStyle(
                    color: Colors.red
                ),
              );
            }
          }
        ),
      ),
    );
  }

  @override
  void dispose() {
    _weatherBloc.dispose();
    super.dispose();
  }
}

