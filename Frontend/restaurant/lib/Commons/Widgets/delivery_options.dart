import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Controllers/cart_controller.dart';
import 'package:restaurant/commons/constants/colors.dart';

class DeliveryOptions extends StatelessWidget {
  final String title;
  final String radioValue;
  final dynamic feeOfDelivery;
  const DeliveryOptions({
    super.key,
    required this.title,
    required this.radioValue,
    required this.feeOfDelivery,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartContoller) {
      return Container(
        margin: EdgeInsets.only(
          bottom: 10.h,
        ),
        color: Colors.white,
        child: ListTile(
          leading: Radio(
            value: radioValue,
            groupValue: cartContoller.radio,
            activeColor: AppColors.mainColor,
            onChanged: (value) {
              cartContoller.setOnRadioOptionsClicked = value!;
              print(cartContoller.radio);
            },
          ),
          title: Text(
            feeOfDelivery != 'free'.tr
                ? '$title (\$$feeOfDelivery)'
                : '$title ($feeOfDelivery)',
            style: robotoRegular.copyWith(
              fontSize: 19.sp,
            ),
          ),
        ),
      );
    });
  }
}
