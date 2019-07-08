import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_weather_app/com/me/bloc/setting/setting_bloc.dart';
import 'package:bloc_weather_app/com/me/bloc/setting/setting_event.dart';
import 'package:bloc_weather_app/com/me/bloc/setting/setting_state.dart';

class SettingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingBloc = BlocProvider.of<SettingBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          BlocBuilder(
              bloc: settingBloc,
              builder: (_, SettingState state ){
                return ListTile(
                  title: Text(
                      'Temperature Units'
                  ),
                  isThreeLine: true,
                  subtitle: Text('Use metric measurements for temperature unis.'),
                  trailing: Switch(
                    value: state.temperatureUnit == TemperatureUnit.CELSIUS,
                    onChanged: (_) =>
                        settingBloc.dispatch(TemperatureUnitsToggled()),
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}