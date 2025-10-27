import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/features/home_view/cubit/weather_cubit.dart';
import 'package:weather_application/features/home_view/data/models/weather_model.dart';
import 'package:weather_application/main.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key,});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel!;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getWeatherColor(weatherModel.weatherCondition),
              getWeatherColor(weatherModel.weatherCondition)[300]!,
              getWeatherColor(weatherModel.weatherCondition)[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network("https:${weatherModel.image}"),
                Text(
                  weatherModel.temp.toString(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text('maxTemp : ${weatherModel.maxTemp.round()}'),
                    Text('minTemp : ${weatherModel.minTemp.round()}'),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              weatherModel.weatherCondition,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
