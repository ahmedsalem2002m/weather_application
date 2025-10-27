import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/features/home_view/cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a city"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextFormField(
            onFieldSubmitted: (value)  {
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName: value);
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }            },
            // maxLines: 2,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 28, horizontal: 8),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              hintText: "Enter city name",
              labelText: "Search",
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
