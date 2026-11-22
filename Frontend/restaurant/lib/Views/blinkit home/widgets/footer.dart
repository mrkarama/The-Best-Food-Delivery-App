import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: 300.h,
      color: Colors.grey.shade100,
      padding: EdgeInsets.only(
        left: 20.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacer(
            40.h,
          ),
          Text(
            "footer_1".tr,
            style: robotoBlack.copyWith(
              fontSize: 40.sp,
              color: Theme.of(context).disabledColor,
            ),
          ),
          Row(
            children: [
              Text(
                "footer_2".tr,
                style: robotoBlack.copyWith(
                  fontSize: 40.sp,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              horizontalSpacer(
                10.w,
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 45.sp,
              ),
            ],
          ),
          verticalSpacer(
            20.h,
          ),
          Divider(
            thickness: 1,
            endIndent: 20.w,
            color: Colors.black45,
          ),
          verticalSpacer(
            20.h,
          ),
          Text(
            "footer_3".tr,
            style: robotoBlack.copyWith(
              fontSize: 20.sp,
              color: Theme.of(context).disabledColor,
            ),
          ),
        ],
      ),
    );
  }
}
