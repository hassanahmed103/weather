import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_cubit.dart';
import '../models/weather model.dart';


class SuccessPage extends StatelessWidget {
  const SuccessPage({
    Key? key,
     required this.weatherData,
  }) : super(key: key);

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherData!.getThemColor(),
              weatherData!.getThemColor()[300]!,
              weatherData!.getThemColor()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
           Text (
          BlocProvider.of<WeatherCubit>(context).cityName! ,
            style:const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at : ${weatherData!.data.hour.toString()}:${weatherData!.data.minute.toString()}',
            style:const TextStyle(
              fontSize: 22,
            ),
          ),
           const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                weatherData!.temp.toInt().toString(),
                style:const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('maxTemp :${weatherData!.maxtemp.toInt()}'),
                  Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
           const Spacer(),
          Text(
            weatherData!.weatherStateName,
            style:  const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const   Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
