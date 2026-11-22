import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';

import '../constants/colors.dart';

class CustomBlinkitLoader extends StatelessWidget {
  const CustomBlinkitLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'blinkit_loader'.tr,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: robotoRegular.copyWith(
            fontSize: 24.sp,
          ),
        ),
        verticalSpacer(
          20.h,
        ),
        CircleAvatar(
          radius: 15.r,
          backgroundColor: Colors.transparent,
          child: CircularProgressIndicator(
            strokeWidth: 2.w,
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppColors.mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
