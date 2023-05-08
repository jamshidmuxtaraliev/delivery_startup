import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/style.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: CircleAvatar(
                radius: 36.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 34.0,
                  backgroundImage: AssetImage('assets/images/man.jpeg'),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12.0,
                      child: Icon(
                        Icons.camera_alt,
                        size: 15.0,
                        color: Color(0xFF404040),
                      ),
                    ),
                  ),
                ),
              ),
            )),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  const [
              PrimaryText(
                text: "Alijon Valiyev",
                size: 30,
                fontWeight: FontWeight.w800,
              ),
              PrimaryText(
                text: "Delivery StartUp 03",
                size: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.secondary,
              )
            ],
          ),
        ),
        // const Spacer(flex: 1),
        CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.mode_edit_outline_outlined),)
        // Expanded(
        //   flex: 1,
        //   child: TextField(
        //     decoration: InputDecoration(
        //         filled: true,
        //         fillColor: AppColors.WHITE,
        //         contentPadding: const EdgeInsets.only(left: 40, right: 5),
        //         enabledBorder: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(30),
        //             borderSide: BorderSide(color: AppColors.WHITE)),
        //         focusedBorder: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(30),
        //             borderSide:  BorderSide(color: AppColors.WHITE)),
        //         prefixIcon:  Icon(
        //           Icons.search,
        //           color: AppColors.BLACK,
        //         ),
        //         hintText: 'Search',
        //         hintStyle:
        //             const TextStyle(color: AppColors.secondary, fontSize: 14)),
        //   ),
        // )
      ],
    );
  }
}
