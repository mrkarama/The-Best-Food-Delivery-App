import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/commons/widgets/spacer.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconTextWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24.sp,
          color: iconColor,
        ),
        horizontalSpacer(
          7.w,
        ),
        Text(
          text,
          style: robotoRegular.copyWith(
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }
}
