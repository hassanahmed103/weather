import 'package:flutter/material.dart';
class WeatherModel {
  final String data;
  final double temp;
  final double maxtemp;
  final double minTemp;
  final String weatherStateName;
  final CurrentModel current;
  /*
  class Days
  final List<Days> days = data['forecast']['forecastday']
  final ConditionModel condition;
  * */

  /* final String icon;*/

  WeatherModel({
    required this.data,
    required this.temp,
    required this.maxtemp,
    required this.minTemp,
    required this.current,
    required this.weatherStateName,
    /* required this.icon*/
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jisonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      data: data['location']['localtime'].toString(),
      temp: jisonData['avgtemp_c'],
      maxtemp: jisonData['maxtemp_f'],
      current: CurrentModel.fromJison(data['current']),
      minTemp: jisonData['mintemp_c'],
      weatherStateName: data['current']['condition']['text'],
      /*  icon:['condition']['icon'],*/
    );
  }

  @override
  String toString() {
    return 'temp =$temp'
        'maxTemp= $maxtemp'
        'mintemp=$minTemp'
        'weather=$weatherStateName';
  }

  String getImage() {
    if (weatherStateName == 'clear' || weatherStateName == 'light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Have Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||  weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
  MaterialColor  getThemColor() {
    if (weatherStateName == 'clear' || weatherStateName == 'light Cloud') {
      return Colors.orange;
    }
    else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Have Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain') {
      return Colors.yellow;
    } else if (weatherStateName == 'Thunderstorm' ||  weatherStateName == 'Thunder') {
      return Colors.orange;
    } else {
      return Colors.orange;
    }
  }
}

/*
data['current']['condition']['icon']
* */

class CurrentModel {
  final String icon;

  CurrentModel({required this.icon});

  factory CurrentModel.fromJison(dynamic data)  {
    return CurrentModel(
      icon: data['condition']['icon'],
      /*  icon:['condition']['icon'],*/
    );
  }

}


