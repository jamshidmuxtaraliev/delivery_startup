import 'package:flutter/material.dart';

import 'app_colors.dart';

class PrimaryText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String? text;
  final double height;

  const PrimaryText({
    Key? key,
    this.text,
    this.fontWeight: FontWeight.w400,
    this.color: AppColors.primary,
    this.size: 20,
    this.height: 1.3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        height: height,
        fontFamily: 'NanumGothic',
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
