import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/pages/searchPage.dart';
import '../bloc/weather_cubit.dart';
import '../models/weather model.dart';
import '../widget/initial_home.dart';
import '../widget/success_pagae.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search),
            ),
          ],
          title: const Text('Weather App'),
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitial) {
                return const InitianPage();
              } else if (state is WeatherLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WeatherSuccess) {
                weatherData=BlocProvider.of<WeatherCubit>(context).weatherModel;
                return  SuccessPage(weatherData: weatherData);
              } else {
                return const Center(
                  child: Text('something went wrong please try again later '),
                );
              }
            }

        )
    );
  }
}

