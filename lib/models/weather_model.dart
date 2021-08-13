import 'package:flutter/material.dart';

class ConsolidatedWeather {
  String? weatherStateName;
  double? minTemp;
  double? maxTemp;
  double? theTemp;
  double? windSpeed;
  double? windDirection;
  String? windDirectionCompass;
  double? airPressure;

  ConsolidatedWeather.fromJson(Map<String, dynamic> json) {
    weatherStateName = json['weather_state_name'];
    minTemp = json['min_temp'];
    maxTemp = json['max_temp'];
    theTemp = json['the_temp'];
    windSpeed = json['wind_speed'];
    windDirection = json['wind_direction'];
    windDirectionCompass = json['wind_direction_compass'];
    airPressure = json['air_pressure'];
  }
  String getImage()
  {
    if(weatherStateName == 'Clear' || weatherStateName == 'Light Cloud'){
      return 'assets/sunny.png';
    }
    else if(weatherStateName == 'Sleet' || weatherStateName == 'Snow' || weatherStateName == 'Hail'){
      return 'assets/snowflake.png';
    }
    else if(weatherStateName == 'Heavy Cloud'){
      return 'assets/cloudy.png';
    }
    else if(weatherStateName == 'Light Rain' || weatherStateName =='Heavy Rain' || weatherStateName == 'Showers'){
      return 'assets/rain.png';
    }
    else if(weatherStateName == 'Thunderstorm'){
      return 'assets/storm.png';
    }
    else{
      return 'assets/sunny.png';
    }
  }

  Color getBackGroundColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.yellow;
    }
    else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    }
    else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    }
    else
    if (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    }
    else if (weatherStateName == 'Thunderstorm') {
      return Colors.deepPurple;
    }
    else {
      return Colors.yellow;
    }
  }
}



