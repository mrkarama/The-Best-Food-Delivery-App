import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class LoginOrSignupPage extends StatefulWidget {
  const LoginOrSignupPage({super.key});

  @override
  State<LoginOrSignupPage> createState() => _LoginOrSignupPageState();
}

class _LoginOrSignupPageState extends State<LoginOrSignupPage> {
  late ScrollController scrollController1;
  late ScrollController scrollController2;
  late ScrollController scrollController3;

  late List<ScrollController> scrollControllerList;
  late TextEditingController numberTextEditingController;

  @override
  void initState() {
    super.initState();

    numberTextEditingController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = scrollController1.position.minScrollExtent;
      double maxScrollExtent1 = scrollController1.position.maxScrollExtent;

      double minScrollExtent2 = scrollController2.position.minScrollExtent;
      double maxScrollExtent2 = scrollController2.position.maxScrollExtent;

      double minScrollExtent3 = scrollController3.position.minScrollExtent;
      double maxScrollExtent3 = scrollController3.position.maxScrollExtent;

      Get.find<LoginOrSignupContoller>().animateToMinMax(
        max: maxScrollExtent1,
        min: minScrollExtent1,
        direction: maxScrollExtent1,
        duration: const Duration(seconds: 30),
        scrollController: scrollController1,
      );

      Get.find<LoginOrSignupContoller>().animateToMinMax(
        max: maxScrollExtent2,
        min: minScrollExtent2,
        direction: maxScrollExtent2,
        duration: const Duration(seconds: 30),
        scrollController: scrollController2,
      );

      Get.find<LoginOrSignupContoller>().animateToMinMax(
        max: maxScrollExtent3,
        min: minScrollExtent3,
        direction: maxScrollExtent3,
        duration: const Duration(seconds: 30),
        scrollController: scrollController3,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          GetBuilder<LoginOrSignupContoller>(builder: (loginOrSignupContoller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.screenHeight / 1.45,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 40.h,
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: -50.w,
                              right: 0,
                              child: SizedBox(
                                height: 150.h,
                                width: context.screenWidth,
                                child: Stack(
                                  children: [
                                    ScrollableWidget(
                                      scrollController: scrollControllerList[0],
                                      scrollUrlImages: loginOrSignupContoller
                                          .listOfScrollUrlImages[0],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 160.h,
                              left: -80.w,
                              right: 0,
                              child: SizedBox(
                                height: 150.h,
                                width: context.screenWidth,
                                child: Stack(
                                  children: [
                                    ScrollableWidget(
                                      scrollController: scrollControllerList[1],
                                      scrollUrlImages: loginOrSignupContoller
                                          .listOfScrollUrlImages[1],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 320.h,
                              left: -65.w,
                              right: 0,
                              child: SizedBox(
                                height: 150.h,
                                width: context.screenWidth,
                                child: Stack(
                                  children: [
                                    ScrollableWidget(
                                      scrollController: scrollControllerList[2],
                                      scrollUrlImages: loginOrSignupContoller
                                          .listOfScrollUrlImages[2],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: context.screenHeight / 1.65,
                              right: context.screenWidth / 2 - 25.w,
                              child: Image.asset(
                                'assets/images/logo.png',
                                width: 60.w,
                                height: 60.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 50.h,
                  ),
                  child: Text("burkina's_largest_rapide_app".tr,
                      style: robotoBold.copyWith(
                        fontSize: 25.sp,
                      )),
                ),
                verticalSpacer(
                  10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(
                          AppRouteNames.getLoginRoute(),
                        );
                      },
                      child: Text(
                        "log_in".tr,
                        style: robotoMedium.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    horizontalSpacer(
                      5.w,
                    ),
                    Text(
                      "or".tr,
                      style: robotoMedium.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                    horizontalSpacer(
                      5.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(
                          AppRouteNames.getRegisterRoute(),
                        );
                      },
                      child: Text(
                        "sign_up".tr,
                        style: robotoMedium.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    scrollController1.dispose();
    scrollController2.dispose();
    scrollController3.dispose();
    numberTextEditingController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scrollController1 = ScrollController();
    scrollController2 = ScrollController();
    scrollController3 = ScrollController();

    scrollControllerList = [
      scrollController1,
      scrollController2,
      scrollController3
    ];
  }
}
//