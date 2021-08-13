abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherGetWeatherLoadingState extends WeatherStates {}

class WeatherGetCityIdSuccessState extends WeatherStates {}

class WeatherGetCityIdErrorState extends WeatherStates {}

class WeatherGetWeatherSuccessState extends WeatherStates {}

class WeatherGetWeatherErrorState extends WeatherStates {
  final String error;

  WeatherGetWeatherErrorState(this.error);
}

class ChangAppMode extends WeatherStates {}