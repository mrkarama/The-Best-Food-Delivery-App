import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Commons/constants/route_names.dart';
import 'package:restaurant/Commons/widgets/spacer.dart';
import 'package:restaurant/Controllers/welcome_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );

    Timer(
      const Duration(seconds: 3),
      () {
        Get.offNamed(
          AppRouteNames.getLocalizationRoute(),
        );
        Get.find<WelcomeController>().setIsFromSplashScreen = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                'assets/images/logo part 1.png',
                width: 250.w,
              ),
            ),
          ),
          verticalSpacer(
            10.h,
          ),
          Center(
            child: Image.asset(
              'assets/images/logo part 2.png',
              width: 250.w,
            ),
          ),
        ],
      ),
    );
  }
}
