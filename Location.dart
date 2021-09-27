<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
// This is probably the only one you need. Background location is supported
// by this -- the caveat is that a blue badge is shown in the status bar
// when the app is using location service while in the background.
NSLocationWhenInUseUsageDescription

// Deprecated, use NSLocationAlwaysAndWhenInUseUsageDescription instead.
NSLocationAlwaysUsageDescription

// Use this very carefully. This key is required only if your iOS app
// uses APIs that access the user’s location information at all times,
// even if the app isn't running.
NSLocationAlwaysAndWhenInUseUsageDescription
UIBackgroundModes
location
NSLocationWhenInUseUsageDescription
NSLocationAlwaysUsageDescription
import 'package:location/location.dart';
Location location = new Location();

bool _serviceEnabled;
PermissionStatus _permissionGranted;
LocationData _locationData;

_serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
    return;
  }
}

_permissionGranted = await location.hasPermission();
if (_permissionGranted == PermissionStatus.denied) {
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.granted) {
    return;
  }
}

_locationData = await location.getLocation();
location.onLocationChanged.listen((LocationData currentLocation) {
  // Use current location
});
location.enableBackgroundMode(enable: true)
class LocationData {
  final double latitude; // Latitude, in degrees
  final double longitude; // Longitude, in degrees
  final double accuracy; // Estimated horizontal accuracy of this location, radial, in meters
  final double altitude; // In meters above the WGS 84 reference ellipsoid
  final double speed; // In meters/second
  final double speedAccuracy; // In meters/second, always 0 on iOS
  final double heading; // Heading is the horizontal direction of travel of this device, in degrees
  final double time; // timestamp of the LocationData
  final bool isMock; // Is the location currently mocked
}


enum LocationAccuracy {
  powerSave, // To request best accuracy possible with zero additional power consumption,
  low, // To request "city" level accuracy
  balanced, // To request "block" level accuracy
  high, // To request the most accurate locations available
  navigation // To request location for navigation usage (affect only iOS)
}

// Status of a permission request to use location services.
enum PermissionStatus {
  /// The permission to use location services has been granted.
  granted,
  // The permission to use location services has been denied by the user. May have been denied forever on iOS.
  denied,
  // The permission to use location services has been denied forever by the user. No dialog will be displayed on permission request.
  deniedForever
}