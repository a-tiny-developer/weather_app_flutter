import 'package:clima_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/services.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

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
          child: FutureBuilder<CurrentWeather>(
              future: Location.getCurrentWeather(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final temp = snapshot.data!.main.temp;
                  final icon = WeatherModel.getWeatherIcon(temp.toInt());
                  final message = WeatherModel.getMessage(temp.toInt());
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            iconSize: 50,
                            onPressed: () {},
                            icon: const Icon(Icons.near_me),
                          ),
                          IconButton(
                            iconSize: 50,
                            onPressed: () {},
                            icon: const Icon(Icons.location_city),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            '${temp.toStringAsFixed(1)}° $icon',
                            style: AppTheme.tempTextStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          "$message. ${snapshot.data!.name}",
                          textAlign: TextAlign.right,
                          style: AppTheme.messageTextStyle,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: SpinKitDoubleBounce(
                      color: Colors.white,
                      size: 50,
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
