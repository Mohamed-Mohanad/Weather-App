import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier
{
  WeatherModel _weatherModel ;

  set setWeather(WeatherModel weatherModel)
  {
    this._weatherModel = weatherModel;
    notifyListeners();
  }
  WeatherModel get getWeatherModel => _weatherModel;

}