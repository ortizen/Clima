import 'package:geolocator/geolocator.dart';

class Location {
  Geolocator _geolocator;
  Position _userLocation;

  Location() {
    this._geolocator = Geolocator();
    _getLocation().then((value) {
      _userLocation = value;
    });
  }
  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await _geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  double getLatitude() {
    return this._userLocation.latitude;
  }

  double getLongitude() {
    return this._userLocation.longitude;
  }
}
