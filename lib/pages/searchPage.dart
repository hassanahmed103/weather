import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../bloc/weather_cubit.dart';
import '../models/weather model.dart';

import '../provider/weather_provider.dart';

import '../serives/weather_serives.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityName: cityName!);
                BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () async {
                        WeatherService service = WeatherService();
                        WeatherModel? weather =
                            await service.getWeather(cityName: cityName!);
                        Provider.of<WeatherProvider>(context, listen: false)
                            .weatherData = weather;
                        Provider.of<WeatherProvider>(context, listen: false)
                            .cityName = cityName;
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.search)),
                  border: const OutlineInputBorder(),
                  hintText: 'search her',
                  label: const Text('search'),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 24)),
            )),
      ),
    );
  }
}
/*
*   try {
                  WeatherService service = WeatherService();
                  WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false).cityName =
                      cityName;
                  Navigator.pop(context);
                } on Exception catch (e) {
                  // TODO
                }*/
