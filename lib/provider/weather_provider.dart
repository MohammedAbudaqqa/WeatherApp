import 'package:flutter/cupertino.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
   WeatherModel? _weatherData;

   String? cityName;
  set weatherData(WeatherModel? value) {
    _weatherData = value;
    notifyListeners();
  }
  WeatherModel? get weatherData => _weatherData;

}