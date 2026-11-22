import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final List<String> _unboardingUrlImages = [
    'assets/images/onboard_1.png',
    'assets/images/onboard_2.png',
    'assets/images/onboard_3.png',
  ];

  final List<String> _unboardingDescription = [
    'on_boarding_1_description',
    'on_boarding_2_description',
    'on_boarding_3_description',
  ];

  List<String> get onboardingUrlImages => _unboardingUrlImages;
  List<String> get onboardingDescription => _unboardingDescription;

  int _index = 0;
  int get index => _index;

  set setPageIndex(int index) {
    _index = index;
    update();
  }
}
