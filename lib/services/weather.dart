import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String api = 'fa8ae1fddb735bd16147a55cfde9a358';

class WeatherModel {
  int temp;
  String cityName;
  int condition;
  WeatherModel();

  String getWeatherIcon() {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();
    var latitude = location.getLatitude();
    var longitude = location.getLongitude();
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      this.temp = jsonResponse['main']['temp'];
      this.condition = jsonResponse['weather'][0]['id'];
      this.cityName = jsonResponse['name'];
    } else {
      print(response.statusCode);
    }
  }
}
