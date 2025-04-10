import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/WeatherModel.dart';

import '../../services/WeatherServices.dart';


class GetWeatherCubit extends Cubit<WeatherState> {  //create cubit
  GetWeatherCubit() : super(NoWeatherState());

  getWeather({required String cityName}) async{
  try {
    WeatherModel  weatherModel=    // create function
          await  WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
    print(weatherModel.image);
    emit(WeatherLoadedState(weatherModel));

  } catch (e) {
   emit(WeatherFailureState());
  }
  }
}