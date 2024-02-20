import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'View/homeview.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    //provide Function
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weathermodel
                      ?.weathercondition,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getColor(String? condition) {
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.yellow;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.deepPurple;
    case 'Fog':
      return Colors.grey;
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy light drizzle':
    case 'Light drizzle':
      return Colors.lightBlue;
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.blue;
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
      return Colors.lightBlue;
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.blue;
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blue;
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.lightBlue;
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
      return Colors.lightBlue;
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return Colors.blue;
    case 'Ice pellets':
      return Colors.blue;
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.lightBlue;
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.lightBlue;
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
