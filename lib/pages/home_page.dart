import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/weather_model.dart';
import 'package:flutter_application_4/pages/search_page.dart';
import 'package:flutter_application_4/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SearchPage();
                    }),
                  );
                },
                icon: Icon(Icons.search))
          ],
          title: Text('Weather App'),
        ),
        body: weatherData == null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('There is no weather today',
                        style: TextStyle(fontSize: 20)),
                    Text('Search now', style: TextStyle(fontSize: 20))
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [weatherData!.getColor(), Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 3),
                      Column(
                        children: [
                          Text(Provider.of<WeatherProvider>(context).cityName!,
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold)),
                          Text('Updated at ' +
                              Provider.of<WeatherProvider>(context)
                                  .weatherData!
                                  .date!),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(Provider.of<WeatherProvider>(context)
                              .weatherData!
                              .getImage()),
                          Text('${weatherData!.temp!.toInt()}'),
                          Column(
                            children: [
                              Text('max temp:${weatherData!.maxTemp!.toInt()}'),
                              Text('min temp: ${weatherData!.minTemp!.toInt()}')
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Text(weatherData!.weatherStateName!,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Spacer(flex: 5)
                    ]),
              ));
  }
}
