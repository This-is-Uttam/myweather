import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(LoadingState());
      try {
        WeatherFactory weatherFactory = WeatherFactory("6fb6e31e077d6528da98d6bd36f2fabc");
        Weather w = await weatherFactory.currentWeatherByLocation(event.position.latitude, event.position.longitude);
        print("Weather :"+ w.toString());
        emit(LoadingSuccessState(w));
      } catch(e) {
        emit(LoadingFailureState());
        print("Error: "+ e.toString());

      }
    });
  }
}
