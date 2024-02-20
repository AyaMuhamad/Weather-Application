import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

import '../Models/Weather_model.dart';
import '../main.dart';
import 'Search_view.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weathermodel})
      : super(key: key);
  //first way
  final WeatherModel weathermodel;
  @override
  Widget build(BuildContext context) {
    //secod way
    // weatherModel = BlocProvider.of<GetWeatherCubit>(context)
      //  .weathermodel; // best if tree is has alotof branches
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
             colors: [
            getColor(weathermodel.weathercondition),
            getColor(weathermodel.weathercondition)[300]!,
            getColor(weathermodel.weathercondition)[50]!
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weathermodel.cityname,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                'updated at ${weathermodel.date.hour}:${weathermodel.date.minute}',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https:${weathermodel.image}",
                  ),
                  Text(
                    weathermodel.temp.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Maxtemp: ${weathermodel.maxtemp.round()}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Mintemp: ${weathermodel.mintemp.round()}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                weathermodel.weathercondition,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
