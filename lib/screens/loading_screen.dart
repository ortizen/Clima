import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weather = new WeatherModel();

  @override
  void initState() {
    super.initState();
    changePage();
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

  Future<void> changePage() async {
    await weather.getLocation();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weather: weather,
        ),
      ),
    );
  }
}
