import 'dart:developer';

import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Search a city"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextFormField(
            onFieldSubmitted: (value){
              log(value);
            },
            // maxLines: 2,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 28,horizontal: 8),
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
