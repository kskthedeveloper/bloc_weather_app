
import 'package:bloc/bloc.dart';
import 'package:bloc_weather_app/com/me/bloc/fetch_weather.dart';
import 'package:bloc_weather_app/com/me/bloc/weather_state.dart';
import 'package:bloc_weather_app/com/me/model/weather.dart';
import 'package:bloc_weather_app/com/me/repository/weather_repository.dart';
import 'package:meta/meta.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(
      WeatherState currentState,
      WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      } catch(_) {
        yield WeatherError();
      }
    }

  }
}
