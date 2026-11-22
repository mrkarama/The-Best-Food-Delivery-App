import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/app_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  final SharedPreferences sharedPreferences;

  StorageService({
    required this.sharedPreferences,
  });

  Future<void> saveAppOpenFirstTime(bool value) async {
    await sharedPreferences.setBool(AppValues.appOpenFirstTime, value);
  }

  bool getAppOpenFirstTime() {
    return sharedPreferences.getBool(AppValues.appOpenFirstTime) ?? false;
  }

  Future<void> saveIsLanguageAlreadySet(bool value) async {
    await sharedPreferences.setBool(AppValues.isLanguageAlreadySet, value);
  }

  bool getIsLanguageAlreadySet() {
    return sharedPreferences.getBool(AppValues.isLanguageAlreadySet) ?? false;
  }

  // Test Purpose

  void removeAppOpenFirstTime() {
    sharedPreferences.remove(AppValues.appOpenFirstTime);
  }

  void removeIsLanguageAlreadySet() {
    sharedPreferences.remove(AppValues.isLanguageAlreadySet);
  }
}
