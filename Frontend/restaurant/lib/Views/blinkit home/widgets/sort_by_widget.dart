import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Controllers/blinkit_home_controller.dart';
import 'package:restaurant/commons/constants/colors.dart';

class SortByWidget extends StatelessWidget {
  final String title;
  final String radioValue;

  const SortByWidget({
    super.key,
    required this.title,
    required this.radioValue,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlinkitHomeController>(
      builder: (blinkitHomeController) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: radioValue,
              groupValue: blinkitHomeController.radioValue,
              activeColor: AppColors.mainColor,
              onChanged: (value) {
                blinkitHomeController.setRadioValue = value!;
              },
            ),
            Text(
              title,
              style: blinkitHomeController.radioValue == radioValue
                  ? robotoBold.copyWith(
                      fontSize: 19.sp,
                    )
                  : robotoRegular.copyWith(
                      fontSize: 19.sp,
                    ),
            ),
          ],
        );
      },
    );
  }
}
