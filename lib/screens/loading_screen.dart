import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/services.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLatitude();
  }

  Future<void> getLatitude() async {
    await Location.getCurrentLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(child: Text(Location.latitude.toString())),
    );
  }
}
