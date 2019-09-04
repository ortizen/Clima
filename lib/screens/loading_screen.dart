import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String api = 'fa8ae1fddb735bd16147a55cfde9a358';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('No input'),
          Text('No input'),
        ],
      ),
    );
  }

  void getLocationData() async {
    Location location = Location();
    await location.getLocation();
    this.latitude = location.getLatitude();
    this.longitude = location.getLongitude();
    NetworkHelper helper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api');
    var weatherData = await helper.getData();
    double temperature = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    String cityName = weatherData['name'];
  }
}
