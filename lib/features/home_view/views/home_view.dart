import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/features/home_view/cubit/weather_cubit.dart';
import 'package:weather_application/features/home_view/views/widgets/no_body_weather.dart';
import 'package:weather_application/features/home_view/views/widgets/weather_info.dart';
import 'package:weather_application/features/search_view/views/search_view.dart';

import '../../../main.dart';
import '../cubit/weather_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (buildContext) => SearchView()),
                );
              },
              icon: Icon(Icons.search),
            ),
          ),
        ],
        title: Text("Weather App"),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoBodyWeather();
          } else if (state is WeatherLoadedState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccessState) {
            return WeatherInfo(weatherModel: state.weatherModel,);
          } else {
            return Text("opps there was an error");
          }
        },
      ),
    );
  }
}
