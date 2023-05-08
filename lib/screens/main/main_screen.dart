import 'package:animated_switch/animated_switch.dart';
import 'package:delivery_startup/generated/assets.dart';
import 'package:delivery_startup/screens/main/map/map_screen.dart';
import 'package:delivery_startup/screens/main/order_list/order_list_screen.dart';
import 'package:delivery_startup/screens/main/setting/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  var dachik = true;

  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  var screens = [OrderListScreeen(), MapScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.PRIMARY_COLOR,
          elevation: 0,
          title: Text(
            "Delivery 03",
            style: TextStyle(
                fontFamily: "NanumGothic", fontWeight: FontWeight.w600, color: Colors.white, fontSize: 20),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 12),
              child: AnimatedSwitch(
                width: 100,
                colorOn: Colors.green,
                colorOff: AppColors.COLOR_ACCENT,
                indicatorColor: Colors.white,
                iconOff: Icons.lock_open,
                iconOn: Icons.lock,
                textOn: "Faol",
                textOff: "Off",
                textStyle: TextStyle(color: Colors.white, fontSize: 20),
                onChanged: (bool state) {
                  print('turned ${(state) ? 'on' : 'off'}');
                },
              ),
            ),
          ],
        ),
        body: screens[_page],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(color: AppColors.nbarBg, offset: Offset(1, 1), blurRadius: 5, spreadRadius: 3)
          ]),
          child: SalomonBottomBar(
            currentIndex: _page,
            backgroundColor: AppColors.BACGROUND_COLOR,
            onTap: (i) => setState(() => _page = i),
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.list),
                title: Text("Buyurtmalar"),
                selectedColor: AppColors.PRIMARY_COLOR,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.map_outlined),
                title: Text("Xarita"),
                selectedColor: AppColors.PRIMARY_COLOR,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.person_outline),
                title: Text("Profile"),
                selectedColor: AppColors.PRIMARY_COLOR,
              ),
            ],
          ),
        ));
  }
}
