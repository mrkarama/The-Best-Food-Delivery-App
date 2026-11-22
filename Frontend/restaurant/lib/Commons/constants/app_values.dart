import 'package:restaurant/Models/language_model.dart';

class AppValues {
  // static double screenWidth = 411.42857142857144;
  // static double screenHeight = 866.2857142857143;

  static const String cartList = 'CART-LIST';
  static const String cartHistory = 'CART-HISTORY';

  static const String languageCode = 'language code';
  static const String countryCode = 'country code';
  static const String selectedIndex = 'selected index';
  static const String appOpenFirstTime = "app open first time";
  static const String isLanguageAlreadySet = "is language already set";

  static String userAddress = 'USER_ADDRESS';

  static List<LanguageModel> languages = [
    LanguageModel(
      countryCode: 'US',
      coutryFlag: 'xxx',
      languageCode: 'en',
      languageName: 'English',
    ),
    LanguageModel(
      countryCode: 'FR',
      coutryFlag: 'xxx',
      languageCode: 'fr',
      languageName: 'Français',
    ),
  ];

  static const String search = 'PREVIOUS-SEARCH-DATA';
}
