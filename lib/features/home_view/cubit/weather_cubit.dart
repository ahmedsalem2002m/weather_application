import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/features/home_view/cubit/weather_states.dart';
import 'package:weather_application/features/home_view/data/models/weather_model.dart';

import '../data/repo/weather_repo.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit():super(WeatherInitialState());
  final WeatherRepo weatherRepo = WeatherRepo();

  getWeather({required String cityName}) async {
    try {
       emit(WeatherLoadedState());
      WeatherModel? weatherModel = await weatherRepo.getWeatherResponse(
        cityName: cityName,
      );
      emit(WeatherSuccessState(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailureState(error: e.toString()));
    }
  }
}
