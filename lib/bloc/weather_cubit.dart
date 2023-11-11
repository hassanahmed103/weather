import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/weather model.dart';
import '../serives/weather_serives.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherModel? weatherModel;
  WeatherService weatherService;
  String? cityName;

  void getWeather({required String cityName}) async {
    weatherModel = await weatherService.getWeather(cityName: cityName);
    emit(WeatherLoading());
    try {
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
