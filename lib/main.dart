import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/features/home_view/cubit/weather_cubit.dart';
import 'package:weather_application/features/home_view/cubit/weather_states.dart';
import 'package:weather_application/features/home_view/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          final condition = context.watch<WeatherCubit>().weatherModel?.weatherCondition;
          final color = getWeatherColor(condition);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: color,
              //scaffoldBackgroundColor: color.shade200,
              appBarTheme: AppBarTheme(
                backgroundColor: color,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              textTheme:  TextTheme(
                bodyMedium: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
            home:  HomeView(),
          );
        },
      ),
    );
  }


}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) return Colors.blueGrey;
  condition = condition.toLowerCase();

  if (condition.contains('sunny') || condition.contains('clear')) {
    return Colors.amber;
  } else if (condition.contains('partly cloudy') ||
      condition.contains('cloudy') ||
      condition.contains('overcast')) {
    return Colors.blueGrey;
  } else if (condition.contains('mist') || condition.contains('fog')) {
    return Colors.grey;
  } else if (condition.contains('rain with thunder') ||
      condition.contains('thundery')) {
    return Colors.deepPurple;
  } else if (condition.contains('rain') ||
      condition.contains('drizzle') ||
      condition.contains('shower')) {
    return Colors.blue;
  } else if (condition.contains('snow')) {
    return Colors.lightBlue;
  } else if (condition.contains('freezing')) {
    return Colors.cyan;
  } else if (condition.contains('sleet') ||
      condition.contains('ice pellets')) {
    return Colors.teal;
  } else if (condition.contains('blizzard')) {
    return Colors.indigo;
  } else {
    return Colors.blueGrey;
  }
}
