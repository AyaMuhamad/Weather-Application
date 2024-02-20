import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/View/Search_view.dart';

class Noweatherpage extends StatelessWidget {
  const Noweatherpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather App"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'there is no weather 😔 start',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'searching now 🔍',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
        ));
  }
}
