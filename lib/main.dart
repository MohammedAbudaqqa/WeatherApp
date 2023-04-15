import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/provider/weather_provider.dart';

import 'Screens/home_page.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // create is a required anonymous function
      // return is the data to be accused and modify
      create: (BuildContext context) { return WeatherProvider(); },
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red
        ),
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        home:HomePage(),
      ),
    );
  }
}
