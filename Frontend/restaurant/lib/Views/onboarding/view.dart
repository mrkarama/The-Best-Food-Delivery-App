import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:restaurant/Controllers/onborading_controller.dart';
import 'package:restaurant/Views/onboarding/widgets/onboarding_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<OnboardingController>(builder: (onboardingController) {
        return Scaffold(
          body: PageView.builder(
            controller: pageController,
            itemCount: onboardingController.onboardingUrlImages.length,
            scrollDirection: Axis.horizontal,
            physics: onboardingController.index == 2
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            onPageChanged: (int index) {
              onboardingController.setPageIndex = index;
            },
            itemBuilder: (context, index) {
              return OnboardingWidget(
                imageUrl: onboardingController.onboardingUrlImages[index],
                pageController: pageController,
                length: onboardingController.onboardingUrlImages.length,
                pageIndex: onboardingController.index,
                descriptions: onboardingController.onboardingDescription,
              );
            },
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
