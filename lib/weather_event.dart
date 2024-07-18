part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class FetchWeatherEvent extends WeatherEvent {
  final Position position;

  FetchWeatherEvent(this.position);
}