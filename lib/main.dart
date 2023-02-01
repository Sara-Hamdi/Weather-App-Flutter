import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/weather_model.dart';
import 'package:flutter_application_4/pages/home_page.dart';
import 'package:flutter_application_4/providers/weather_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context).weatherData ==
                  null
              ? Colors.deepPurple
              : Provider.of<WeatherProvider>(context).weatherData!.getColor()),
      home: HomePage(),
    );
  }
}
