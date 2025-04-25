import 'package:flutter/material.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String message;

  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = 'Error';
      message = 'Unable to get weather data';
      cityName = '';
      return;
    }

    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
    message = weather.getMessage(temperature);
    cityName = weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$temperature°', style: TextStyle(fontSize: 80)),
            Text(weatherIcon, style: TextStyle(fontSize: 80)),
            Text('$message in $cityName!'),
          ],
        ),
      ),
    );
  }
}
