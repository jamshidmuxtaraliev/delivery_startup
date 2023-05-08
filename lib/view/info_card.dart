import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/style.dart';

class InfoCard extends StatelessWidget {
  final String? assetName, title, amount;
  const InfoCard({Key? key, this.assetName, this.title, this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 200),
      padding: const EdgeInsets.only(top: 20, left: 16, bottom: 16, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.WHITE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: AlignmentDirectional.centerEnd,
            child: SvgPicture.asset(
              assetName!,
              width: 28,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: PrimaryText(
              text: title,
              color: AppColors.secondary,
              fontWeight: FontWeight.w500,
              size: 18,
            ),
          ),
          // const SizedBox(height: 8),
          // PrimaryText(
          //   text: amount,
          //   size: 18,
          //   fontWeight: FontWeight.w700,
          // )
        ],
      ),
    );
  }
}
