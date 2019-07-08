import 'package:bloc/bloc.dart';
import 'package:bloc_weather_app/com/me/bloc/setting/setting_event.dart';
import 'package:bloc_weather_app/com/me/bloc/setting/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  @override
  get initialState => SettingState(temperatureUnit: TemperatureUnit.CELSIUS);

  @override
  Stream<SettingState> mapEventToState(SettingState currentState,
      SettingEvent event,) async* {
    if (event is TemperatureUnitsToggled) {
      yield SettingState(
          temperatureUnit:
          currentState.temperatureUnit == TemperatureUnit.CELSIUS
              ? TemperatureUnit.FAHRENHEIT
              : TemperatureUnit.CELSIUS
      );
    }
  }
}