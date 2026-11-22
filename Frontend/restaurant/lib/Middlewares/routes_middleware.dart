import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/constants.dart';
import 'package:restaurant/Controllers/storage_controller.dart';

class RoutesMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  bool appOpenFirstTime = Get.find<StorageController>().getAppOpenFirstTime();

  @override
  RouteSettings? redirect(String? route) {
    if (appOpenFirstTime) {
      return RouteSettings(
        name: AppRouteNames.getWelcomeRoute(),
      );
    }
    return null;
  }
}
