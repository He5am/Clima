// ignore_for_file: unused_import, library_private_types_in_public_api, use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors, avoid_print, curly_braces_in_flow_control_structures, unused_local_variable, use_build_context_synchronously
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
import 'package:permission_handler/permission_handler.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationwather();
     var status = await Permission.location.status;
    if (await Permission.location.request().isGranted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationweather: weatherData,
        );
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 75,
        ),
      ),
    );
  }
}
