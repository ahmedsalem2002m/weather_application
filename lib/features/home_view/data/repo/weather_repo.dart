import 'package:dio/dio.dart';
import 'package:weather_application/features/home_view/data/models/weather_model.dart';

class WeatherRepo {
  final Dio dio = Dio();

  Future<WeatherModel> getWeatherResponse({required String cityName}) async {
    Response response = await dio.get(
      "https://api.weatherapi.com/v1/forecast.json?key=6b9d662e2ed9436b832161045242104&q=$cityName&days=3",
    );
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
}
