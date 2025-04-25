import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location.dart';

const apiKey = 'YOUR_API_KEY_HERE';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    var url = '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      return null;
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) return '🌩';
    if (condition < 400) return '🌧';
    if (condition < 600) return '☔️';
    if (condition < 700) return '☃️';
    if (condition < 800) return '🌫';
    if (condition == 800) return '☀️';
    if (condition <= 804) return '☁️';
    return '🤷‍';
  }

  String getMessage(int temp) {
    if (temp > 25) return 'It’s 🍦 time';
    if (temp > 20) return 'Time for shorts and 👕';
    if (temp < 10) return 'You’ll need 🧣 and 🧤';
    return 'Bring a 🧥 just in case';
  }
}
