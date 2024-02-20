import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/Weather_model.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import '../../Services/Weather_Services.dart';


//Create Cubit
class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(IntialState());
  WeatherModel? weathermodel;
//Create Function
  getWeather({required String cityName}) async {
    try {
       weathermodel =
          await Weatherservice().getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weathermodel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
