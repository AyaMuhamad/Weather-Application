import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/Weather_model.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import '../Services/Weather_Services.dart';

WeatherModel? weathermodel;

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (String data) async {
              var getWeathercubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeathercubit.getWeather(CityName: data);
              Navigator.pop(context);
            },

            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('search'),
              suffixIcon: GestureDetector(child: Icon(Icons.search)),
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
