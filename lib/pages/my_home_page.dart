import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../weather_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && <= 232:
        return Image.asset("assets/thunder.png");
      case >= 300 && <= 321:
        return Image.asset("assets/light_rain.png");
      case >= 500 && <= 531:
        return Image.asset("assets/rain.png");
      case >= 600 && <= 622:
        return Image.asset("assets/snow.png");
      case >= 700 && <= 781:
        return Image.asset("assets/clouds.png");
      case 800:
        return Image.asset("assets/sunny.png");
      case >= 800 && <= 804:
        return Image.asset("assets/sun_cloud.png");
      case > 200 && <= 232:
        return Image.asset("assets/thunder.png");
    }
    throw (e) {
      e.toString();
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(1.2, -0.2),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff72afd3)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.2, -0.2),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff72afd3)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.0),
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle, color: Color(0xff37ecba)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is LoadingSuccessState) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Welcome to,",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "My Weather,",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    state.weather.areaName.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              getWeatherIcon(
                                  state.weather.weatherConditionCode as int),
                              Align(
                                alignment: AlignmentDirectional.topCenter,
                                child: Text(
                                  "${state.weather.temperature!.celsius!.round()}°C",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 46,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  " (Feels like: ${state.weather.tempFeelsLike!.celsius!.floor()}°C)",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  state.weather.weatherMain
                                      .toString()
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  DateFormat("EEEE, hh:mm a")
                                      .format(state.weather.date as DateTime),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/sunny.png",
                                        height: 54,
                                        width: 54,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Sunrise",
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            DateFormat("hh:mm a").format(state
                                                .weather.sunrise as DateTime),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/moon.png",
                                        height: 54,
                                        width: 54,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Sunset",
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            DateFormat("hh:mm a").format(state
                                                .weather.sunset as DateTime),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Divider(
                                height: 1,
                                color: Colors.white12,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/temp_max.png",
                                        height: 54,
                                        width: 54,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Temp Max",
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            "${state.weather.tempMax!.celsius!.round().toString()}°C",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/temp_min.png",
                                        height: 54,
                                        width: 54,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Temp Min",
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            "${state.weather.tempMin!.celsius!.round().toString()}°C",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (state is LoadingFailureState) {
                    return const Scaffold(
                      body: Center(
                          child: Text("Something wrong Loading failure!!")),
                    );
                  } else {
                    return const Scaffold(
                      body: Center(child: Text("Getting things ready!!")),
                    );
                  }
                },
              )
            ],
          )),
    );
  }
}

/*Image.network(
                          "https://www.theenvironment.in/wp-content/uploads/2024/05/WEATHER.jpg",
                        ),
                        Image(
                          image: NetworkImage(
                            "https://t4.ftcdn.net/jpg/02/66/38/15/360_F_266381525_alVrbw15u5EjhIpoqqa1eI5ghSf7hpz7.jpg",
                          ),
                        )*/
