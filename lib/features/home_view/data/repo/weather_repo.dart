import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_application/features/home_view/data/models/weather_model.dart';

class WeatherRepo {
  final Dio dio = Dio();
  final String apiKey = "6b9d662e2ed9436b832161045242104";
  final String baseUrl = "https://api.weatherapi.com/v1";

  Future<WeatherModel?> getWeatherResponse({required String cityName}) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3",
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data["error"]["message"] ??
          "oops there was an error, try later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error, try later");
    }
  }
}
