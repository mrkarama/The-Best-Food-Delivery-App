import 'dart:ui';
import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/app_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationRepository extends GetxService {
  final SharedPreferences sharedPreferences;

  LocalizationRepository({required this.sharedPreferences});

  Future<void> saveLanguage(Locale locale) async {
    await sharedPreferences.setString(
        AppValues.countryCode, locale.countryCode!);
    await sharedPreferences.setString(
        AppValues.languageCode, locale.languageCode);
  }

  Future<void> saveSelectedIndex(int index) async {
    await sharedPreferences.setInt(AppValues.selectedIndex, index);
  }
}
