import 'package:flutter/cupertino.dart';
import 'package:weather/models/weather%20model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherDate;
  String? cityName;
  set weatherData(WeatherModel? weather){
    _weatherDate=weather;
    notifyListeners();
  }
  WeatherModel? get weatherData => _weatherDate;


}