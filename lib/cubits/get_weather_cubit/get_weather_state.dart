
import 'package:weather_app/models/WeatherModel.dart';

class WeatherState{}  // create state

class NoWeatherState extends WeatherState{}

class WeatherLoadedState extends WeatherState{

  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState{}