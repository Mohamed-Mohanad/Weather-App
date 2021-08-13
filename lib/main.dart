import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/modules/home_screen.dart';
import 'package:weather_bloc_app/shared/bloc/bloc_Observer.dart';
import 'package:weather_bloc_app/shared/bloc/cubit.dart';
import 'package:weather_bloc_app/shared/bloc/states.dart';
import 'package:weather_bloc_app/shared/network/local/cahce_helper.dart';
import 'package:weather_bloc_app/shared/network/remote/dio_helper.dart';
import 'package:weather_bloc_app/shared/style/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  MyApp({this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit(),
      child: BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: WeatherCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: Home(),
          );
        },
      ),
    );
  }
}

