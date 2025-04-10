import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/Home%20Screen.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  void initState(){
    super.initState();

    _controller =AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation=CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0, 0.0); // يبدأ من خارج الشاشة على اليمين
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );

    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF805BCA),Color(0xFFF8180F3),],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.2, 0.7]
                ),
              ),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 6,),
                  Image.asset('assets/images/snow.png',width: 200,height: 200,),
                  SizedBox(height:35 ,),
                  Text('Weather',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'alexandria',
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),

                  Text('Forecasts',
                    style: TextStyle(
                        fontSize: 45,
                        fontFamily: 'alexandria',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFDDB130)
                    ),),
          Spacer(flex: 5,),
                  // Text('Lets Start ... ',
                  //   style: TextStyle(
                  //       fontSize: 18,
                  //       fontFamily: 'alexandria',
                  //       fontWeight: FontWeight.w700,
                  //       color: Color(0xFFAA92D5)
                  //   ),),
                  Spacer(),
                ],
              ),
            )));
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
