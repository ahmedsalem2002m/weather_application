import 'package:flutter/material.dart';

class NoBodyWeather extends StatelessWidget {
  const NoBodyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 26,
              ),
            )
          ],
        ),

    );
  }
}
