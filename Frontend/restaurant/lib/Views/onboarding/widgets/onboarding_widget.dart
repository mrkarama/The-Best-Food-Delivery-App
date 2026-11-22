import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class OnboardingWidget extends StatelessWidget {
  final String imageUrl;
  final PageController pageController;
  final int length;
  final int pageIndex;
  final List<String> descriptions;
  const OnboardingWidget({
    super.key,
    required this.imageUrl,
    required this.pageController,
    required this.length,
    required this.pageIndex,
    required this.descriptions,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 20.w,
          top: 20.h,
          child: pageIndex == 2
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: () {
                    pageController.jumpToPage(
                      2,
                    );
                  },
                  child: Text(
                    'skip'.tr,
                    style: robotoRegular.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                ),
        ),
        Align(
          alignment: const Alignment(
            0,
            -0.6,
          ),
          child: Image.asset(
            imageUrl,
          ),
        ),
        Positioned(
          left: 20.w,
          top: context.screenHeight / 1.7,
          child: SizedBox(
            width: context.screenWidth / 1.4,
            child: Text(
              descriptions[pageIndex].tr,
              style: robotoRegular.copyWith(
                fontSize: 24.sp,
              ),
            ),
          ),
        ),
        Positioned(
          left: 20.w,
          bottom: context.screenHeight / 20,
          child: AnimatedSmoothIndicator(
            activeIndex: pageIndex,
            count: length,
            axisDirection: Axis.horizontal,
            effect: ExpandingDotsEffect(
              dotHeight: 9.h,
              activeDotColor: AppColors.mainColor,
            ),
            onDotClicked: (int index) {
              if (pageIndex < 2) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              }
            },
          ),
        ),
        Positioned(
          right: 20.w,
          bottom: context.screenHeight / 35,
          child: pageIndex == 2
              ? Container(
                  width: 130.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15.r,
                    ),
                    color: AppColors.mainColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.offNamed(
                        AppRouteNames.getWelcomeRoute(),
                      );
                      //  Get.offNamed(
                      //   AppRouteNames.getLoginSignupRoute(),
                      // );
                    },
                    child: Center(
                      child: Text(
                        'get_started'.tr,
                        maxLines: 1,
                        style: robotoRegular.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: CustomButton(
                    icon: Icons.arrow_forward,
                    radius: 24.r,
                    height: 50,
                    backgroundColor: AppColors.mainColor,
                  ),
                ),
        ),
      ],
    );
  }
}
