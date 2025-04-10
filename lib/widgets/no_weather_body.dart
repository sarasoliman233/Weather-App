import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/info_weather_body.dart';

class NoWeather extends StatefulWidget {
  const NoWeather({super.key});

  @override
  State<NoWeather> createState() => _NoWeatherState();
}

class _NoWeatherState extends State<NoWeather> {
  double bottomPosition = -100; // تبدأ خارج الشاشة

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        bottomPosition = bottomPosition == -100 ? 50 : -100; // يتحرك لأعلى ثم لأسفل
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    backgroundColor: Color(0xFF7758D1),
    elevation: 1,
    title: Text('Weather App',style: TextStyle(
    fontSize: 18,
    fontFamily: 'alexandria',
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),),),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7758D1), Color(0xFFF7CBFD)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.2, 0.7],
          ),
        ),
        child: Stack(
          children: [
            // ✅ صورة متحركة من الأسفل للأعلى والعكس
            AnimatedPositioned(
              duration: const Duration(seconds: 1), // سرعة الحركة
              curve: Curves.easeInOut,
              bottom: bottomPosition,
              left: MediaQuery.of(context).size.width / 2 - 150, // توسيط الصورة
              child: Image.asset('assets/images/suun.png', width: 300),
            ),

            // ✅ النصوص فوق الصورة
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(flex: 1),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(38),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(

                      style: TextStyle(color: Colors.white),
                      onFieldSubmitted: (value) async{
                   var getWeatherCubit=     BlocProvider.of<GetWeatherCubit>(context);
                   getWeatherCubit.getWeather(cityName: value);

                      },
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: 'Enter Location',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'alexandria',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),

                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  const Text(
                    'There is no weather \n Start searching now...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'alexandria',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
