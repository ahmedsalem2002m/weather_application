
abstract class WeatherState{}
class WeatherInitialState extends WeatherState{}
class WeatherLoadedState extends WeatherState{}

class WeatherSuccessState extends WeatherState{
}

class WeatherFailureState extends WeatherState{
  final String error;

  WeatherFailureState({required this.error});
}
