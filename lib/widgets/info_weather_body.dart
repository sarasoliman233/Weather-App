import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/WeatherModel.dart';
import 'package:weather_app/widgets/appText.dart';

class infoWeather extends StatelessWidget {
  const infoWeather({super.key,required this.weatherModel});
  final WeatherModel weatherModel;

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7758D1),
        elevation: 1,
        title: appText(text: 'Weather App', fontSize: 18, color: Colors.white)),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7758D1), Color(0xFFF7CBFD)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.2, 0.7],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // دي اللي بتوسّط الرُو كله
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/images/sun.png', fit: BoxFit.contain),
                  ),
                  SizedBox(width: 15),
                  appText(
                    text: weatherModel.weatherCondition,
                    fontSize: 22,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(height: 12,),
              appText(text:'${weatherModel.temp.round().toString()}°C', fontSize: 33, color: Colors.white),
              SizedBox(height: 12,),
              appText(text:weatherModel.cityName , fontSize: 19, color: Colors.white),
              SizedBox(height: 22,),
              Image.asset('assets/images/house.png',height: 150,width:300,fit: BoxFit.fitWidth,),
              SizedBox(height: 22,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appText(text: 'Max :', fontSize: 22, color: Color(0xFF3670A1)),
                  SizedBox(width: 12,),
                  appText(text: '${weatherModel.maxTemp.round().toString()}°C', fontSize: 19, color: Colors.white),
                  SizedBox(width: 22,),
                  appText(text: 'Min :', fontSize: 22, color: Color(0xFF3670A1)),
                  SizedBox(width: 12,),
                  appText(text: '${weatherModel.minTemp.round().toString()}°C', fontSize: 19, color: Colors.white),

                ],
              ),
              SizedBox(height: 25,),
              appText(text: 'Updated at ${weatherModel.date.hour} : ${weatherModel.date.minute} ', fontSize: 19, color: Colors.white),

            ],
          ),
        ),
      ),
    );
  }
}
DateTime stringToDateTime(String value){
  return DateTime.parse(value);
}