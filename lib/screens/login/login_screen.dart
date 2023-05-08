import 'package:delivery_startup/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var editText1 = TextEditingController();
var editText2 = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    const double kDefaultPadding = 20.0;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              Container(
                // color: Colors.yellow,
                // margin: const EdgeInsets.only(bottom: kDefaultPadding * 5),
                height: size.height * 0.72,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                      ),
                      height: size.height * 0.45,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          // bottomLeft: Radius.circular(10),
                          // bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          Assets.imagesDeliverLogo3,
                          width: 200,
                          height: 150,
                        ),
                      ),
                    ),
                    Positioned(
                      // bottom: 0,
                      top: 230,
                      left: 0,
                      right: 0,
                      child: Container(
                        // color: Colors.red,
                        // height: 240,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(kDefaultPadding),
                              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 50,
                                    color: Colors.blue.withOpacity(0.23),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.TEXT_COLOR,
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
                                      textInputAction: TextInputAction.next,
                                      textAlign: TextAlign.right,
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
                                      textInputAction: TextInputAction.done,
                                      textAlign: TextAlign.right,
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
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Colors.blue.withOpacity(0.23),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 100),
                                  height: 40,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Forgot password ?",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue, fontFamily: "semibold"),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Created by BDM.UZ",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.PRIMARY_COLOR,
                        fontFamily: "semibold"),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
