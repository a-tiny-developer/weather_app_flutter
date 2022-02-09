import 'package:clima_flutter/router/app_routes.dart';
import 'package:clima_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/services.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    Location.updateCurrentWeather();
    super.initState();
  }

  @override
  void dispose() {
    Location.currentWeatherController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 50,
                      onPressed: () {
                        Location.updateCurrentWeather();
                      },
                      icon: const Icon(Icons.near_me),
                    ),
                    IconButton(
                      iconSize: 50,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.cityScreen,
                        );
                      },
                      icon: const Icon(Icons.location_city),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<CurrentWeather?>(
                  stream: Location.currentWeatherStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.error is StreamBuilderProgress) {
                      return const Spin();
                    }
                    var temp = 0.0;
                    var weatherIcon = '❌';
                    var weatherMessage = "Error";
                    var city = '';
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      temp = data.main.temp;
                      weatherIcon = WeatherModel.getWeatherIcon(
                        data.weather[0].id,
                      );
                      weatherMessage = WeatherModel.getMessage(temp.toInt());
                      city = data.name;
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              '${temp.toStringAsFixed(1)}° $weatherIcon',
                              style: AppTheme.tempTextStyle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            "$weatherMessage.\n$city",
                            textAlign: TextAlign.right,
                            style: AppTheme.messageTextStyle,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Spin extends StatelessWidget {
  const Spin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
// stream: Location.currentWeatherSream,
// builder: (context, snapshot) {
