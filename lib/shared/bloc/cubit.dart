import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/models/id_model.dart';
import 'package:weather_bloc_app/models/weather_model.dart';
import 'package:weather_bloc_app/shared/bloc/states.dart';
import 'package:weather_bloc_app/shared/network/local/cahce_helper.dart';
import 'package:weather_bloc_app/shared/network/remote/dio_helper.dart';
import 'package:weather_bloc_app/shared/network/remote/end_points.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  ConsolidatedWeather? consolidatedWeather;
  IdModel? idModel;

  getWeather(String cityName) {
    emit(WeatherGetWeatherLoadingState());
    DioHelper.getData(
        url: cityIdPoint,
        query: {
          'query': cityName,
        }
    ).then((value){
      idModel = IdModel.fromJson(value.data[0]);
      DioHelper.getData(
          url:  cityWeatherDataPoint + "${idModel!.woeid}/"
      ).then((value){
        consolidatedWeather = ConsolidatedWeather.fromJson(value.data['consolidated_weather'][0]);
        print(consolidatedWeather!.theTemp);
        print(consolidatedWeather!.airPressure);
        print(consolidatedWeather!.maxTemp);
        emit(WeatherGetWeatherSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(WeatherGetWeatherErrorState(error.toString()));
      });

    }).catchError((error){
      print('This is get ID error : ' + error.toString());
      emit(WeatherGetCityIdErrorState());
    });
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangAppMode());
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(ChangAppMode());
      });
    }
  }
}
