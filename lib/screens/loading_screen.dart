import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.lightGreenAccent,
          size: 100.0,
        ),
      ),
    );
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();
    this.latitude = location.getLatitude();
    this.longitude = location.getLongitude();
    getWeather();
  }

  Future<void> getWeather() async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api';
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse['main']['temp']);
      print(jsonResponse['weather'][0]['id']);
      print(jsonResponse['name']);
    } else {
      print(response.statusCode);
    }
  }
}
