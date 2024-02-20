import 'package:dio/dio.dart';
import 'package:weather_app/Models/Weather_model.dart';

class Weatherservice {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '2195b1bffc9640d0840162523230212';

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weathermodel = WeatherModel.fromjson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error!, try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops there was an error!, try later');
    }
  }
}
