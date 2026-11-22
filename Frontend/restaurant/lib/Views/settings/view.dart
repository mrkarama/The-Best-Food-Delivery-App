import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Widgets/custom_snackbar.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Controllers/storage_controller.dart';
import 'package:restaurant/Views/localization/view.dart';
import 'package:restaurant/Views/my%20order/widgets/order_app_bar.dart';
import 'package:restaurant/Views/settings/widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: MyOrderAppBar(
          text: 'settings'.tr,
          isBackButton: true,
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () {
                Get.find<StorageController>().saveIsLanguageAlreadySet(false);
                Get.to(
                  const LocalizationPage(),
                );
              },
              child: SettingsTile(
                title: 'change_language'.tr,
              ),
            ),
            InkWell(
              onTap: () {
                CustomSnackbar(
                  'coming_feature_message'.tr,
                  AppColors.mainColor,
                  title: 'coming_feature_title'.tr,
                );
              },
              child: SettingsTile(
                title: 'edit_profile'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
