import 'package:get/get.dart';

class WelcomeController extends GetxController implements GetxService {
  WelcomeController();

  bool _isFromSplashScreen = false;
  bool get isFromSplashScreen => _isFromSplashScreen;

  set setIsFromSplashScreen(bool value) {
    _isFromSplashScreen = value;
    update();
  }
}
