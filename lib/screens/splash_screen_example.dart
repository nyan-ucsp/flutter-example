import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_example/services/navigation_service.dart';

class SplashScreenExample extends StatefulWidget {
  @override
  _SplashScreenExampleState createState() => _SplashScreenExampleState();
}

class _SplashScreenExampleState extends State<SplashScreenExample> {
  double _opacity = 0;
  @override
  void initState() {
    Timer(
        Duration(
          seconds: 2,
        ), () {
      Navigator.pushReplacementNamed(
        context,
        RouteName.flutterExamplesScreen,
      );
    });
    Timer.periodic(const Duration(microseconds: 10), (timer) {
      setState(() {
        _opacity += 0.01;
      });
      if (_opacity >= 1) {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Container(
              child: Column(
                children: [
                  AnimatedOpacity(
                    duration: const Duration(seconds: 2),
                    opacity: double.parse(
                      _opacity.toStringAsFixed(2),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'flutter examples',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Expend your skills',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'from',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'ananda ark',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
