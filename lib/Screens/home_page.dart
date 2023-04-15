import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/Services/weather_services.dart';
import 'package:weatherapp/provider/weather_provider.dart';

import 'search_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold( 
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SearchPage(
                    updateUi: updateUi,
                  );
                },
              ));
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: weatherData == null
          ? Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "There is No  Weather State For Now Go To  Search Icon And  Search ",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.teal
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 20,),
                   Text(
                    weatherData.date!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: NetworkImage('https:${weatherData.icon}'),
                      ),

                      /*   CircleAvatar(
                        backgroundImage: AssetImage('images/doctor2.jpg'),
                        radius: 70,
                      ),*/
                      Text(
                        "${weatherData.temp!.toInt()}",
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          //حولناها ل int عشان ما بدي اياه يجيب فواصل عشرية كثيرة
                          Text('maxTemp : ${weatherData.maxTemp!.toInt()}'),
                          Text('minTemp : ${weatherData.minTemp!.toInt()}'),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherData.weatherStateName!,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
