import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var city = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  iconSize: 50,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_city),
                    hintText: 'Enter City Name',
                  ),
                  onChanged: (value) {
                    city = value;
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Location.updateCurrentWeather(city);
                },
                child: const Text(
                  'Get Weather',
                  style: AppTheme.buttonTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
