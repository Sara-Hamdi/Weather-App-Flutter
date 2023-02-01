import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_4/providers/weather_provider.dart';
import 'package:flutter_application_4/services/weather_service.dart';
import 'package:flutter_application_4/models/weather_model.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cityName;
    return Scaffold(
        appBar: AppBar(
          title: Text('Search a city'),
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                      label: Text('Search'),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 17),
                      hintText: 'Enter a city',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          WeatherService service = WeatherService();
                          service.getWeather(cityName: cityName!);
                          WeatherModel? weather =
                              await service.getWeather(cityName: cityName);
                          Provider.of<WeatherProvider>(context, listen: false)
                              .cityName = cityName;
                          Provider.of<WeatherProvider>(context, listen: false)
                              .weatherData = weather;
                          Navigator.pop(context);
                        },
                      )),
                  onChanged: (data) {
                    cityName = data;
                  },
                  onSubmitted: (data) async {
                    cityName = data;
                    WeatherService service = WeatherService();
                    service.getWeather(cityName: cityName!);
                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Navigator.pop(context);
                  },
                ))));
  }
}
