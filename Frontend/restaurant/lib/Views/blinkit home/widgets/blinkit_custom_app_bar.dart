import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/custom_snackbar.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Commons/constants/constants.dart';
import 'package:restaurant/Controllers/address_controller.dart';
import 'dart:math' as math;

import 'package:restaurant/Controllers/person_controller.dart';

class BlinkitCustomAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const BlinkitCustomAppBar({super.key});

  @override
  State<BlinkitCustomAppBar> createState() => _BlinkitCustomAppBarState();

  @override
  Size get preferredSize => Size(
        Get.context!.width,
        Get.context!.height / 4.9.h,
      );
}

class _BlinkitCustomAppBarState extends State<BlinkitCustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return GetBuilder<PersonController>(builder: (personController) {
        return Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(
                5.h,
              ),
              Text(
                'delivered_in'.tr,
                style: robotoBold.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              // verticalSpacer(
              //   5.h,
              // ),
              locationController.userAddressFromBD.isEmpty
                  ? Text(
                      'enable_location_to_see_delivery_time'.tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: robotoBlack.copyWith(
                        fontSize: 20.sp,
                      ),
                    )
                  : Text(
                      '${math.Random().nextInt(25) + 20} minutes',
                      style: robotoBlack.copyWith(
                        fontSize: 26.sp,
                      ),
                    ),
              GestureDetector(
                onTap: () {
                  if (personController.isUserLogged()) {
                    Get.toNamed(
                      AppRouteNames.getAddressRoute(),
                    );
                  } else {
                    CustomSnackbar(
                      'login_firt_to_choose_location'.tr,
                      AppColors.yellowColor,
                      title: 'Login',
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      locationController.userAddressFromBD.isEmpty
                          ? 'choose_your_location'.tr
                          : locationController.userAddressFromBD,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: robotoRegular.copyWith(
                        fontSize: 17.sp,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 24.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}
