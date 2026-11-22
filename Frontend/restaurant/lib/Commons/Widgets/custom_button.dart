import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtom extends StatelessWidget {
  final double radius;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  const CustomButtom({
    Key? key,
    required this.iconColor,
    required this.radius,
    required this.backgroundColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        size: 24.sp,
        color: iconColor,
      ),
    );
  }
}
