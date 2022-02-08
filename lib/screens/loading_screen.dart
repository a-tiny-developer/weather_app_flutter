import 'package:flutter/material.dart';

import '../services/services.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Location.getCurrentWeather(),
          builder: (context, AsyncSnapshot<Weather> snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data?.main ?? "");
            } else {
              return const Text("");
            }
          },
        ),
      ),
    );
  }
}
