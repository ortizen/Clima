import 'package:geolocator/geolocator.dart';

class Location {
  Geolocator _geoLocator = Geolocator();
  Position _userLocation;

  Location() {
    _getLocation().then((position) {
      _userLocation = position;
    });
  }

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await _geoLocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      currentLocation = null;
      print(e.toString());

    }
    return currentLocation;
  }

  double getLatitude() {
    return this._userLocation.latitude;
  }
}
