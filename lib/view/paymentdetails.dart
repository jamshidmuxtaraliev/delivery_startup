import 'package:delivery_startup/view/payment_list_tile.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import '../responsive/size_config.dart';
import '../utils/app_colors.dart';
import '../utils/style.dart';

class PaymentDetailList extends StatelessWidget {
  const PaymentDetailList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: AppColors.iconGray,
                blurRadius: 15,
                offset: Offset(10, 15),
              )
            ],
          ),
          child: Image.asset("assets/card.png"),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
              text: "Recent Activities",
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: "02 mar 2021",
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Column(
          children: List.generate(
              recentActivities.length,
              (index) => PymentListTile(
                    assetname: recentActivities[index]['icon'],
                    amount: recentActivities[index]['label'],
                    title: recentActivities[index]['amount'],
                    status: 'Successfully',
                  )),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
              text: "Upcoming Payments",
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: "02 mar 2021",
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Column(
          children: List.generate(
              upcomingPayments.length,
              (index) => PymentListTile(
                    assetname: upcomingPayments[index]['icon'],
                    amount: upcomingPayments[index]['label'],
                    title: upcomingPayments[index]['amount'],
                    status: 'Pending',
                  )),
        ),
      ],
    );
  }
}
