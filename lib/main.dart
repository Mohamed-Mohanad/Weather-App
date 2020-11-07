import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Home_Page.dart';
import 'package:weather_app/Providers/theme_provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';

void main()
{
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherProvider>(
            create: (context) => WeatherProvider()),
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
      ],
      child: WeatherApp()));
}


class WeatherApp extends StatefulWidget {

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  ThemeData customTheme = ThemeData.light();

  changePrimaryColor(Color color)
  {
    setState(() {
      customTheme = ThemeData.light().copyWith(primaryColor: color);
    });

  }

  WeatherProvider weatherProvider = WeatherProvider();

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        theme: ThemeData.light().copyWith(
          primaryColor: Provider.of<ThemeProvider>(context).getColor,
        ),
        home: HomePage(),
      );
  }
}

