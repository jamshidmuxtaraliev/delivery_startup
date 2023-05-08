import 'dart:ui';

import 'package:delivery_startup/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_widget/motion_widget.dart';
import 'dart:ui' as ui;

import '../login/login_screen.dart';
import '../login/temp_login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late MotionExitConfigurations motionExitConfigurations;

  @override
  void initState() {
    super.initState();

    motionExitConfigurations =
        MotionExitConfigurations(durationMs: 800, displacement: 50);

    Future.delayed(Duration(seconds: 3), () {
      motionExitConfigurations.controller.addStatusListener((status) {
        if (status == AnimationStatus.completed)
          Navigator.pushReplacement(context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => TempLogin()));
      });
      motionExitConfigurations.controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration:  const BoxDecoration(
                image:  DecorationImage(
                  image:  AssetImage(Assets.imagesDeliverMan),
                  fit: BoxFit.cover,
                ),
              ),
              child:  BackdropFilter(
                filter:  ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child:  Container(
                  decoration:  BoxDecoration(color: Colors.black.withOpacity(0.1)),
                ),
              ),
            ),
            Center(
                child: Motion<Row>(
                  mainAxisSize: MainAxisSize.min,
                  exitConfigurations: motionExitConfigurations,
                  children: <Widget>[
                    MotionElement(
                      orientation: MotionOrientation.RIGHT,
                      interval: Interval(0.0, 0.5),
                      child: const Text(
                        "Delivery\nApplication",
                        textAlign: TextAlign.center,
                        style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    MotionElement(
                      child: Image.asset(Assets.imagesDeliverLogo3, width: 110, height: 110,),
                      interval: Interval(0.5, 1.0, curve: Curves.easeOutBack),
                    )
                  ],
                ))
            // Align(
            //   alignment: Alignment.center,
            //     child: Container(
            //       margin: EdgeInsets.symmetric(horizontal: 30),
            //     height: 100,
            //     padding: const EdgeInsets.all(15.0),
            //     decoration:  BoxDecoration(
            //       borderRadius:  BorderRadius.circular(10.0),
            //       shape: BoxShape.rectangle,
            //       color: Colors.black.withOpacity(0.2),
            //       boxShadow: <BoxShadow>[
            //         BoxShadow(
            //           color: Colors.black26,
            //           blurRadius: 5.0,
            //           offset:  Offset(5.0, 5.0),
            //         ),
            //       ],
            //     ),
            //     child:
            // ))
          ],
        ));
  }

}
