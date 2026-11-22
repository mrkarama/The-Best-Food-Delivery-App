import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/styles.dart';

// ignore: non_constant_identifier_names
CustomSnackbar(String message, Color color, {String title = 'Error'}) {
  return Get.snackbar(
    title,
    message,
    duration: const Duration(seconds: 1),
    titleText: Text(
      title,
      style: robotoBold.copyWith(fontSize: 20.sp),
    ),
    messageText: Text(
      message,
      style: robotoRegular.copyWith(fontSize: 18.sp),
    ),
    margin: EdgeInsets.only(
      top: 10.h,
      left: 10.w,
      right: 10.w,
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: color,
  );
}
