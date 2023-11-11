import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/weather_cubit.dart';
import 'package:weather/pages/homePage.dart';
import 'package:weather/serives/weather_serives.dart';

void main() {
  runApp(BlocProvider
    (
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel == null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context)
            .weatherModel!
            .getThemColor(),
      ),
      home:HomePage(),
    );
  }
}


