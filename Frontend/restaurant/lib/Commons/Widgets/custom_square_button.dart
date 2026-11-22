import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double radius;
  final double height;

  const CustomButton({
    Key? key,
    required this.icon,
    this.iconColor = Colors.white,
    this.backgroundColor = AppColors.mainColor,
    required this.radius,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height.w,
      height: height.w,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 24.sp,
          color: iconColor,
        ),
      ),
    );
  }
}
