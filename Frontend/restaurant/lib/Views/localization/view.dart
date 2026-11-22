import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class LocalizationPage extends StatelessWidget {
  const LocalizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return SafeArea(
        child: Scaffold(
          key: key,
          backgroundColor: AppColors.backgroundColor,
          bottomNavigationBar: GestureDetector(
            onTap: () {
              if (!Get.find<StorageController>().getAppOpenFirstTime()) {
                Get.find<StorageController>().saveAppOpenFirstTime(true);
                Get.find<StorageController>().saveIsLanguageAlreadySet(true);
              }
              localizationController.setLoadingOnAndGoToNextPage();
            },
            child: Container(
              width: context.screenWidth,
              height: 60.h,
              margin: EdgeInsets.only(
                left: 5.w,
                right: 5.w,
                bottom: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15.r,
                ),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 4,
                    blurRadius: 3,
                    offset: const Offset(0, 5),
                    color: Colors.grey.shade200,
                  )
                ],
                color: AppColors.mainColor,
              ),
              child: localizationController.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Center(
                      child: Text(
                      'save'.tr,
                      style: robotoBold.copyWith(
                        fontSize: 22.sp,
                      ),
                    )),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo part 1.png',
                  width: 180.w,
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo part 2.png',
                  width: 280.w,
                ),
              ),
              verticalSpacer(
                20.h,
              ),
              Text(
                'select_language'.tr,
                style: robotoMedium.copyWith(
                  fontSize: 22.sp,
                ),
              ),
              verticalSpacer(
                10.h,
              ),
              GridView.builder(
                itemCount: 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return LanguageWidget(
                    localizationController: localizationController,
                    index: index,
                  );
                },
              ),
              verticalSpacer(
                20.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                ),
                child: Text(
                  'you_can_change_the_language_later_from_profile_settings'.tr,
                  textAlign: TextAlign.center,
                  style: robotoRegular.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
