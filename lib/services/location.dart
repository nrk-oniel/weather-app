import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;
  var timeLimit = Duration(seconds: 10);

  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location Services are disabled');
      } else {
        print('Location is enabled');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location Permission are denied');
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true);

      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);
    } catch (e) {
      print(e);
    }
  }
}
