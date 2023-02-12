import 'package:admin_aplication/data/models/latlong/lat_long.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel() {
    fetchCurrentLocation();
    listenCurrentLocation();
  }

  LatLong? latLong;

  Location location = Location();

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  Future<void> fetchCurrentLocation() async {
//1- qadam location qurilmada enable yoki disable ekanini tekshiradi
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

//2- qadam lakatsiyaga permission oladi

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // lakatsiyani oladi
    LocationData locationData = await location.getLocation();
    latLong = LatLong(
      lattitude: locationData.latitude!,
      longitude: locationData.longitude!,
    );
    await Future.delayed(const Duration(seconds: 3));
    notifyListeners();
  }

  listenCurrentLocation() {
    location.onLocationChanged.listen(
      (event) {
        // print("LOCATION CHANGED: ${event.longitude}, ${event.latitude}");
      },
    );
  }
}
