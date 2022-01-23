import 'package:clima_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';

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
          child: Column(
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: const [
                    Text(
                      '32',
                      style: AppTheme.tempTextStyle,
                    ),
                    Text(
                      '☀️',
                      style: AppTheme.conditionTextStyle,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  "It's a time in San Francisco",
                  textAlign: TextAlign.right,
                  style: AppTheme.messageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
