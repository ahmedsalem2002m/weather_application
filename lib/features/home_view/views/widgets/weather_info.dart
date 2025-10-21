import 'package:flutter/material.dart';
import 'package:weather_application/features/home_view/data/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherModel? weatherModel;
  const WeatherInfo({super.key, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            weatherModel?.cityName ?? "unName",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at ${weatherModel?.date.hour}:${weatherModel?.date.minute}',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network("https:${weatherModel!.image}"),
              Text(
                weatherModel!.temp.toString(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('maxTemp : ${weatherModel?.maxTemp.round()}'),
                  Text('minTemp : ${weatherModel?.minTemp.round()}'),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            weatherModel!.weatherCondition,
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
    );
  }
}
