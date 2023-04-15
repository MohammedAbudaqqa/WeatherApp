class WeatherModel {
  String? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherStateName;
  String? icon;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName,
      required this.icon
      });
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0];
    print(jsonData);
    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['day']['avgtemp_c'],
        maxTemp: jsonData['day']['maxtemp_c'],
        minTemp: jsonData['day']['mintemp_c'],
        weatherStateName: jsonData['day']['condition']['text'],
        icon: jsonData['day']['condition']['icon'],
    );
  }
  @override
  String toString() {
    return '============$maxTemp+$minTemp+$icon';
  }
}
