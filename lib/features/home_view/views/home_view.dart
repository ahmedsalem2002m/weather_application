import 'package:flutter/material.dart';
import 'package:weather_application/features/home_view/views/widgets/no_body_weather.dart';
import 'package:weather_application/features/home_view/views/widgets/weather_info.dart';
import 'package:weather_application/features/search_view/views/search_view.dart';

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
      body: WeatherInfo(),
    );
  }
}
