import 'dart:async';

import 'package:covid_app/View/home_screen.dart';
import 'package:covid_app/View/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(context as BuildContext,
            MaterialPageRoute(builder: (contex) => World_States())));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Image(image: AssetImage("images/virus.png")),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Covid-19 \n Tracker App",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
