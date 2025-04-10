import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/widgets/appText.dart';
import 'package:weather_app/widgets/info_weather_body.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final currentState = BlocProvider.of<GetWeatherCubit>(context).state;
        if (currentState is WeatherLoadedState) {
          // نرجع لحالة البحث بدل ما نقفل التطبيق
          BlocProvider.of<GetWeatherCubit>(context).emit(NoWeatherState());
          return false;
        }
        // لو أصلًا في حالة البحث، ساعتها خليه يقفل التطبيق
        return true;
      },
      child: Scaffold(
        body: BlocBuilder<GetWeatherCubit, WeatherState>( //integrate cubit
          builder: (context, state) {
            if (state is NoWeatherState) {
              return NoWeather();
            } else if (state is WeatherLoadedState) {
              return infoWeather(weatherModel: state.weatherModel);
            } else {

              return ColoredBox(
                color: const Color(0xFFF8180F3), // اللون الخلفي للشاشة
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: appText(
                      text: 'Oops! Something went wrong',
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
