import 'dart:convert';

import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
class WeatherService
{
  Future<int> fetchCityID(String cityName) async
  {
    try {
      http.Response response = await http.get(
          'https://www.metaweather.com/api/location/search/?query=$cityName');
      var jsonMap = jsonDecode(response.body)[0];
      int id = jsonMap['woeid'];
      return id;
    }catch(ex)
    {
      print("This is FetchId $ex");
    }
  }
  Future<WeatherModel> fetchweather(String cityName) async
  {
      int id = await fetchCityID(cityName);
      try {
      http.Response response = await http.get(
          'https://www.metaweather.com/api/location/$id/');
      var jsonMap = jsonDecode(response.body);
      var jsonData = jsonMap['consolidated_weather'][0];
      return WeatherModel(
          cityName: jsonMap['title'],
          maxTemp: jsonData['max_temp'],
          minTemp: jsonData['min_temp'],
          theTemp: jsonData['the_temp'],
          dateTime: DateTime.now(),
          weatherStatName: jsonData['weather_state_name']
      );
    }
    catch(ex){
      print('This Is FetchWeather $ex');
    }
  }
}

