import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/constants/colors.dart';

Widget bigText({
  required String text,
  required FontWeight fontWeight,
  int maxLines = 1,
  Color color = AppColors.mainBlackColor,
  double? height,
}) {
  return Text(
    text,
    maxLines: maxLines,
    textAlign: TextAlign.justify,
    overflow: TextOverflow.ellipsis,
    style: robotoBlack.copyWith(fontSize: 24.sp),
  );
}

Widget mediumText({
  required String text,
  required FontWeight fontWeight,
  int maxLines = 1,
  Color color = Colors.black54,
  double? height,
}) {
  return Text(
    text,
    textAlign: TextAlign.justify,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: robotoMedium.copyWith(
      fontSize: 17.sp,
    ),
  );
}

Widget smallext({
  required String text,
  required FontWeight fontWeight,
  int maxLines = 1,
  Color color = AppColors.textColor,
  double? height,
}) {
  return Text(
    text,
    textAlign: TextAlign.justify,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: robotoRegular.copyWith(fontSize: 14.sp),
  );
}

Widget resizableText({
  required String text,
  required FontWeight fontWeight,
  required double fontSize,
  int maxLines = 1,
  Color color = Colors.black54,
  double? height,
}) {
  return Text(
    text,
    textAlign: TextAlign.justify,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: robotoRegular.copyWith(fontSize: 20.sp),
  );
}
