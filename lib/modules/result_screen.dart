import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/shared/bloc/cubit.dart';
import 'package:weather_bloc_app/shared/bloc/states.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = WeatherCubit.get(context);

        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: cubit.consolidatedWeather!.getBackGroundColor(),
            ),
            body: Container(
              color: cubit.consolidatedWeather!.getBackGroundColor(),
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                children: [
                  Text(
                    cubit.idModel!.title.toString() +
                        " " +
                        cubit.idModel!.locationType.toString(),
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Colors.black,
                          fontSize: 35.0,
                        ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Updated: " + DateTime.now().toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${cubit.consolidatedWeather!.weatherStateName}",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: Colors.black,
                              fontSize: 30.0,
                            ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Image(
                        height: 100,
                        width: 100,
                        image: AssetImage(
                          cubit.consolidatedWeather!.getImage(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "${cubit.consolidatedWeather!.theTemp!.round()}" + " C",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                  ),
                  Text(
                    "Temperature",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${cubit.consolidatedWeather!.minTemp!.round()}" +
                                " C",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                          ),
                          Text(
                            "Min Temperature",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${cubit.consolidatedWeather!.maxTemp!.round()}" +
                                " C",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                          ),
                          Text(
                            "Max Temperature",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "${cubit.consolidatedWeather!.airPressure!.round()}",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                  ),
                  Text(
                    "Air Pressure",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${cubit.consolidatedWeather!.windSpeed!.round()}",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                          ),
                          Text(
                            "Wind Speed",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${cubit.consolidatedWeather!.windDirection!.round()}" +
                                " ${cubit.consolidatedWeather!.windDirectionCompass}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black, fontSize: 20.0),
                          ),
                          Text(
                            "Wind Direction",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
