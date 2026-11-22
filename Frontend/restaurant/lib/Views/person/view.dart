import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  void initState() {
    super.initState();
    if (Get.find<PersonController>().isUserLogged()) {
      Get.find<PersonController>().getUserInformation();
    }
  }

  @override
  Widget build(BuildContext context) {
    //Get.find<PersonController>().onLogout();

    return SafeArea(
      child: GetBuilder<PersonController>(
        builder: (personController) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: !personController.isUserLogged()
                ? const SigninToContinue()
                : personController.userInfo.id == -1
                    ? const PersonShimmer()
                    : SingleChildScrollView(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              verticalSpacer(
                                50.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  CustomSnackbar(
                                    'coming_feature_message'.tr,
                                    AppColors.mainColor,
                                    title: 'coming_feature_title'.tr,
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 70.r,
                                  backgroundColor: AppColors.mainColor,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 80.sp,
                                  ),
                                ),
                              ),
                              verticalSpacer(
                                40.h,
                              ),
                              PersonItem(
                                title:
                                    personController.userInfo.name.toString(),
                                circleIcon: Icons.person,
                                circleBackgroundColor: AppColors.mainColor,
                              ),
                              verticalSpacer(
                                25.h,
                              ),
                              PersonItem(
                                title:
                                    personController.userInfo.phone.toString(),
                                circleIcon: Icons.phone,
                                circleBackgroundColor: AppColors.yellowColor,
                              ),
                              verticalSpacer(
                                25.h,
                              ),
                              PersonItem(
                                title:
                                    personController.userInfo.email.toString(),
                                circleIcon: Icons.email,
                                circleBackgroundColor: AppColors.yellowColor,
                              ),
                              verticalSpacer(
                                25.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    AppRouteNames.getAddressRoute(),
                                  );
                                },
                                child: PersonItem(
                                  title: 'fill_in_the_address'.tr,
                                  circleIcon: Icons.place,
                                  circleBackgroundColor: AppColors.yellowColor,
                                ),
                              ),
                              verticalSpacer(
                                25.h,
                              ),
                              InkWell(
                                onTap: () {
                                  CustomSnackbar(
                                    'coming_feature_message'.tr,
                                    AppColors.mainColor,
                                    title: 'coming_feature_title'.tr,
                                  );
                                },
                                child: PersonItem(
                                  title: 'message'.tr,
                                  circleIcon: Icons.message,
                                  circleBackgroundColor: Colors.redAccent,
                                ),
                              ),
                              verticalSpacer(
                                25.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    AppRouteNames.getSettingsRoute(),
                                  );
                                },
                                child: PersonItem(
                                  title: 'settings'.tr,
                                  circleIcon: Icons.settings,
                                  circleBackgroundColor: Colors.redAccent,
                                ),
                              ),
                              verticalSpacer(
                                25.h,
                              ),
                              InkWell(
                                onTap: () {
                                  _showDialog(context);
                                },
                                child: PersonItem(
                                  title: 'log_out'.tr,
                                  circleIcon: Icons.logout,
                                  circleBackgroundColor: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade300,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'log_out'.tr,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: robotoBlack.copyWith(
                  fontSize: 24.sp,
                ),
              ),
              verticalSpacer(
                10.h,
              ),
              Text(
                'are_you_sure_you_want_to_log_out'.tr,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: robotoRegular.copyWith(
                  fontSize: 20.sp,
                ),
              ),
              verticalSpacer(
                30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CancelOrYes(
                    text: 'cancel'.tr,
                    onTap: () {
                      Get.back();
                    },
                    isYes: false,
                  ),
                  horizontalSpacer(
                    20.w,
                  ),
                  CancelOrYes(
                    text: 'yes'.tr,
                    onTap: () {
                      Get.back();
                      Get.find<LocationController>().setAddressList([]);
                      Get.find<LocationController>().setUserAddressFromBD = '';
                      Get.find<LocationController>().removeSharedAddressData();
                      Get.find<PersonController>().onLogout();
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
