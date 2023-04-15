import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/provider/weather_provider.dart';
import 'package:weatherapp/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search A City"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onChanged: (value) => cityName = value,
            onSubmitted: (value) async {
              cityName = value;
              WeatherService service = WeatherService();

              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              // بدء تخزين البيانات في الاوبجيكت الي في المين تبع ال بروفايدر
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              //جبنا المتغير الي عملناه في weather_provider واكسسنا المتغير واعطناه قية عن طريق الجملة الي تحت
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService();

                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);
                    // بدء تخزين البيانات في الاوبجيكت الي في المين تبع ال بروفايدر
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    //جبنا المتغير الي عملناه في weather_provider واكسسنا المتغير واعطناه قية عن طريق الجملة الي تحت
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              hintText: "Enter City",
              label: Text("Search"),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
