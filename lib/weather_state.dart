part of 'weather_bloc.dart';


@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

class LoadingState extends WeatherState {}

class LoadingSuccessState extends WeatherState {
  final Weather weather;

  LoadingSuccessState(this.weather);
}

class LoadingFailureState extends WeatherState {}
