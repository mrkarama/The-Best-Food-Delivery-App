import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class SigninToContinue extends StatelessWidget {
  const SigninToContinue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/signintocontinue.png',
            width: context.screenWidth * 0.8.w,
          ),
        ),
        verticalSpacer(
          20.h,
        ),
        GestureDetector(
          onTap: () {
            // Get.toNamed(
            //   AppRouteNames.getLoginRoute(),
            // );
            Get.toNamed(
              AppRouteNames.getLoginSignupRoute(),
            );
          },
          child: Container(
            height: 90.h,
            width: context.screenWidth * 0.8.w,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(
                15.r,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  resizableText(
                    text: 'sign_in_here'.tr,
                    fontWeight: FontWeight.normal,
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                  horizontalSpacer(
                    5.w,
                  ),
                  Icon(
                    Icons.login,
                    size: 24.sp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
