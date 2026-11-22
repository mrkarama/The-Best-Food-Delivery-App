import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class OrderSuccessPage extends StatefulWidget {
  const OrderSuccessPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderSuccessPage> createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (paymentController) {
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: context.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    paymentController.status
                        ? Icons.check_circle_outline
                        : Icons.warning_amber_outlined,
                    size: 100.sp,
                    color: AppColors.mainColor,
                  ),
                  verticalSpacer(
                    45.h,
                  ),
                  Text(
                    paymentController.status
                        ? 'you_placed_the_order_successfully'.tr
                        : 'your_order_failed'.tr,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: robotoBlack.copyWith(
                      fontSize: 24.sp,
                    ),
                  ),
                  verticalSpacer(
                    20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: resizableText(
                      text: paymentController.status
                          ? 'successfull_order'.tr
                          : 'failed_order'.tr,
                      fontWeight: FontWeight.normal,
                      fontSize: 22.sp,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  verticalSpacer(20.h),
                  Padding(
                    padding: EdgeInsets.all(
                      20.h,
                    ),
                    child: Center(
                      child: Container(
                        width: context.screenWidth,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(
                            25.r,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.find<WelcomeController>()
                                .setIsFromSplashScreen = false;
                            Get.offAllNamed(
                              AppRouteNames.getWelcomeRoute(),
                            );
                          },
                          child: Center(
                            child: resizableText(
                              text: 'back_to_home'.tr,
                              fontSize: 27.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
