import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';

class MapController {
  fetchCurrentLocation() async {
    Location location = Location();
    bool _serviceEnabled = await location.serviceEnabled();
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return await fetchCurrentLocation();
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied ||
        _permissionGranted == PermissionStatus.deniedForever) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return await fetchCurrentLocation();
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
}
