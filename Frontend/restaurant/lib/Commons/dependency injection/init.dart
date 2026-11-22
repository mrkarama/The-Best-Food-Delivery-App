import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/api_values.dart';
import 'package:restaurant/Commons/constants/app_values.dart';
import 'package:restaurant/Controllers/address_controller.dart';
import 'package:restaurant/Controllers/blinkit_home_controller.dart';
import 'package:restaurant/Controllers/localization_controller.dart';
import 'package:restaurant/Controllers/login_controller.dart';
import 'package:restaurant/Controllers/login_or_sign_up_controller.dart';
import 'package:restaurant/Controllers/payment_controller.dart';
import 'package:restaurant/Controllers/person_controller.dart';
import 'package:restaurant/Controllers/register_controller.dart';
import 'package:restaurant/Controllers/search_controller.dart';
import 'package:restaurant/Controllers/settings_controller.dart';
import 'package:restaurant/Controllers/onborading_controller.dart';
import 'package:restaurant/Controllers/storage_controller.dart';
import 'package:restaurant/Controllers/track_order_controller.dart';
import 'package:restaurant/Data/Api/api_client.dart';
import 'package:restaurant/Data/Repositories/auth_repo.dart';
import 'package:restaurant/Data/Repositories/cart_repo.dart';
import 'package:restaurant/Data/Repositories/blinkit_home_repo.dart';
import 'package:restaurant/Data/Repositories/localization_repo.dart';
import 'package:restaurant/Data/Repositories/location_repo.dart';
import 'package:restaurant/Data/Repositories/order_repo.dart';
import 'package:restaurant/Data/Repositories/search_repo.dart';
import 'package:restaurant/Data/Repositories/user_repo.dart';
import 'package:restaurant/Models/language_model.dart';
import 'package:restaurant/Controllers/popular_controller.dart';
import 'package:restaurant/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Controllers/cart_controller.dart';
import '../../Controllers/cart_history_controller.dart';
import '../../Controllers/recommended_controller.dart';
import '../../Controllers/welcome_controller.dart';

class Dependencies extends GetxService {
  static Future<Map<String, Map<String, String>>> init() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    Get.lazyPut(
      () => sharedPreferences,
    );

    // Apis Injection

    Get.lazyPut(
      () => ApiClient(
        appBaseUrl: ApiValues.appBaseUrl,
        sharedPreferences: Get.find(),
      ),
    );

    // Repositories Injections

    Get.lazyPut(
      () => UserRepository(
        apiClient: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );
    Get.lazyPut(
      () => CartRepository(
        sharedPreferences: Get.find(),
      ),
    );

    Get.lazyPut(
      () => LocationRepository(
        apiClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => HomeRepository(
        apiClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => AuthRepository(
        apiClient: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );

    Get.lazyPut<OrderRepository>(
      () => OrderRepository(
        apiClient: Get.find(),
      ),
    );

    //Controllers Injection

    Get.lazyPut<LoginController>(
      () => LoginController(
        authRepository: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );

    Get.lazyPut<RegisterController>(
      () => RegisterController(
        authRepository: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );

    Get.lazyPut<CartController>(
      () => CartController(
        cartRepository: Get.find(),
      ),
    );

    Get.lazyPut<PaymentController>(
      () => PaymentController(
        orderRepository: Get.find(),
      ),
    );

    Get.lazyPut<CartHistoryController>(
      () => CartHistoryController(
        cartController: Get.find(),
        cartRepository: Get.find(),
      ),
    );

    Get.lazyPut<BlinkitHomeController>(
      () => BlinkitHomeController(
        homeRepository: Get.find(),
      ),
    );

    Get.lazyPut<PersonController>(
      () => PersonController(
        authRepository: Get.find(),
      ),
    );

    Get.lazyPut(
      () => WelcomeController(),
    );

    Get.lazyPut<PopularController>(
      () => PopularController(
        cartController: Get.find(),
      ),
    );

    Get.lazyPut<RecommendedController>(
      () => RecommendedController(),
    );

    Get.lazyPut<LocationController>(
      () => LocationController(
        locationRepository: Get.find(),
        userRepository: Get.find(),
      ),
    );

    Get.lazyPut(
      () => LocalizationRepository(
        sharedPreferences: Get.find(),
      ),
    );

    Get.lazyPut(
      () => LocalizationController(
        localizationRepository: Get.find(),
        sharedPreferences: Get.find(),
      ),
    );

    Get.lazyPut(
      () => SettingsController(),
    );

    Get.lazyPut(
      () => OnboardingController(),
    );

    Get.lazyPut(
      () => StorageService(
        sharedPreferences: Get.find(),
      ),
    );

    Get.lazyPut(
      () => StorageController(
        storageService: Get.find(),
      ),
    );

    Get.lazyPut(
      () => LoginOrSignupContoller(),
    );

    Get.lazyPut(
      () => TrackOrderController(
        userRepository: Get.find(),
      ),
    );

    Get.lazyPut(
      () => SearchRepository(
        sharedPreferences: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ProductsSearchController(
        homeRepository: Get.find(),
        searchRepository: Get.find(),
      ),
    );

    Map<String, Map<String, String>> languages = {};

    for (LanguageModel languageModel in AppValues.languages) {
      final jsonLoadingString = await rootBundle
          .loadString('assets/languages/${languageModel.languageCode}.json');

      Map<String, dynamic> mappedJson = {};
      Map<String, String> json = {};

      mappedJson = jsonDecode(jsonLoadingString);

      mappedJson.forEach((key, value) {
        json[key] = value;
      });

      languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
          json;
    }
    //print(languages);
    return languages;
  }
}
