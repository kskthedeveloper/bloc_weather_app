import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

enum TemperatureUnit {
  FAHRENHEIT,
  CELSIUS
}

class SettingState extends Equatable {
  final TemperatureUnit temperatureUnit;

  SettingState({@required this.temperatureUnit})
      : assert(temperatureUnit != null),
        super([temperatureUnit]);
}