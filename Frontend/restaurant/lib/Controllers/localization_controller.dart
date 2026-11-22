import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/app_values.dart';
import 'package:restaurant/Commons/constants/route_names.dart';
import 'package:restaurant/Data/Repositories/localization_repo.dart';
import 'package:restaurant/Models/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationController extends GetxController implements GetxService {
  final LocalizationRepository localizationRepository;
  final SharedPreferences sharedPreferences;

  LocalizationController({
    required this.sharedPreferences,
    required this.localizationRepository,
  }) {
    loadCurrentLanguage();
  }

  int _selectedIndex = 0;
  bool _isLoading = false;
  bool _isFromProfilePage = false;
  Locale _locale = Locale(
    AppValues.languages[0].languageCode,
    AppValues.languages[0].countryCode,
  );
  List<LanguageModel> _languages = [];

  int get selectedIndex => _selectedIndex;
  Locale get locale => _locale;
  bool get isLoading => _isLoading;
  bool get isFromPofilePage => _isFromProfilePage;
  List<LanguageModel> get languages => _languages;

  set setSelectedIndex(int index) {
    _selectedIndex = index;
    saveSelectedIndex(index);
    update();
  }

  set setIsFromProfilePage(bool value) {
    _isFromProfilePage = value;
    update();
  }

  Future<void> setLoadingOnAndGoToNextPage() async {
    _isLoading = true;
    update();
    await Future.delayed(const Duration(milliseconds: 1500));

    if (!sharedPreferences.getBool(AppValues.isLanguageAlreadySet)!) {
      Get.back();
    } else if (sharedPreferences.getBool(AppValues.appOpenFirstTime)! ||
        sharedPreferences.getBool(AppValues.isLanguageAlreadySet)!) {
      Get.offNamed(
        AppRouteNames.getOnboardingRoute(),
      );
    }

    _isLoading = false;
    update();
  }

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    saveLanguage(_locale);
    update();
  }

  Future<void> saveLanguage(Locale locale) async {
    await localizationRepository.saveLanguage(locale);
  }

  Future<void> saveSelectedIndex(int index) async {
    await localizationRepository.saveSelectedIndex(index);
  }

  Future<void> loadCurrentLanguage() async {
    _locale = Locale(
      sharedPreferences.getString(AppValues.languageCode) ??
          AppValues.languages[0].languageCode,
      sharedPreferences.getString(AppValues.countryCode) ??
          AppValues.languages[0].countryCode,
    );
    _selectedIndex = sharedPreferences.getInt(AppValues.selectedIndex) ?? 0;
    // for (int index = 0; index < AppValues.languages.length; index++) {
    //   if (AppValues.languages[index] == _selectedIndex) {
    //     _selectedIndex = index;
    //     break;
    //   }
    // }
    _languages = [];
    _languages.addAll(AppValues.languages);
    update();
  }

  String getCountryCode() {
    return sharedPreferences.getString(AppValues.countryCode) ?? 'US';
  }
}
