import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Controllers/cart_controller.dart';

class PaymentOptions extends StatelessWidget {
  final IconData leading;
  final String title;
  final String subTitle;
  final int index;
  const PaymentOptions({
    super.key,
    required this.leading,
    required this.title,
    required this.subTitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<CartController>().setOnPaymentOptionsClicked = index;
      },
      child: GetBuilder<CartController>(builder: (controller) {
        return Container(
          margin: EdgeInsets.only(
            bottom: 10.h,
            top: 15.h,
          ),
          padding: EdgeInsets.only(
            bottom: 5.h,
            top: 5.h,
          ),
          color: Colors.white,
          child: ListTile(
            leading: Icon(
              leading,
              color: Get.find<CartController>().index == index
                  ? AppColors.mainColor
                  : Theme.of(context).disabledColor,
              size: 30.sp,
            ),
            title: Text(
              title,
              style: robotoBold.copyWith(
                fontSize: 20.sp,
              ),
            ),
            subtitle: Text(
              subTitle,
              overflow: TextOverflow.ellipsis,
              style: robotoRegular.copyWith(
                fontSize: 16.sp,
              ),
            ),
            trailing: Get.find<CartController>().index == index
                ? const Icon(
                    Icons.check_circle,
                    color: AppColors.mainColor,
                  )
                : const SizedBox.shrink(),
          ),
        );
      }),
    );
  }
}
