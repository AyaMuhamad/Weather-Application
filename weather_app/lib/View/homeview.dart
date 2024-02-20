import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/View/Noweatherpage.dart';
import 'package:weather_app/View/weather_info_body.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  
//integrate Cubit
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is IntialState) {
          return const Noweatherpage();
        } else if (state is WeatherLoadedState) {
          return  WeatherInfoBody(
            weathermodel: state.weathermodel,
          );
        } else {
          return const Text("OOPS , there was an error , Try again");
        }
      },
    );
  }
}
