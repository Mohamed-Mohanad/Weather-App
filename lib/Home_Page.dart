import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'Search_Screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = Provider.of<WeatherProvider>(context).getWeatherModel;
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              "Weather App",
            ),
            actions: <Widget>[
              Builder(
                builder: (BuildContext context) =>
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                  },
                ),
              ),
            ],
          ),
          body: (weatherModel == null) ? Center(
            child: Container(
              child: Text(
                "There is no weather 😔 start searching now 🔍",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),

            ),
          ) : Container(
            padding: const EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  weatherModel.getBackGroundColor()[700],
                  weatherModel.getBackGroundColor()[500],
                  weatherModel.getBackGroundColor()[300],
                ])),
            child: Container(
              width: double.infinity,
              child: ListView(
                children: [
                  Column(
                    children: [
                      Text(
                       weatherModel.cityName,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                      ),
                      Text(
                        'Updated ${TimeOfDay.fromDateTime(weatherModel.dateTime).format(context)}',
                        style: TextStyle(fontSize:15, letterSpacing: .7 ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage: AssetImage(weatherModel.getImage()),
                      ),
                      Text(
                        weatherModel.theTemp.floor().toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                      Column(
                        children: [
                          Text('max temp: ${weatherModel.maxTemp.floor()}'),
                          Text('min temp: ${weatherModel.minTemp.floor()}'),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Text(
                      weatherModel.weatherStatName,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}


