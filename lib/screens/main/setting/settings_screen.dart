import 'package:animated_switch/animated_switch.dart';
import 'package:delivery_startup/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBg,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBg,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.TEXT_COLOR2,
            ),
          ),
        ),
        title: Text(
          "Sozlamar oynasi",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.TEXT_COLOR2),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Text(
                    "Mavzu",
                    style: TextStyle(fontSize: 20, color: AppColors.TEXT_COLOR),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.TEXT_COLOR, borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.moon_stars),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Text(
                          "Tun rejimi",
                          style: TextStyle(fontSize: 20, color: AppColors.WHITE),
                        ),
                      ),
                      AnimatedSwitch(
                        width: 80,
                        colorOn: AppColors.LIGHT_NAVY,
                        colorOff: AppColors.COLOR_ACCENT,
                        indicatorColor: Colors.white,
                        iconOff: CupertinoIcons.moon,
                        iconOn: CupertinoIcons.sun_max,
                        textOn: "Tun",
                        textOff: "Kun",
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onChanged: (bool state) {
                          print('turned ${(state) ? 'onn' : 'off'}');
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    "Bildirishnoma",
                    style: TextStyle(fontSize: 20, color: AppColors.TEXT_COLOR),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.TEXT_COLOR, borderRadius: const BorderRadius.all(Radius.circular(12))),
                  child: Row(
                    children: [
                      const Icon(Icons.notifications_active_outlined),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Text(
                          "Bildirishnomalar qabul qilish",
                          style: TextStyle(fontSize: 20, color: AppColors.WHITE),
                        ),
                      ),
                      AnimatedSwitch(
                        width: 80,
                        colorOn: AppColors.LIGHT_NAVY,
                        colorOff: AppColors.COLOR_ACCENT,
                        indicatorColor: Colors.white,
                        iconOff: Icons.notification_add,
                        iconOn: Icons.notifications_off_rounded,
                        textOn: "Ha",
                        textOff: "Yo'q",
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        onChanged: (bool state) {
                          print('turned ${(state) ? 'onn' : 'off'}');
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    "Maxfiylik va xavfsizlik",
                    style: TextStyle(fontSize: 20, color: AppColors.TEXT_COLOR),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.TEXT_COLOR, borderRadius: const BorderRadius.all(Radius.circular(12))),
                  child: Row(
                    children: [
                      const Icon(Icons.notifications_active_outlined),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Text(
                          "Parolni almashtirish",
                          style: TextStyle(fontSize: 20, color: AppColors.WHITE),
                        ),
                      ),
                      Icon(Icons.navigate_next_rounded, size: 28,)
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
