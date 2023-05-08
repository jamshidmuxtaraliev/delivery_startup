import 'dart:ui';

import 'package:delivery_startup/generated/assets.dart';
import 'package:delivery_startup/screens/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_widget/motion_widget.dart';
import 'dart:ui' as ui;

import '../../utils/app_colors.dart';
import '../login/login_screen.dart';

class TempLogin extends StatefulWidget {
  @override
  _TempLoginState createState() => _TempLoginState();
}

class _TempLoginState extends State<TempLogin> {
  late MotionExitConfigurations motionExitConfigurations;
  double kDefaultPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          // color: Colors.blue.withOpacity(0.5),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesTemp2),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
            ),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 320,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  shape: BoxShape.rectangle,
                  color: Colors.black.withOpacity(0.35),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15.0,
                      spreadRadius: 15,
                      offset: Offset(0, 0,),
                    ),
                  ],
                ),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(10, 10),
                        blurRadius: 50,
                        color: Colors.blue.withOpacity(0.15),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "KIRISH",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.WHITE,
                              fontFamily: "semibold"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 4),
                        child: Text(
                          "Mobil number",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.GREY_ICON,
                              fontFamily: "semibold"),
                        ),
                      ),
                      Container(
                        // width: 180,
                        height: 65,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          showCursor: true,
                          controller: editText1,
                          style: TextStyle(color: Colors.white),
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue.shade100),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue.shade100,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.blue[25],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 4),
                        child: Text(
                          "Password",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.GREY_ICON,
                              fontFamily: "semibold"),
                        ),
                      ),
                      Container(
                        // width: 180,
                        height: 65,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          showCursor: true,
                          controller: editText1,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white),
                          textInputAction: TextInputAction.done,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue.shade100),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue.shade100,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.blue[25],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Colors.blue.withOpacity(0.23),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (_)=>MainScreen()),
                              );
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(fontSize: 16),
                            )),
                      )
                    ],
                  ),
                ))),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              "Created by BDM.UZ",
              style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: AppColors.GREY_ICON,
                  fontFamily: "semibold"),
            ),
          ),
        )
      ],
    ));
  }
}
