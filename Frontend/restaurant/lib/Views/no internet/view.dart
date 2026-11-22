import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';
import 'package:restaurant/Commons/constants/route_names.dart';
import 'package:restaurant/Controllers/welcome_controller.dart';
import 'package:restaurant/commons/constants/colors.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/no_internet.png',
              fit: BoxFit.contain,
              color: Colors.redAccent,
              width: 100.w,
            ),
            verticalSpacer(
              35.sp,
            ),
            Text(
              'no_internet_content'.tr,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: robotoRegular.copyWith(
                fontSize: 17.sp,
              ),
            ),
            verticalSpacer(
              20.sp,
            ),
            TextButton(
              onPressed: () async {
                ConnectivityResult result =
                    await Connectivity().checkConnectivity();

                if (result == ConnectivityResult.none) {
                  print('No Internet');
                } else {
                  Get.offNamed(
                    AppRouteNames.getWelcomeRoute(),
                  );
                  Get.find<WelcomeController>().setIsFromSplashScreen = true;
                }
              },
              child: Text(
                'no_internet_title'.tr,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: robotoRegular.copyWith(
                  fontSize: 19.sp,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
