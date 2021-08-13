import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/modules/result_screen.dart';
import 'package:weather_bloc_app/shared/bloc/cubit.dart';
import 'package:weather_bloc_app/shared/bloc/states.dart';
import 'package:weather_bloc_app/shared/components/components.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {
        if (state is WeatherGetWeatherSuccessState) {
          navigateTo(
            context,
            ResultScreen(),
          );
        }
      },
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Know Weather Instantly'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  cubit.changeAppMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: FlareActor(
                        "assets/WorldSpin.flr",
                        fit: BoxFit.contain,
                        animation: "roll",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Search Can Not Be Empty';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          cubit.getWeather(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter City Name',
                          labelText: 'Search',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    state is! WeatherGetWeatherLoadingState
                        ? defaultButton(
                            text: 'Get Weather',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.getWeather(searchController.text);
                              }
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                    if (state is WeatherGetWeatherErrorState ||
                        state is WeatherGetCityIdErrorState)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Invalid City Name',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
