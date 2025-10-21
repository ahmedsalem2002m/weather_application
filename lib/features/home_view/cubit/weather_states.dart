import 'package:weather_application/features/home_view/data/models/weather_model.dart';

abstract class WeatherState{}
class WeatherInitialState extends WeatherState{}
class WeatherLoadedState extends WeatherState{}

class WeatherSuccessState extends WeatherState{
  final WeatherModel? weatherModel;

  WeatherSuccessState({this.weatherModel});
}

class WeatherFailureState extends WeatherState{
  final String error;

  WeatherFailureState({required this.error});
}
