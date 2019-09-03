import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude;
  double _longitude;

  Future<void> getLocation() async {
    try {
      Position currentLocation = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _latitude = currentLocation.latitude;
      _longitude = currentLocation.longitude;
      
    } catch (e) {
      print(e.toString());
    }
  }

  double getLatitude() {
    return this._latitude;
  }

  double getLongitude() {
    return this._longitude;
  }
}
