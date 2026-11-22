import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginOrSignupContoller extends GetxController implements GetxService {
  LoginOrSignupContoller() {
    getScrollUrlImages();
  }

  List<List<String>> _listOfScrollUrlImages = [];
  List<List<String>> get listOfScrollUrlImages => _listOfScrollUrlImages;

  void getScrollUrlImages() {
    List<String> scrollUrlImages1 = [];
    List<String> scrollUrlImages2 = [];
    List<String> scrollUrlImages3 = [];
    for (int i = 1; i <= 45; i++) {
      final String url = 'assets/images/food$i.jpg';
      if (i <= 15) {
        scrollUrlImages1.add(url);
      } else if (i > 15 && i <= 30) {
        scrollUrlImages2.add(url);
      } else {
        scrollUrlImages3.add(url);
      }
    }
    _listOfScrollUrlImages = [
      scrollUrlImages1,
      scrollUrlImages2,
      scrollUrlImages3,
    ];
  }

  void animateToMinMax({
    required double max,
    required double min,
    required double direction,
    required Duration duration,
    required ScrollController scrollController,
  }) {
    scrollController
        .animateTo(
      direction,
      duration: duration,
      curve: Curves.linear,
    )
        .then((value) {
      direction = direction == max ? min : max;
      animateToMinMax(
        max: max,
        min: min,
        direction: direction,
        duration: duration,
        scrollController: scrollController,
      );
    });
  }
}
