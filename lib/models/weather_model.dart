import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  final String weatherStatName;
  final double maxTemp;
  final double minTemp;
  final double theTemp;
  final String cityName;
  final DateTime dateTime;

  WeatherModel(
      {
        @required this.dateTime,
        @required this.weatherStatName,
        @required this.maxTemp,
        @required this.minTemp,
        @required this.theTemp,
        @required  this.cityName});
  String getImage()
  {
    if(weatherStatName == 'Clear' || weatherStatName == 'Light Cloud'){
      return 'Images/sunny.png';
    }
    else if(weatherStatName == 'Sleet' || weatherStatName == 'Snow' || weatherStatName == 'Hail'){
      return 'Images/snowflake.png';
    }
    else if(weatherStatName == 'Heavy Cloud'){
      return 'Images/cloudy.png';
    }
    else if(weatherStatName == 'Light Rain' || weatherStatName =='Heavy Rain' || weatherStatName == 'Showers'){
      return 'Images/rain.png';
    }
    else if(weatherStatName == 'Thunderstorm'){
      return 'Images/storm.png';
    }
    else{
      return 'Images/sunny.png';
    }
  }

  getBackGroundColor() {
    if (weatherStatName == 'Clear' || weatherStatName == 'Light Cloud') {
      return Colors.yellow;
    }
    else if (weatherStatName == 'Sleet' || weatherStatName == 'Snow' ||
        weatherStatName == 'Hail') {
      return Colors.blue;
    }
    else if (weatherStatName == 'Heavy Cloud') {
      return Colors.blueGrey;
    }
    else
    if (weatherStatName == 'Light Rain' || weatherStatName == 'Heavy Rain' ||
        weatherStatName == 'Showers') {
      return Colors.blue;
    }
    else if (weatherStatName == 'Thunderstorm') {
      return Colors.deepPurple;
    }
    else {
      return Colors.yellow;
    }
  }

    Color getThemeColor()
    {
      if(weatherStatName == 'Clear' || weatherStatName == 'Light Cloud'){
        return Colors.yellowAccent;
      }
      else if(weatherStatName == 'Sleet' || weatherStatName == 'Snow' || weatherStatName == 'Hail'){
        return Colors.blueAccent;
      }
      else if(weatherStatName == 'Heavy Cloud'){
        return Colors.blueGrey;
      }
      else if(weatherStatName == 'Light Rain' || weatherStatName =='Heavy Rain' || weatherStatName == 'Showers'){
        return Colors.blueAccent;
      }
      else if(weatherStatName == 'Thunderstorm'){
        return Colors.deepPurpleAccent;
      }
      else{
        return Colors.yellowAccent;
      }
    }
}


