import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/theme_provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/weather_service.dart';

class SearchScreen extends StatelessWidget {
  String _cityName;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: Text(
            "Search City",
          ),

        ),
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Enter City Name',
                  labelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                   icon: Icon(Icons.search),
                    onPressed: () async
                    {
                      WeatherService weatherService = WeatherService();
                      WeatherModel weatherModel = await weatherService.fetchweather(_cityName);
                      Provider.of<WeatherProvider>(context,listen: false).setWeather = weatherModel;
                      Provider.of<ThemeProvider>(context,listen: false).setColor = weatherModel.getThemeColor();
                      Navigator.pop(context);
                    },
                  ),
                ),
                onChanged: (value)
                {
                  _cityName = value;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
