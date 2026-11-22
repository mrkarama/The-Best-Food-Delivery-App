import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/constants/colors.dart';

class CancelOrYes extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool? isYes;
  const CancelOrYes({
    super.key,
    required this.text,
    required this.onTap,
    this.isYes = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          color: isYes! ? Colors.redAccent : AppColors.backgroundColor,
          border: Border.all(
            color: isYes! ? Colors.white : AppColors.mainColor,
            width: 2.w,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: robotoMedium.copyWith(
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
